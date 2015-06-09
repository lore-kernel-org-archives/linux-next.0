From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Wed, 10 Jun 2015 00:12:54 +1000
Message-ID: <20150610001254.736fa610@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wRnetFioms8p3h+mrJHAKba"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46536 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753418AbbFIONC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 10:13:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Denys Vlasenko <dvlasenk@redhat.com>

--Sig_/wRnetFioms8p3h+mrJHAKba
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in
arch/x86/entry/entry_64_compat.S between commit 7a5a9824c18f
("x86/asm/entry/32: Remove unnecessary optimization in stub32_clone")
from the tip tree and commit cfb3fabb5c2c ("x86: opt into
HAVE_COPY_THREAD_TLS, for both 32-bit and 64-bit") from the akpm tree.

I fixed it up (they had the same effect on this file, so I just used
the tip tree version) and can carry the fix as necessary (no action is
required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/wRnetFioms8p3h+mrJHAKba
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVdvRrAAoJEMDTa8Ir7ZwVpJwP/2gC2FLNlHiqCQTmTTRDmA8K
Uww9677JXRmsoEIQ3yFiscq7zR16SmmdGGkyXZnzAWckuNGFxPuCHqdRMChnSC6G
1YP3bmNSLQmalAWwwgyo4qjJZRCe1xRe4o7rDsOCf3XZJFDO2uzafxr0IZwg66gY
fchBSADnNTTuv57xl/csRSFNAvSz7GTHyk64MRwJeVXmygZQOxc82da7E0vsONkg
3sxp+8i2xTi6pPgYcRGFWfgkreuHL6sQ9GAWEjrHNm8qn1TOBANVqrX841t8qTQ6
kkWLK6ApIacde2bgWEz4g5hQBxLPTtYGk+yETy6qdCYtOm9QfBVjW3J7Xc3fhapf
70SaDkTqOSCF3Tlkzx0khLHRFfOInvgk2+g7RvULoQVW5wme8SOHTef+DbRBflz0
/62BiqO8C7sDIg46kWvCv2qJahVzHwq7szPWzm7Z99lYxWLrfyEIUiPqfjPJR51j
Dg84lKxePYD5hqCgMcG89x28lP3x1UP/a2VSm/rFQSuiqyf/OI69a6+cbmNLj04K
RVskekdhetgeWM45a819Gm1R0gpHzquMkd0dwhMWwmg3uy3rlVy6fRfdIwMb6Hka
U+gDjIqFP0KFkyYxJP3bVbenDSps1S24AJR29Fhxppa5E+coFdQtyvH+2pMR7EvB
U/BCyIvs1WsQ68Tkhl/Z
=ynq8
-----END PGP SIGNATURE-----

--Sig_/wRnetFioms8p3h+mrJHAKba--
