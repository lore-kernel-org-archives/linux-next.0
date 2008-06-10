From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm/mtd merge conflict
Date: Tue, 10 Jun 2008 17:58:54 +1000
Message-ID: <20080610175854.94796ca4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Jun_2008_17_58_54_+1000_9vcN1bCT3OPTjaFZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60767 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751246AbYFJH7F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 03:59:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, =?UTF-8?B?IkjDpXZhcmQgU2tpbm5lbW9lbiI=?= <haavard.skinnemoen@atmel.com>, Andrew Victor <linux@maxim.org.za>

--Signature=_Tue__10_Jun_2008_17_58_54_+1000_9vcN1bCT3OPTjaFZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell, David,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/mach-at91/board-yl-9200.c between commit
3c3796cc32b6e53653a5eb868dc959b8c2779db9 ("[MTD] [NAND] rename at91_nand
-> atmel_nand: internal symbols") from the mtd tree and commit
e3ba22db09408baee721897fb1b50e16f071d916 ("[ARM] 5056/1: [AT91] Cleanup
YL9200 board file") from the arm tree.

The former renames the struct type and the latter renames the instance.
I did the obvious fixup.  It may be worth a look.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Jun_2008_17_58_54_+1000_9vcN1bCT3OPTjaFZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhOND4ACgkQTgG2atn1QN+0ygCeIGEmOBuwqo61TYzKy5inBdxg
03MAn0twkJYV0PuHfa/OL72+JPFjCb7F
=HSpz
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Jun_2008_17_58_54_+1000_9vcN1bCT3OPTjaFZ--
