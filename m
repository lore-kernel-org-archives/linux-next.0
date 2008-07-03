From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Thu, 3 Jul 2008 16:19:23 +1000
Message-ID: <20080703161923.ef48a0c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_16_19_23_+1000_ClRRoPl5JOATKUis"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51812 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755243AbYGCGTb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 02:19:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Jeremy Fitzhardinge <jeremy@goop.org>, Thomas Gleixner <tglx@linutronix.de>

--Signature=_Thu__3_Jul_2008_16_19_23_+1000_ClRRoPl5JOATKUis
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next merge of the kmemcheck tree got a conflict in
include/asm-x86/pgtable.h between commit
4226ab93d8ae3fd895abe45879fe34d489a98718 ("x86: use pteval_t for
_PAGE_FOO") from the x86 tree and commit
385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the kmemcheck
core") from the kmemcheck tree.

I used the former version except I made the UNUSED3 -> HIDDEN change from
the latter.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_16_19_23_+1000_ClRRoPl5JOATKUis
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsb2sACgkQjjKRsyhoI8x8lwCdHLji4ofc97un47ODmt5KMkPf
FDUAoLEO4a4f5tzw6muFeltZbnQ5DDTc
=ShsK
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_16_19_23_+1000_ClRRoPl5JOATKUis--
