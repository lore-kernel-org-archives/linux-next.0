From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 arm64-acpi tree
Date: Thu, 26 Mar 2015 19:49:22 +1100
Message-ID: <20150326194922.7325fc21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uGTEG92Yy1Rd8E5WY.REsBb"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59114 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751413AbbCZItd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2015 04:49:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Al Stone <al.stone@linaro.org>

--Sig_/uGTEG92Yy1Rd8E5WY.REsBb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
arch/arm64/Kconfig between commit dbdacfa963f7 ("ARM64 / ACPI: Select
ACPI_REDUCED_HARDWARE_ONLY if ACPI is enabled on ARM64") from the
arm64-acpi tree and commit cbc0632906e6 ("mm: split ET_DYN ASLR from
mmap ASLR") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/Kconfig
index 8b965e2769eb,34f487d5d84e..000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -1,9 -1,7 +1,9 @@@
  config ARM64
  	def_bool y
 +	select ACPI_GENERIC_GSI if ACPI
 +	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
- 	select ARCH_BINFMT_ELF_RANDOMIZE_PIE
  	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
+ 	select ARCH_HAS_ELF_RANDOMIZE
  	select ARCH_HAS_GCOV_PROFILE_ALL
  	select ARCH_HAS_SG_CHAIN
  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST

--Sig_/uGTEG92Yy1Rd8E5WY.REsBb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVE8gbAAoJEMDTa8Ir7ZwVeSgP/R4CsE+H5oXNvlzY2GEuRc5D
cpq65wM0rwNQDmQdUoqxybMXlBUd43bfmJxyIF0KI15YMCvfcwQiudUAKVMioSq4
7HV8mIZRI5exiC7Z5oxvlvz20cgUCsZ3lTKRkZurf30TLJYHd1xG86AfVQWH86nC
LRRq+IxN3ZmJDcWR1IXzZ+pidx/qNoRSxH31WnhmNEyidF2FWNXOsXotOLGsqMNw
U4qmMtEmOi73ynr20ipt3oby6DTjlGejL+SIaSIZ3etVvtBPZtuQYM+DABvtCO1V
/RFRpUirNYNZDjb7cAqyMEDEWL76YSQDmOJKiWjE+JlFQvrKn3vnZjZ3i9LYM3Eq
NUsXvWWGsdDQochzBJpHzUW6TejUlJ1yh8OwYYa4hJBBWGc2/d4T5dbMX81qN2IX
oDkFTSmYv9LyW1vgPxTwf4Bk9rwAnaVVI6RX4kLS+jZrj6au/xhBNajMqdAt+JvN
fIlx73gQ7PybncnDg8t2IzokaovbPbYhvuo3PllozN5zfiP4JqZLLTLkP6pXcZrX
Vjq/8hnkcLRo4kjkpRnK2NDL/qHT3knCDNiXu+bZAtXlc/q0Qw/Q1FP3pCzlgWXX
ShCjYPtveAnEOhELpzOOHx7uYKaT890PF2KrMv2ULCwf3UEragU4K7CbC6tzeeVY
5QyQYuThF6SNavnLfn6y
=8ABg
-----END PGP SIGNATURE-----

--Sig_/uGTEG92Yy1Rd8E5WY.REsBb--
