From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Fri, 16 Nov 2018 13:19:19 +1100
Message-ID: <20181116131919.781539f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/P0jZk+bujMBoCzwAog_dq=1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/P0jZk+bujMBoCzwAog_dq=1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/blk.h

between commit:

  1adfc5e4136f ("block: make sure discard bio is aligned with logical block=
 size")

from Linus' tree (precedes v4.20-rc2) and commit:

  079076b3416e ("block: remove deadline __deadline manipulation helpers")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc block/blk.h
index 0089fefdf771,027a0ccc175e..000000000000
--- a/block/blk.h
+++ b/block/blk.h
@@@ -380,31 -233,6 +233,16 @@@ static inline void req_set_nomerge(stru
  		q->last_merge =3D NULL;
  }
 =20
- /*
-  * Steal a bit from this field for legacy IO path atomic IO marking. Note=
 that
-  * setting the deadline clears the bottom bit, potentially clearing the
-  * completed bit. The user has to be OK with this (current ones are fine).
-  */
- static inline void blk_rq_set_deadline(struct request *rq, unsigned long =
time)
- {
- 	rq->__deadline =3D time & ~0x1UL;
- }
-=20
- static inline unsigned long blk_rq_deadline(struct request *rq)
- {
- 	return rq->__deadline & ~0x1UL;
- }
-=20
 +/*
 + * The max size one bio can handle is UINT_MAX becasue bvec_iter.bi_size
 + * is defined as 'unsigned int', meantime it has to aligned to with logic=
al
 + * block size which is the minimum accepted unit by hardware.
 + */
 +static inline unsigned int bio_allowed_max_sectors(struct request_queue *=
q)
 +{
 +	return round_down(UINT_MAX, queue_logical_block_size(q)) >> 9;
 +}
 +
  /*
   * Internal io_context interface
   */

--Sig_/P0jZk+bujMBoCzwAog_dq=1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvuKScACgkQAVBC80lX
0GxPlgf/RSEU1vJNGDBzP8W+mpeAWfiVVw16Ff30KnIKVhn/lFviqB2Xfy90fJKy
mdkQ2fL5SdH0k/VJ62D+hHEzuXBH6hsbp0+aKZ9vIh9kdp0JmQ/gflMP4w3wygEp
MtkCGCTJIwLpgJ4rt9lMDFbwHsyYzwGWEf8qws2hqA/7doJnJSB7Nmm8XA571alp
e0tOeyEAsVIoVtae2ACcgrQoC1dvdxZ2xtGD1lIaMTz3OIafOw/14QXiG3+zUNLs
OqrF4DJpTCuMLet6i1pccgxz96bHsor74KMwwmyVaR7YUyT+CGv5BS5CV+18d1ea
VHrybvPjBxp6Hpazanbq+RAL0eWzCg==
=OyZ0
-----END PGP SIGNATURE-----

--Sig_/P0jZk+bujMBoCzwAog_dq=1--
