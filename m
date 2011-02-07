From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with Linus' tree
Date: Mon, 7 Feb 2011 15:08:02 +1100
Message-ID: <20110207150802.4869bd47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Feb_2011_15_08_02_+1100_/Vt213cPf1UUj6ZP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43814 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754361Ab1BGEIJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Feb 2011 23:08:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andiry Xu <andiry.xu@amd.com>, Alex He <alex.he@amd.com>

--Signature=_Mon__7_Feb_2011_15_08_02_+1100_/Vt213cPf1UUj6ZP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/host/ehci-pci.c between commit
baab93afc2844b68d57b0dcca5e1d34c5d7cf411 ("USB: EHCI: ASPM quirk of ISOC
on AMD Hudson") from Linus' tree and commit
b7d5b439b7a40dd0a0202fe1c118615a3fcc3b25 ("USB host: Move AMD PLL quirk
to pci-quirks.c") from the usb tree.

I just use the version from the usb tree, but this may need fixing up in
pci-quirks.c.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Feb_2011_15_08_02_+1100_/Vt213cPf1UUj6ZP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNT3AiAAoJEDMEi1NhKgbsv9cIAJPixP1CcDbHWoD8F688SMvy
yEejCi2GesIFuy+/V2UsM38fmnO4A0/bQ9Jcp81KWO8dwo+8Dt7Y+jKNN1Bc/JQv
DJl/+yAjjf1UrTD6E129ahI2h/ycw8wZ3zKZOpJu+fcbQx0EQ7gScL5bV+gPeOLq
lf6ADvFdFVJAGVkxBOspaQ5Qk6WdkBdBNvfoXM4o1z65EB2E3ONGlbZQo3asgOhM
pIb7NgQAUknyuLop4F8115idBlDv9aV3E3vWuMgyvcJrOdDKu30lFkuQ1x0IXMHL
TZ5NwIZigzMzbdR2kXkNVHuSb9hRqEFS8QXxw5hn5hvLaDhZOrtdit5ep41kMoY=
=VTJJ
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Feb_2011_15_08_02_+1100_/Vt213cPf1UUj6ZP--
