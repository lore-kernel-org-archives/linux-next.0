From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the mips
 tree
Date: Wed, 22 Aug 2018 12:02:18 +1000
Message-ID: <20180822120218.44cecef5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lSM8G+AX3PUCj_QUMvAERIk"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Paul Burton <paul.burton@mips.com>
List-Id: linux-next.vger.kernel.org

--Sig_/lSM8G+AX3PUCj_QUMvAERIk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/Kconfig

between commit:

  04f264d3a8b0 ("compiler.h: Allow arch-specific asm/compiler.h")

from the mips tree and commit:

  7358e371b0ef ("arch: enable relative relocations for arm64, power and x86=
")

from the akpm-current tree.

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
index 526a57457594,4426e9687d89..000000000000
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@@ -848,14 -841,16 +848,24 @@@ config REFCOUNT_FUL
  	  against various use-after-free conditions that can be used in
  	  security flaw exploits.
 =20
 +config HAVE_ARCH_COMPILER_H
 +	bool
 +	help
 +	  An architecture can select this if it provides an
 +	  asm/compiler.h header that should be included after
 +	  linux/compiler-*.h in order to override macro definitions that those
 +	  headers generally provide.
 +
+ config HAVE_ARCH_PREL32_RELOCATIONS
+ 	bool
+ 	help
+ 	  May be selected by an architecture if it supports place-relative
+ 	  32-bit relocations, both in the toolchain and in the module loader,
+ 	  in which case relative references can be used in special sections
+ 	  for PCI fixup, initcalls etc which are only half the size on 64 bit
+ 	  architectures, and don't require runtime relocation on relocatable
+ 	  kernels.
+=20
  source "kernel/gcov/Kconfig"
 =20
  source "scripts/gcc-plugins/Kconfig"

--Sig_/lSM8G+AX3PUCj_QUMvAERIk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt8xCoACgkQAVBC80lX
0Gw61gf/eIO4X3jfg8EVTDUf/Y0wSQ7iI9LAqnfsIVF/97Uv6LFdwMJyy3VDW69b
Od8rZYaX360ZAfpr3PvY2iysGF4oh9A93h59nvAuIGcWAor1H7jvAuWu7dCJ4sF6
d3geWuWdr2TRa8niJa4iSwqnHjr/Q5Vs5eaaYIC6z6LDFemBV840bB3E+Ifcv/ZD
UNlSr7fIwWC0Sd6lFSGdSo3zzeBXuouQnsIDmEBZQibTZY2wuOrQB3cOKqI+dE/F
VnYZ1CYe2oEQXoovjRyVjcjv89CNcb5m9lXiQvCG1bCEy1TwRJGjFDrtylt19ANW
a369BfYYINUV8AXr+GLtou1neLBpDg==
=xHax
-----END PGP SIGNATURE-----

--Sig_/lSM8G+AX3PUCj_QUMvAERIk--
