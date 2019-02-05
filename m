From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the mips-fixes tree
Date: Wed, 6 Feb 2019 09:17:36 +1100
Message-ID: <20190206091736.73bd95ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XXTD5u49pk6W=n13DKfhCzR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Paul Burton <paul.burton@mips.com>, Huang Pei <huangpei@loongson.cn>
List-Id: linux-next.vger.kernel.org

--Sig_/XXTD5u49pk6W=n13DKfhCzR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got conflicts in:

  arch/mips/include/asm/barrier.h
  arch/mips/include/asm/pgtable.h

between commit:

  e02e07e3127d ("MIPS: Loongson: Introduce and use loongson_llsc_mb()")

from the mips-fixes tree and commits:

  535113896e80 ("MIPS: Add GINVT instruction helpers")
  82f4f66ddf11 ("MIPS: Remove open-coded cmpxchg() in set_pte()")

from the mips tree.

I fixed it up (see below and for the latter file, I used the mips tree
version but wondered if cmpxchg() needs the fixups from the mips-fixes
tree commit) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging. You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/mips/include/asm/barrier.h
index b7f6ac5e513c,b48ee2caf78d..000000000000
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@@ -222,42 -236,11 +236,47 @@@
  #define __smp_mb__before_atomic()	__smp_mb__before_llsc()
  #define __smp_mb__after_atomic()	smp_llsc_mb()
 =20
 +/*
 + * Some Loongson 3 CPUs have a bug wherein execution of a memory access (=
load,
 + * store or pref) in between an ll & sc can cause the sc instruction to
 + * erroneously succeed, breaking atomicity. Whilst it's unusual to write =
code
 + * containing such sequences, this bug bites harder than we might otherwi=
se
 + * expect due to reordering & speculation:
 + *
 + * 1) A memory access appearing prior to the ll in program order may actu=
ally
 + *    be executed after the ll - this is the reordering case.
 + *
 + *    In order to avoid this we need to place a memory barrier (ie. a sync
 + *    instruction) prior to every ll instruction, in between it & any ear=
lier
 + *    memory access instructions. Many of these cases are already covered=
 by
 + *    smp_mb__before_llsc() but for the remaining cases, typically ones in
 + *    which multiple CPUs may operate on a memory location but ordering i=
s not
 + *    usually guaranteed, we use loongson_llsc_mb() below.
 + *
 + *    This reordering case is fixed by 3A R2 CPUs, ie. 3A2000 models and =
later.
 + *
 + * 2) If a conditional branch exists between an ll & sc with a target out=
side
 + *    of the ll-sc loop, for example an exit upon value mismatch in cmpxc=
hg()
 + *    or similar, then misprediction of the branch may allow speculative
 + *    execution of memory accesses from outside of the ll-sc loop.
 + *
 + *    In order to avoid this we need a memory barrier (ie. a sync instruc=
tion)
 + *    at each affected branch target, for which we also use loongson_llsc=
_mb()
 + *    defined below.
 + *
 + *    This case affects all current Loongson 3 CPUs.
 + */
 +#ifdef CONFIG_CPU_LOONGSON3_WORKAROUNDS /* Loongson-3's LLSC workaround */
 +#define loongson_llsc_mb()	__asm__ __volatile__(__WEAK_LLSC_MB : : :"memo=
ry")
 +#else
 +#define loongson_llsc_mb()	do { } while (0)
 +#endif
 +
+ static inline void sync_ginv(void)
+ {
+ 	asm volatile("sync\t%0" :: "i"(STYPE_GINV));
+ }
+=20
  #include <asm-generic/barrier.h>
 =20
  #endif /* __ASM_BARRIER_H */
diff --cc arch/mips/include/asm/pgtable.h
index 910851c62db3,6c13c1d44045..000000000000
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h

--Sig_/XXTD5u49pk6W=n13DKfhCzR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxaC4AACgkQAVBC80lX
0GwktQf+NHMvhV4u4QOPoJGuHgHdQ5sWm44t4VZoLjQfYKDyggWvQG60erao0q37
WFWFbSx3aJR0R2KzMareFVzy+7p5vJbegJ2qqroNsR10t2sYo9TATDKofyykeEwA
bxFWyJzCBSOB3yzUAne0Z+W9biYuta2K+bNxJLv/KRny0y+Jyh7r2+HXq0Rpi5hj
KgOFbVVXZhWLeE1+MaJKDiF3V6ZvZN83WlJ96e1OMCjpDVEQB9griX8BpJA+FaXW
7DqkNr1uQXOsFCS28IuSwsk5jVEWSZ2Ochyo8chDL6thSagaj/9I50Pw1eAXdgLQ
WWUl6CMaNjGxCVXhjxYBGfkbqu0pUw==
=z9ev
-----END PGP SIGNATURE-----

--Sig_/XXTD5u49pk6W=n13DKfhCzR--
