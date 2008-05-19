From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: i2c merge conflict
Date: Mon, 19 May 2008 13:02:35 +1000
Message-ID: <20080519130235.ce392f62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_13_02_35_+1000_M37oxmGGBAwO9JGL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53353 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750968AbYESDC5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 May 2008 23:02:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__19_May_2008_13_02_35_+1000_M37oxmGGBAwO9JGL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

Today's linux-next merge of the i2c tree got a trivial conflict in
drivers/i2c/busses/i2c-nforce2.c because "i2c-nforce2: Disable the second
SMBus channel on the DFI Lanparty NF4 Expert" appeasr in both the i2c
tree and Linus' tree.  I assume that this will go away tomorrow when the
i2c tree gets resynced.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_13_02_35_+1000_M37oxmGGBAwO9JGL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMO3XTgG2atn1QN8RAthWAKCPtiSF4h2dUMzFh1svS8uAWHPKwwCfZRO0
Z8uGrZ73rDPzqBUlL935vYU=
=A8Ee
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_13_02_35_+1000_M37oxmGGBAwO9JGL--
