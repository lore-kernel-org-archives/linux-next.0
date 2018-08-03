From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with the kbuild tree
Date: Fri, 3 Aug 2018 17:30:20 +1000
Message-ID: <20180803173020.6ec4014b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/m2GtnMjyRP9inw_CV6krOjD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-next.vger.kernel.org

--Sig_/m2GtnMjyRP9inw_CV6krOjD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

Today's linux-next merge of the kspp tree got a conflict in:

  arch/Kconfig

between commit:

  22471e1313f2 ("kconfig: use a menu in arch/Kconfig to reduce clutter")

from the kbuild tree and commit:

  45332b1bdfdc ("gcc-plugins: split out Kconfig entries to scripts/gcc-plug=
ins/Kconfig")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/Kconfig
index 6cf1b17a8df2,43f315b84c8f..000000000000
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@@ -984,4 -836,4 +847,6 @@@ config REFCOUNT_FUL
 =20
  source "kernel/gcov/Kconfig"
 =20
+ source "scripts/gcc-plugins/Kconfig"
++
 +endmenu

--Sig_/m2GtnMjyRP9inw_CV6krOjD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltkBIwACgkQAVBC80lX
0Gzfegf/VTsI9WALVx0KBWcF5tGdv5ZG4SEG9mLmguyn6Q5qOQQYKR0201wuG+I9
/lJI6bgK3QCLXRILt/5Eso6KAUkGRE5rXXquilHUViClvHGPBHRmb+M1XZy6GmlK
BwT2dDzifwHOdONfm8wu/W3JkAwE/pfwWheIJ1earW4OV0RDBfwjv5gnPrEMkygW
vWbuVhmH/abQnelHVH7QqhdoyFxCcoVTYHgaxYBua4xexYwFhrFruxJuClYYNaBg
9KD7VCasxCtFRhU8qh9CIWZUCBJbY+PJKBcgB5raLGezQK3DdOW1V5yrPZQ3XniH
fArKnRKojRhPR5B80oh7si8PO4HbQw==
=FnS+
-----END PGP SIGNATURE-----

--Sig_/m2GtnMjyRP9inw_CV6krOjD--
