From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the block tree
Date: Wed, 1 May 2019 17:05:28 +1000
Message-ID: <20190501170528.2d86d133@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j8scqH+9aWZlWLslHF3vj3c"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Gao Xiang <gaoxiang25@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/j8scqH+9aWZlWLslHF3vj3c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/erofs/data.c
  drivers/staging/erofs/unzip_vle.c

between commit:

  2b070cfe582b ("block: remove the i argument to bio_for_each_segment_all")

from the block tree and commit:

  14a56ec65bab ("staging: erofs: support IO read error injection")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/staging/erofs/data.c
index 9f04d7466c55,c64ec76643d4..000000000000
--- a/drivers/staging/erofs/data.c
+++ b/drivers/staging/erofs/data.c
@@@ -17,11 -17,18 +17,17 @@@
 =20
  static inline void read_endio(struct bio *bio)
  {
+ 	struct super_block *const sb =3D bio->bi_private;
 -	int i;
  	struct bio_vec *bvec;
- 	const blk_status_t err =3D bio->bi_status;
+ 	blk_status_t err =3D bio->bi_status;
  	struct bvec_iter_all iter_all;
 =20
+ 	if (time_to_inject(EROFS_SB(sb), FAULT_READ_IO)) {
+ 		erofs_show_injection_info(FAULT_READ_IO);
+ 		err =3D BLK_STS_IOERR;
+ 	}
+=20
 -	bio_for_each_segment_all(bvec, bio, i, iter_all) {
 +	bio_for_each_segment_all(bvec, bio, iter_all) {
  		struct page *page =3D bvec->bv_page;
 =20
  		/* page is already locked */
diff --cc drivers/staging/erofs/unzip_vle.c
index 59b9f37d5c00,a2e03c932102..000000000000
--- a/drivers/staging/erofs/unzip_vle.c
+++ b/drivers/staging/erofs/unzip_vle.c
@@@ -843,14 -844,13 +844,12 @@@ static void z_erofs_vle_unzip_kickoff(v
 =20
  static inline void z_erofs_vle_read_endio(struct bio *bio)
  {
- 	const blk_status_t err =3D bio->bi_status;
+ 	struct erofs_sb_info *sbi =3D NULL;
+ 	blk_status_t err =3D bio->bi_status;
 -	unsigned int i;
  	struct bio_vec *bvec;
- #ifdef EROFS_FS_HAS_MANAGED_CACHE
- 	struct address_space *mc =3D NULL;
- #endif
  	struct bvec_iter_all iter_all;
 =20
 -	bio_for_each_segment_all(bvec, bio, i, iter_all) {
 +	bio_for_each_segment_all(bvec, bio, iter_all) {
  		struct page *page =3D bvec->bv_page;
  		bool cachemngd =3D false;
 =20

--Sig_/j8scqH+9aWZlWLslHF3vj3c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzJRTgACgkQAVBC80lX
0GwE4gf+Mpm+qnKSJT7tBje9yeq/xbwDiknnJrgV+GukcWJeAt3F91KiTQ+SZkjN
rL5gpg5jg/Msz32nkfcr/2LFHAgnZIEwFg84K26tMFWm0XZ9ALOKnEPgS2M8Rc1J
BXhM/YwDJ2ONn/ZK30Y3tyrmfRlHbQpDDZi9lvTLo6x8YADT3LoghSEFj5Rgj+6C
3U2AZlE+ZMzn3yzNmm8wD2WYr26OIgCXBa0Ezw91yuGReD7uSujKiR2vzOgF9+k0
4Ut8Y2/qguqzupKsqRa8ACWV/kG0l5H998j7CK87QQMiAO68sB0UEF4Iu/BAvixJ
iLrZmiOfbQNk29cz3mFx4sTiMGBnVA==
=OYUP
-----END PGP SIGNATURE-----

--Sig_/j8scqH+9aWZlWLslHF3vj3c--
