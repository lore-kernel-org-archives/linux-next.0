From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Mon, 15 Apr 2019 14:25:14 +1000
Message-ID: <20190415142514.6ca10bb5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wX+6k_R044lb2vPVfl5Eeod"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Torsten Duwe <duwe@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/wX+6k_R044lb2vPVfl5Eeod
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  mm/kasan/Makefile

between commit:

  e2092740b723 ("kasan: Makefile: Replace -pg with CC_FLAGS_FTRACE")

from the arm64 tree and commit:

  57b78a62e7f2 ("x86/uaccess, kasan: Fix KASAN vs SMAP")

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

diff --cc mm/kasan/Makefile
index f06ee820d356,613dfe681e9f..000000000000
--- a/mm/kasan/Makefile
+++ b/mm/kasan/Makefile
@@@ -5,9 -6,10 +6,10 @@@ UBSAN_SANITIZE_generic_report.o :=3D=20
  UBSAN_SANITIZE_tags.o :=3D n
  KCOV_INSTRUMENT :=3D n
 =20
 -CFLAGS_REMOVE_common.o =3D -pg
 -CFLAGS_REMOVE_generic.o =3D -pg
 -CFLAGS_REMOVE_generic_report.o =3D -pg
 -CFLAGS_REMOVE_tags.o =3D -pg
 +CFLAGS_REMOVE_common.o =3D $(CC_FLAGS_FTRACE)
 +CFLAGS_REMOVE_generic.o =3D $(CC_FLAGS_FTRACE)
++CFLAGS_REMOVE_generic_report.o =3D $(CC_FLAGS_FTRACE)
 +CFLAGS_REMOVE_tags.o =3D $(CC_FLAGS_FTRACE)
 =20
  # Function splitter causes unnecessary splits in __asan_load1/__asan_stor=
e1
  # see: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D63533

--Sig_/wX+6k_R044lb2vPVfl5Eeod
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly0B6oACgkQAVBC80lX
0GyX2gf9Ezi7gad1MlJbVog/pBu5QtRlNTm0FQ3wCKyxWAaRzzZ+Yi10e9eC/QDi
N/GLwmBmNAchgFpXBEn3rOyZZVRVuIH831aeFQKCesOwbQ6IFxY5LUzRlE48Ciov
d01NeWpszocpH/eEsHd7+LdMGqtd3j+1GO9hZkE5U0mCdGe4SekEutdzTIPiPxa+
UGlbhV9v+1D9vwB5kGrd7dyY+EMvGeO18VwiEvh0aPgPwOAqCLTj+HWumwLJB2of
gwQLAi0eZvytYYvjdD/rhsrz1vllglN+MU4aSwDTkNP50kHch0XlePXNfctmt7hi
ZO0WUKvQr1pu5oK9uxSjmMUfxeewfg==
=Ybqa
-----END PGP SIGNATURE-----

--Sig_/wX+6k_R044lb2vPVfl5Eeod--
