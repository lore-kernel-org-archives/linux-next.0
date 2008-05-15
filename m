From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: i2c/driver-core merge conflict
Date: Thu, 15 May 2008 12:00:06 +1000
Message-ID: <20080515120006.b336a720.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_May_2008_12_00_06_+1000_hhTan0BUXyhenAQ="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53184 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750836AbYEOCAW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 May 2008 22:00:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Thu__15_May_2008_12_00_06_+1000_hhTan0BUXyhenAQ=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean, Greg,

Today's linux-next merge of the i2c tree got a conflict in
include/linux/i2c.h between commit
e38c93bf253cb3176478a1943cd2306e8413d2bb ("driver core: remove
KOBJ_NAME_LEN define") from the driver-core tree and commit
f625810ef235a8b238427df3129792f89187c085 ("i2c: Kill the old driver
matching scheme") from the i2c tree.  The former changes the definition
of driver_name in two places, the letter removes the definitions.  I went
with the latter.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_May_2008_12_00_06_+1000_hhTan0BUXyhenAQ=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIK5kyTgG2atn1QN8RAnRcAJwMM464f/WFxFQ0zP/bI1SomExocwCcCP74
A8ZTZBvko2QZhOTvsCo0Yfk=
=PjbP
-----END PGP SIGNATURE-----

--Signature=_Thu__15_May_2008_12_00_06_+1000_hhTan0BUXyhenAQ=--
