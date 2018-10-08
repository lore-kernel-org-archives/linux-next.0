From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree with the
 compiler-attributes tree
Date: Tue, 9 Oct 2018 10:13:16 +1100
Message-ID: <20181009101316.61ab0868@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OZ40gKq.MaOLhvnMPRBW3dI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/OZ40gKq.MaOLhvnMPRBW3dI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  include/linux/compiler-gcc.h

between commits:

  5c67a52f3da0 ("Compiler Attributes: always use the extra-underscores synt=
ax")
  a3f8a30f3f00 ("Compiler Attributes: use feature checks instead of version=
 checks")

from the compiler-attributes tree and commit:

  65bdf3bbf56e ("compiler: introduce __no_sanitize_address_or_inline")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This is
now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your
tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/compiler-gcc.h
index cfac027e1625,997ade08a79d..000000000000
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@@ -147,7 -201,27 +147,14 @@@
  #define KASAN_ABI_VERSION 3
  #endif
 =20
 -#if GCC_VERSION >=3D 40902
 -/*
 - * Tell the compiler that address safety instrumentation (KASAN)
 - * should not be applied to that function.
 - * Conflicts with inlining: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=
=3D67368
 - */
 -#define __no_sanitize_address __attribute__((no_sanitize_address))
 -#ifdef CONFIG_KASAN
++#if (GCC_VERSION >=3D 40902) && defined(CONFIG_KASAN)
+ #define __no_sanitize_address_or_inline					\
+ 	__no_sanitize_address __maybe_unused notrace
+ #else
+ #define __no_sanitize_address_or_inline inline
+ #endif
 -#endif
+=20
  #if GCC_VERSION >=3D 50100
 -/*
 - * Mark structures as requiring designated initializers.
 - * https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html
 - */
 -#define __designated_init __attribute__((designated_init))
  #define COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW 1
  #endif
 =20

--Sig_/OZ40gKq.MaOLhvnMPRBW3dI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu75IwACgkQAVBC80lX
0GwUcAf9ElqlYEEQKHZtVoRq3hNCyhODoYcgeCLW91emNWo6OKgXIzz02TxfqvXQ
RyvqB02vRGwVd8ju6M/3bhAC1sJHb964x/kE9N7JdvmBhMy5N1Qm8PqmKG83Bzix
+zU1JX6PfWfSxLg3ADzOIzaiw/n+1Zi0O8n2O+tP/PUPa+wQwhM7+PBapEVPhDch
MYL+YanQvDBqkSpvRYq9rsRKawO2ikr6IK/Td9n03PNGWHT1up//elO9dhg+cb51
sJz2z6dVMSrEd5L5UbS/QM1ug+iusZyXwKMTMUFReEHFIwTQ0XynarTxAv2Dan1j
3smBx+d1Q1dmcFQke2xmkFFc1O0zfA==
=9TYY
-----END PGP SIGNATURE-----

--Sig_/OZ40gKq.MaOLhvnMPRBW3dI--
