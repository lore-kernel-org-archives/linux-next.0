From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the mips-fixes tree
Date: Fri, 29 Jun 2018 09:46:49 +1000
Message-ID: <20180629094649.7b07c105@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H5SGwxAQR3IJPVy27cngqGl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>
List-Id: linux-next.vger.kernel.org

--Sig_/H5SGwxAQR3IJPVy27cngqGl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/kernel/process.c

between commit:

  b63e132b6433 ("MIPS: Use async IPIs for arch_trigger_cpumask_backtrace()")

from the mips-fixes tree and commit:

  8c8d953c2800 ("MIPS: Schedule on CPUs we need to lose FPU for a mode swit=
ch")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/mips/kernel/process.c
index 9670e70139fd,fe6001d748cf..000000000000
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@@ -29,7 -29,7 +29,8 @@@
  #include <linux/kallsyms.h>
  #include <linux/random.h>
  #include <linux/prctl.h>
 +#include <linux/nmi.h>
+ #include <linux/cpu.h>
 =20
  #include <asm/asm.h>
  #include <asm/bootinfo.h>

--Sig_/H5SGwxAQR3IJPVy27cngqGl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls1c2kACgkQAVBC80lX
0GzeFQgAofOO+fgBPL2RwvXKhV7Rj0jSVcrfhUll5BSwGuyLuEWgkhm67KpJqydP
tGb4IoUGrTQ5CVzg51iQRS+qZfl3yGZMyzG/4iAEgJN+uOAY2Ovk13RnLjTANr34
hlTPWlvGa4gSW2WJk2Ay41xAQhywdgolsPZPuQrbQrn+uUqkVoCR9z+lKGNmDKiF
FqGqQs7NXAXkqPpKhHqJ48sMQBK8fTtA1jA2daM/HX8O9YgRQA1mdYudfyVz2QPV
0uobmdAanvcuNTSbMiYDfQj1vnRZrrhMQ/fTHgsjHagBkgeakEaF7m1bJ6lCnJyM
6jGX5WWocK2/PJLFXkfYaBDiF3LhSw==
=xKOi
-----END PGP SIGNATURE-----

--Sig_/H5SGwxAQR3IJPVy27cngqGl--
