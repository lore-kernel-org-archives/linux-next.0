From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the mips tree
Date: Mon, 13 Apr 2015 15:59:13 +1000
Message-ID: <20150413155913.28eace15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/reZfXj4u4qWNN.sYyOXHqxs"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34574 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751184AbbDMF7X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 01:59:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Jiri Olsa <jolsa@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>

--Sig_/reZfXj4u4qWNN.sYyOXHqxs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
tools/perf/config/Makefile between commit 4fd6ce055817 ("perf tools:
Hook up MIPS unwind and dwarf-regs in the Makefile") from the mips tree
and commit 3bc3374cc50c ("perf build: Add perf regs objects building")
from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc tools/perf/config/Makefile
index 0d0595e1ece8,59a98c643240..000000000000
--- a/tools/perf/config/Makefile
+++ b/tools/perf/config/Makefile
@@@ -43,13 -47,10 +50,17 @@@ ifeq ($(ARCH),arm64
    LIBUNWIND_LIBS =3D -lunwind -lunwind-aarch64
  endif
 =20
 +# Additional ARCH settings for MIPS
 +ifeq ($(ARCH),mips)
 +  ARCH_SUPPORTS_LIBUNWIND :=3D 1
 +  NO_PERF_REGS :=3D 0
 +  LIBUNWIND_LIBS =3D -lunwind -lunwind-mips
 +endif
 +
+ ifeq ($(NO_PERF_REGS),0)
+   $(call detected,CONFIG_PERF_REGS)
+ endif
+=20
  # So far there's only x86 and arm libdw unwind support merged in perf.
  # Disable it on all other architectures in case libdw unwind
  # support is detected in system. Add supported architectures

--Sig_/reZfXj4u4qWNN.sYyOXHqxs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK1s3AAoJEMDTa8Ir7ZwVn1IP/Aw3BGSxwso7vLygC58RCoHX
pB12WsQpOpKdSDgIAKNM68pPGV70g0jEE55loreD69ImtXFX7L/kDQTSqgHdeVWv
K7kqHwsNe2Bt5InjlNK4zyJFmADnLIqbQoU4r2Yo8K5PF2aLjKW5Q/vnSeUVIhdN
ai9GoAA59WRoNwlyWXWkMy4ga/S1WvXgWj1RP9hXG0OO064lQbI5G2tNjbUGli/R
ofUWhARlI0dktPlWBANaVPF07Csm5BhYS/AsspsQGbcEPjAqc9PUb92WZCbtxZn5
Qugj46YWnoTWSJ4AmiLtAQiTHjOr48y1fGFqdQbFdBg5r0kqB5Gq9pRg/hTXHfQ2
/Q6R8raPXRea8Cd9oE8jKvmRcD2Mik5z41XZ1eEud5YRgY7ZfK0OPf2Ty8QppGqr
hhiDSTDXLyDjVcc6MJd7L//LkGVIeoiQ6upcf/Vv+RtSBDyUiDbNksczvgHzC2jF
UaW8yxZUI7ol7bFACRXkO/ccF/8PO3Y814Mb5W2EliYuRo6mTe9zt1oeXmzQXKI/
IJloiGkb3n9aqwH0nznSvKj/1DfmfLkFax1dEzoGOpG7Lp96RpY4SZz6a1eL0bp9
6+rnrYPT96AKPFPoYC/OlVoYkFrnJ14dKvoCRkomEuV7hYJH8ZTFK3py5qiYz3ok
mOhzs7o1vejGRE6l/zUR
=qCFx
-----END PGP SIGNATURE-----

--Sig_/reZfXj4u4qWNN.sYyOXHqxs--
