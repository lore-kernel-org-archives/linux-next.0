From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mips tree build failure
Date: Wed, 17 Jun 2009 16:35:49 +1000
Message-ID: <20090617163549.84cfc4b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Jun_2009_16_35_49_+1000_68gPaN.muPzkfNVh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37372 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752249AbZFQGfu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Jun 2009 02:35:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__17_Jun_2009_16_35_49_+1000_68gPaN.muPzkfNVh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Yesterday's linux-next build (mips defconfig) failed like this:

arch/mips/lib/delay.c:54: error: 'us' undeclared (first use in this functio=
n)

Caused by commit 5636919b5c909fee54a6ef5226475ecae012ad02 ("MIPS: Outline
udelay and fix a few issues") which is now in Linus' tree (sorry I didn't
report it earlier).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Jun_2009_16_35_49_+1000_68gPaN.muPzkfNVh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko4jsUACgkQjjKRsyhoI8wNHACdEgadS669yowT8ZwI1cUUKuiP
f2EAn17I6yYS4MC/1MD5jDfu2yaxSENn
=vT20
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Jun_2009_16_35_49_+1000_68gPaN.muPzkfNVh--
