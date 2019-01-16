From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the fscrypt tree
Date: Wed, 16 Jan 2019 13:25:22 +1100
Message-ID: <20190116132522.1b756433@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NvUAs=meH/sMEJp+jrWm.nU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NvUAs=meH/sMEJp+jrWm.nU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/ext4/readpage.c

between commit:

  acc9eb0a6073 ("ext4: add fs-verity read support")

from the fscrypt tree and commit:

  eb754eb2a953 ("block: allow bio_for_each_segment_all() to iterate over mu=
lti-page bvec")

from the block tree.

I fixed it up (see below - the former moved the code modified by the
latter) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ext4/readpage.c
index 0b353a0634f3,e53639784892..000000000000
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@@ -61,124 -56,6 +61,125 @@@ static inline bool ext4_bio_encrypted(s
  #endif
  }
 =20
 +/* postprocessing steps for read bios */
 +enum bio_post_read_step {
 +	STEP_INITIAL =3D 0,
 +	STEP_DECRYPT,
 +	STEP_VERITY,
 +};
 +
 +struct bio_post_read_ctx {
 +	struct bio *bio;
 +	struct work_struct work;
 +	unsigned int cur_step;
 +	unsigned int enabled_steps;
 +};
 +
 +static void __read_end_io(struct bio *bio)
 +{
 +	struct page *page;
 +	struct bio_vec *bv;
 +	int i;
++	struct bvec_iter_all iter_all;
 +
- 	bio_for_each_segment_all(bv, bio, i) {
++	bio_for_each_segment_all(bv, bio, i, iter_all) {
 +		page =3D bv->bv_page;
 +
 +		/* PG_error was set if any post_read step failed */
 +		if (bio->bi_status || PageError(page)) {
 +			ClearPageUptodate(page);
 +			SetPageError(page);
 +		} else {
 +			SetPageUptodate(page);
 +		}
 +		unlock_page(page);
 +	}
 +	if (bio->bi_private)
 +		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
 +	bio_put(bio);
 +}
 +
 +static void bio_post_read_processing(struct bio_post_read_ctx *ctx);
 +
 +static void decrypt_work(struct work_struct *work)
 +{
 +	struct bio_post_read_ctx *ctx =3D
 +		container_of(work, struct bio_post_read_ctx, work);
 +
 +	fscrypt_decrypt_bio(ctx->bio);
 +
 +	bio_post_read_processing(ctx);
 +}
 +
 +static void verity_work(struct work_struct *work)
 +{
 +	struct bio_post_read_ctx *ctx =3D
 +		container_of(work, struct bio_post_read_ctx, work);
 +
 +	fsverity_verify_bio(ctx->bio);
 +
 +	bio_post_read_processing(ctx);
 +}
 +
 +static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
 +{
 +	/*
 +	 * We use different work queues for decryption and for verity because
 +	 * verity may require reading metadata pages that need decryption, and
 +	 * we shouldn't recurse to the same workqueue.
 +	 */
 +	switch (++ctx->cur_step) {
 +	case STEP_DECRYPT:
 +		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
 +			INIT_WORK(&ctx->work, decrypt_work);
 +			fscrypt_enqueue_decrypt_work(&ctx->work);
 +			return;
 +		}
 +		ctx->cur_step++;
 +		/* fall-through */
 +	case STEP_VERITY:
 +		if (ctx->enabled_steps & (1 << STEP_VERITY)) {
 +			INIT_WORK(&ctx->work, verity_work);
 +			fsverity_enqueue_verify_work(&ctx->work);
 +			return;
 +		}
 +		ctx->cur_step++;
 +		/* fall-through */
 +	default:
 +		__read_end_io(ctx->bio);
 +	}
 +}
 +
 +static struct bio_post_read_ctx *get_bio_post_read_ctx(struct inode *inod=
e,
 +						       struct bio *bio,
 +						       pgoff_t index)
 +{
 +	unsigned int post_read_steps =3D 0;
 +	struct bio_post_read_ctx *ctx =3D NULL;
 +
 +	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
 +		post_read_steps |=3D 1 << STEP_DECRYPT;
 +#ifdef CONFIG_FS_VERITY
 +	if (inode->i_verity_info !=3D NULL &&
 +	    (index < ((i_size_read(inode) + PAGE_SIZE - 1) >> PAGE_SHIFT)))
 +		post_read_steps |=3D 1 << STEP_VERITY;
 +#endif
 +	if (post_read_steps) {
 +		ctx =3D mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
 +		if (!ctx)
 +			return ERR_PTR(-ENOMEM);
 +		ctx->bio =3D bio;
 +		ctx->enabled_steps =3D post_read_steps;
 +		bio->bi_private =3D ctx;
 +	}
 +	return ctx;
 +}
 +
 +static bool bio_post_read_required(struct bio *bio)
 +{
 +	return bio->bi_private && !bio->bi_status;
 +}
 +
  /*
   * I/O completion handler for multipage BIOs.
   *

--Sig_/NvUAs=meH/sMEJp+jrWm.nU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+lhMACgkQAVBC80lX
0GwFNQf+JCtgpfzQTW7gsQzb5syKDYH6gI/l6aGiws6qDefqPb32lAJmjRxAZOSk
2D+T9GiZV1bpK8+XxrM/I46tYI/qeCgJwlFwO/qFE0Zl2/lsdidRvhuC0MIj3H0g
+9LnZLSn2w+IbWbeq5xbfVTdbO71xmlYw3A+3SrJBhsDx2UkJkl/R9VENLCrWfkK
92rfhnSMJ8dtoOH2SwihZnecdxXzDFTduzH33p3/DzJa4f39DNuSFGiW+r6CZxHn
oRGXaqLQTio+utjFU1U7u3hfBHyDggXJXBeYT1wkVPovaLvEHEZolqR8I/cZ5xQo
9uGWudHYBJotvMagxGl0xhYZrM9N2Q==
=EqWE
-----END PGP SIGNATURE-----

--Sig_/NvUAs=meH/sMEJp+jrWm.nU--
