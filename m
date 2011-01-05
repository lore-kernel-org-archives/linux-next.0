From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the mtd tree
Date: Wed, 5 Jan 2011 13:40:22 +1100
Message-ID: <20110105134022.106d9e0b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Jan_2011_13_40_22_+1100_zQkgUEXymHHuBFvB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39917 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750875Ab1AECk2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Jan 2011 21:40:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <rob.herring@calxeda.com>

--Signature=_Wed__5_Jan_2011_13_40_22_+1100_zQkgUEXymHHuBFvB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Today's linux-next merge of the devicetree tree got a conflict in
drivers/mtd/Kconfig between commit
b7b6e08f9265db56129931983fc6c06d62c9f4f9 (mtd: Fix MTD_OF_PARTS for all
arch and minor tidy of MTD_PARTITIONS"") from the mtd tree and commit
236cdc7bc718566a7e7cb9f763b51a8dcad88cbe ("of: make drivers depend on
CONFIG_OF instead of CONFIG_PPC_OF") from the devicetree tree.

I just used the version from the mtd tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Jan_2011_13_40_22_+1100_zQkgUEXymHHuBFvB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNI9oWAAoJEDMEi1NhKgbsLfQH+gI1aPYlmtcQBzZUkQw/NoEn
5btILz4zojuGV2DigKCLiZZ4CJI+r6QtVki4RtaDoSiO5wyCXjMTXIqdaJzvlNFm
UqfQLW0Kudr0YYT5XMUqStB/yrn1DB2DPtuUbyISeLBdaZxO0cPEOCFm8HlySr6J
9kGumk/HwhNTopbZjYRL/uReQY4CvyatG3dhhAaCJEwghNr1slePhEtIGizXdG9Y
Hkz4+GC1Ht2fXQVLh/WRAmmh3IYDaBLrN04OkGOJ1Pm/ayi2n39K+PN19Tcltcpe
l/vEa2BL6pF2AYkEmsI/NZzmQRgXB4eGiW0VDeZXvjY54OSoT+PPHxrxXDsKeb0=
=v2bp
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Jan_2011_13_40_22_+1100_zQkgUEXymHHuBFvB--
