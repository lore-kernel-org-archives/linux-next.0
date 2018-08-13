From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Date: Mon, 13 Aug 2018 17:51:59 +1000
Message-ID: <20180813175159.36ac9d4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3xpNZz+aZJ.spS6dSKHENiH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Coly Li <colyli@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/3xpNZz+aZJ.spS6dSKHENiH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  drivers/md/bcache/Kconfig
  drivers/md/bcache/util.h

between commits:

  bc81b47e828a ("bcache: prefer 'help' in Kconfig")
  fc2d5988b597 ("bcache: add identifier names to arguments of function defi=
nitions")

from the block tree and commit:

  fbb43f40e27b ("bcache: use routines from lib/crc64.c for CRC64 calculatio=
n")

from the akpm-current tree.

I fixed it up (see below, and the latter removed some fo the lines changed
by fc2d5988b597) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/md/bcache/Kconfig
index 817b9fba50db,af247298409a..000000000000
--- a/drivers/md/bcache/Kconfig
+++ b/drivers/md/bcache/Kconfig
@@@ -1,7 -1,8 +1,8 @@@
 =20
  config BCACHE
  	tristate "Block device as cache"
+ 	select CRC64
 -	---help---
 +	help
  	Allows a block device to be used as cache for other devices; uses
  	a btree for indexing and the layout is optimized for SSDs.
 =20
diff --cc drivers/md/bcache/util.h
index 4e0ed19e32d3,a1579e28049f..000000000000
--- a/drivers/md/bcache/util.h
+++ b/drivers/md/bcache/util.h
@@@ -543,11 -543,26 +544,27 @@@ dup:								=09
  #define RB_PREV(ptr, member)						\
  	container_of_or_null(rb_prev(&(ptr)->member), typeof(*ptr), member)
 =20
+ static inline uint64_t bch_crc64(const void *p, size_t len)
+ {
+ 	uint64_t crc =3D 0xffffffffffffffffULL;
+=20
+ 	crc =3D crc64_be(crc, p, len);
+ 	return crc ^ 0xffffffffffffffffULL;
+ }
+=20
+ static inline uint64_t bch_crc64_update(uint64_t crc,
+ 					const void *p,
+ 					size_t len)
+ {
+ 	crc =3D crc64_be(crc, p, len);
+ 	return crc;
+ }
+=20
  /* Does linear interpolation between powers of two */
 -static inline unsigned fract_exp_two(unsigned x, unsigned fract_bits)
 +static inline unsigned int fract_exp_two(unsigned int x,
 +					 unsigned int fract_bits)
  {
 -	unsigned fract =3D x & ~(~0 << fract_bits);
 +	unsigned int fract =3D x & ~(~0 << fract_bits);
 =20
  	x >>=3D fract_bits;
  	x   =3D 1 << x;

--Sig_/3xpNZz+aZJ.spS6dSKHENiH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltxOJ8ACgkQAVBC80lX
0GzhLgf/YwenefNkdfPupRsyfFi1WWskIrr6txGnLQEVD0xJtox55DEvrVAMg/15
6q/7i4N6pQyUzOPPTXw2XZnIM9Df5s41AD7YxtFVJA+mjhD0dChMFTxjHvnunwmP
rTSu85uOianwSS2niES/UVGFyselHdxseZvMPKVi5efGU9Edv3fH1DFf8wVTla7H
UjpjG1FaDRkQjjPApZRwWOGwt2WjJDwGJGNFcJn2l0T8WtZs+8a7Md6l+y9ZRgTA
4FP0U5mGUaGEPHcdbv37/W0RzwiRKo1nW6qzPKpwWrCpfSjUIUYxqGAsOUf7LcT8
1Woo0S39vIT5WCLGgBVohtM6mr+/7g==
=kJRt
-----END PGP SIGNATURE-----

--Sig_/3xpNZz+aZJ.spS6dSKHENiH--
