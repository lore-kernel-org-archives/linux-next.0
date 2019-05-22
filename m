From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pidfd tree with Linus' tree
Date: Wed, 22 May 2019 11:01:15 +1000
Message-ID: <20190522110115.7350be3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9FpqtZ5yD8iO3LD4WECjyjC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Brauner <christian@brauner.io>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>
List-Id: linux-next.vger.kernel.org

--Sig_/9FpqtZ5yD8iO3LD4WECjyjC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  tools/testing/selftests/pidfd/Makefile

between commit:

  ec8f24b7faaf ("treewide: Add SPDX license identifier - Makefile/Kconfig")

from Linus' tree and commit:

  233ad92edbea ("pidfd: add polling selftests")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/pidfd/Makefile
index 443fedbd6231,8d97cb35fca4..000000000000
--- a/tools/testing/selftests/pidfd/Makefile
+++ b/tools/testing/selftests/pidfd/Makefile
@@@ -1,7 -1,6 +1,7 @@@
 +# SPDX-License-Identifier: GPL-2.0-only
- CFLAGS +=3D -g -I../../../../usr/include/
+ CFLAGS +=3D -g -I../../../../usr/include/ -lpthread
 =20
- TEST_GEN_PROGS :=3D pidfd_test
+ TEST_GEN_PROGS :=3D pidfd_test pidfd_open_test
 =20
  include ../lib.mk
 =20

--Sig_/9FpqtZ5yD8iO3LD4WECjyjC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzkn1sACgkQAVBC80lX
0Gzw9Af9E8+ptOFJWEcj9CvgKhaBwlug3cjhqiEcxYdTnLmbKU6B9vlyYvSEnnn+
hVm4Z0TZnXThT3bQcUo+euYoa5zXiTckwjjFW4zHwM0VXO/hhmI74d6d8RiVGzqQ
2tOn0X+wN+MagiE/E/tSh7aKBiQtX4r80Bq2u+hbZccRcI191QtdH6QsMPl7usYY
wVNP/fWo9iQaqOw4QRJ8aoTo9eqGQU/QEaUaXRaHJ6HW+MoclVfBCvxbZm22EhgI
u7tWOYAsxH7dQmUIRHi7TmzLLpJ2ULJd8e4E8tyA23Ro5FW4xpgPhdSVo/lUpmVf
Vros2xs/BUn1i0OivT2cNIRbKxvOiw==
=4Q4U
-----END PGP SIGNATURE-----

--Sig_/9FpqtZ5yD8iO3LD4WECjyjC--
