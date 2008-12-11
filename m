From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree
Date: Thu, 11 Dec 2008 13:43:07 +1100
Message-ID: <20081211134307.b7ce748d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Dec_2008_13_43_07_+1100_sp4GVRy8pv0IGHl7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39129 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752798AbYLKCnW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 21:43:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>, Eric Miao <eric.miao@marvell.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Thu__11_Dec_2008_13_43_07_+1100_sp4GVRy8pv0IGHl7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the mtd tree got conflicts in
arch/arm/mach-pxa/corgi.c, arch/arm/mach-pxa/poodle.c and
arch/arm/mach-pxa/spitz.c between commits
4a9295ccb43ead9ec054d0bd374c992c692b2cf4 ("[ARM] pxa/corgi: add physmap
mapping for ROM"), 431a2cff07446b0325ec063e5b401ca7c11e0058 ("[ARM]
pxa/poodle: add physmap mapping for ROM") and
e5d3bf3c106c0557199076a57800adb85206c1ce ("[ARM] pxa/spitz: add physmap
mapping for ROM") from the arm tree and commit
6af7a8eb1eb2b5a0967fccf61e750b085d60ad48 ("[MTD] sharpsl-nand: move
registration to board code") from the mtd tree.

They seem to be overlapping changes.  Can you guys rationalise this,
please, as I am in no position to fix these conflicts up.

I have dropped the mtd tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Dec_2008_13_43_07_+1100_sp4GVRy8pv0IGHl7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklAfjsACgkQjjKRsyhoI8xy4ACeMLWoh05u8rHG+s1B1QC/9N4g
lhgAnR1uGzsrHS6nR2j6nVojRjD5lj4t
=CaN3
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Dec_2008_13_43_07_+1100_sp4GVRy8pv0IGHl7--
