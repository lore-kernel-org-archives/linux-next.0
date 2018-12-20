From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kbuild tree
Date: Thu, 20 Dec 2018 15:57:56 +1100
Message-ID: <20181220155756.52a49829@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0BAu8TO/WPePY_5xpeRdHwh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/0BAu8TO/WPePY_5xpeRdHwh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  Makefile

between commits:

  65bba0423ecf ("kbuild: fix UML build error with CONFIG_GCC_PLUGINS")
  059bc9fc375e ("kbuild: make 'archprepare' depend on 'scripts'")
  ce2fd53a10c7 ("kbuild: descend into scripts/gcc-plugins/ via scripts/Make=
file")

from the kbuild tree and commit:

  6ac389346e69 ("Revert "kbuild/Makefile: Prepare for using macros in inlin=
e assembly code to work around asm() related GCC inlining bugs"")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Makefile
index 6ae8a5382d5d,885c74b192f9..000000000000
--- a/Makefile
+++ b/Makefile
@@@ -1104,12 -1104,9 +1104,10 @@@ prepare2: prepare3 outputmakefile asm-g
  prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelea=
se.h
  	$(cmd_crmodverdir)
 =20
- macroprepare: prepare1 archmacros
-=20
- archprepare: archheaders archscripts macroprepare scripts
 -archprepare: archheaders archscripts prepare1 scripts_basic
++archprepare: archheaders archscripts prepare1 scripts
 =20
 -prepare0: archprepare gcc-plugins
 +prepare0: archprepare
 +	$(Q)$(MAKE) $(build)=3Dscripts/mod
  	$(Q)$(MAKE) $(build)=3D.
 =20
  # All the preparing..

--Sig_/0BAu8TO/WPePY_5xpeRdHwh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwbIVQACgkQAVBC80lX
0Gy4eQgAnX0GejxgKTDls2aCJcoce3Pyyc1tYENRHS3qJR1z/c+a+c+NOKPc3zxP
WtzWqb7LEzMaEbDHMO8jV+FMbL2tSMp9TP7Lum5wDA2V2MfBPLc988xqX9WFLpSm
kx3WIswrd0rfFX6/9C1rEga5gZhfooIezoSBOw7a2BVzAylKIxhR5pzb8e+GJU/q
LDvjBMwv0eYsaNoK2hO9ZrVib/4pXI7/y4vy0USjO+d7lIGqHMM1PQEu1ZFd0IDi
47fTwjrhEGHF3L0pvr5EWg6rNfE9lu3MDkfJPjdNGRvbVo3polLk+599BAmhGo07
tBTMnIxAXjgUr6ve+S98+meAmMxpFw==
=21V6
-----END PGP SIGNATURE-----

--Sig_/0BAu8TO/WPePY_5xpeRdHwh--
