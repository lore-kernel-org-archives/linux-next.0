From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 15 Apr 2019 13:06:08 +1000
Message-ID: <20190415130608.02fabb3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=J8r8IqDgri+FzYRlvZxeQ7"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/=J8r8IqDgri+FzYRlvZxeQ7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  include/linux/bvec.h

between commit:

  1200e07f3ad4 ("block: don't use for-inside-for in bio_for_each_segment_al=
l")

from Linus' tree and commit:

  52d52d1c98a9 ("block: only allow contiguous page structs in a bio_vec")

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

diff --cc include/linux/bvec.h
index 3bc91879e1e2,44b0f4684190..000000000000
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@@ -156,8 -151,8 +151,8 @@@ static inline void bvec_advance(const s
  {
  	struct bio_vec *bv =3D &iter_all->bv;
 =20
 -	if (bv->bv_page) {
 +	if (iter_all->done) {
- 		bv->bv_page =3D nth_page(bv->bv_page, 1);
+ 		bv->bv_page++;
  		bv->bv_offset =3D 0;
  	} else {
  		bv->bv_page =3D bvec->bv_page;

--Sig_/=J8r8IqDgri+FzYRlvZxeQ7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyz9SEACgkQAVBC80lX
0Gxv8Qf9HviITxbq1Z99gQvQYXLk/ueVvIET4kSn0+uHxpmVPv2VGvYzhxJSeTrM
qXNk3LhSDkK5hsRppwZVUr046VW730r2ZgFZM/kwsyJidlf1BPhLJP8r7H6quGN6
ROloInRb0awkKlYfl0UjMkWnmFvQnStyu2IkL8cW7rhTPt4fgUXGB/2sfTZw+g/J
Iqj/f/XPufg4AsuZ+HlElg5+pMKRNB13eg4Go46wUlRqujdF9dGMm6wwA0uG43SN
kKUvRA568jhn0kkFwCikQ0kZw1/ncAxYNDzPrx09YNoLtz/1s5mpi9Kn7Ri9gzyf
AZJnqjze2CIV9x2jo0VfwmBtl6qKaw==
=z3TK
-----END PGP SIGNATURE-----

--Sig_/=J8r8IqDgri+FzYRlvZxeQ7--
