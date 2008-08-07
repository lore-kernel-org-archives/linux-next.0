From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree
Date: Thu, 7 Aug 2008 13:35:25 +1000
Message-ID: <20080807133525.8901e2ef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_Aug_2008_13_35_25_+1000_xCwd=yIU09AlQG/o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59235 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752931AbYHGDff (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Aug 2008 23:35:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Austin Zhang <austin.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Thu__7_Aug_2008_13_35_25_+1000_xCwd=yIU09AlQG/o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in
include/asm-x86/cpufeature.h between commit
32e1d0a0651004f5fe47f85a2a5c725ad579a90c ("x64, x2apic/intr-remap: cpuid
bits for x2apic feature") from the x86 tree and commit
1f4f8a5d7935c81b5b3c7601ec9ac021db30ba4f ("crypto: crc32c - Use Intel
CRC32 instruction") from the crypto tree.

Just simple overlapping additions.  I added both of them and can carry
the fixup.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_Aug_2008_13_35_25_+1000_xCwd=yIU09AlQG/o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiabX0ACgkQjjKRsyhoI8ySmwCeN8lEbTrMHMyAKi2cuNy9cQEB
PUIAn1ZwUGCeqdbMdn3T24PVdzaD9qP1
=Wc/u
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Aug_2008_13_35_25_+1000_xCwd=yIU09AlQG/o--
