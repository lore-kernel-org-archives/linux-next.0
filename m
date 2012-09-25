From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the l2-mtd tree
Date: Tue, 25 Sep 2012 16:50:57 +1000
Message-ID: <20120925165057.3a48eb9c4e3e4d70818e2791@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__25_Sep_2012_16_50_57_+1000_JPSbyJsUJaaHK48Q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:41569 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884Ab2IYGvC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 02:51:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Daudt <csd@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>

--Signature=_Tue__25_Sep_2012_16_50_57_+1000_JPSbyJsUJaaHK48Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got conflicts in
drivers/mtd/nand/bcm_umi_nand.c and drivers/mtd/nand/nand_bcm_umi.h
between commit 07f4c69caf01 ("mtd: remove bcmring NAND driver") from the
l2-mtd tree and commit 878040ef831a ("ARM: bcmring: use proper MMIO
accessors") from the arm-soc tree.

I just removed the files and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__25_Sep_2012_16_50_57_+1000_JPSbyJsUJaaHK48Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQYVRRAAoJEECxmPOUX5FEC0EP/3tKu1LTnGwzwNTg0ggD4esi
owq9TCfdErNxTQUfjgbYoQjedw3IZFCwLbAhS4IdUz/zU/an3vY6SxBenkSloEVR
YRY4WFIijTvcOoiXF19I47GqUSrylBIchs4QaeZ5lKCMAdawkinlMAY3tBu/6UKl
5pFOzwihjSzWL4DGLT+Y8dHHHgaZAnGOdllqKdDOhk/IgGGTbtbI9n9xykscLubZ
ZA/kJmqunTxbbNKCjjjQ+QrJKt8wwPqgVLbPUpZnPRupYa5KbLmTDJI3m9XA1+fm
xFgs8mhbKlQNH5/HTpkMty68KHsH+yKy6qy2K/URtpotnq19JoQEbuwcnZEQ6Nng
xoaSaxkp6ZYGXtSCJpLRveeglZXsCeDny5WzCKYhQPtjhP4ttFHqxc5A/cmlNobY
bvO0SWwXls0ZG0FcMPTn9MGv7zQ5mGf2akPjnTDgctMSQsrZR9xx8tH5qHOwz3Hp
nfhdvIIfiES2WJGpotZlvZJhgLzGZj+fuA2sOTrnbNzpSEK1KJrUCvQH4d/0TwE2
cOtDH+5R5lWSn86p4uTTSt900NY9GYv//GYAXTXw5m1w+vtuTedESZF2JRB1XU6t
JzhcOktrubIsUYOED7E3qbcJRJGuOSUPCoAR5MRKe67a28SaeUb1vzUlo12pgEVP
gQZd+qJsPKXi2V1AEzmX
=oEr1
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Sep_2012_16_50_57_+1000_JPSbyJsUJaaHK48Q--
