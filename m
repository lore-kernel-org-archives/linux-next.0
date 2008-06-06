From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mmc/driver-core merge conflict
Date: Fri, 6 Jun 2008 15:56:55 +1000
Message-ID: <20080606155655.b72cff0d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Jun_2008_15_56_55_+1000_5QLBw.yI.E7HHt=f"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41959 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753450AbYFFF5E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 01:57:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pierre Ossman <drzeus-list@drzeus.cx>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Anton Vorontsov <avorontsov@ru.mvista.com>

--Signature=_Fri__6_Jun_2008_15_56_55_+1000_5QLBw.yI.E7HHt=f
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pierre, Greg,

Today's linux-next merge of the mmc tree got a conflict in
drivers/mmc/host/mmc_spi.c between commit
b16fa5e051064488f241647a080271f1cd41d077 ("driver-core: prepare for
removal of 20 char limit from struct device") from the driver-core tree
and commit cd3c93fe826def37abc474e7a91bbf56444d7cd0 ("mmc_spi: add
support for card-detection polling") from the mmc tree.

I fixed it up in the obvious manner.  Could be fixed by moving the
drivers/mmc/host/mmc_spi.c part of the driver-core change to the mmc
tree ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Jun_2008_15_56_55_+1000_5QLBw.yI.E7HHt=f
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhI0acACgkQTgG2atn1QN/JKwCfYA6vmtQhbaEJh+IxOnVyf3Lx
4dIAniQz+/32+HXJPqBOHfVf01Rl447Z
=Xpy9
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Jun_2008_15_56_55_+1000_5QLBw.yI.E7HHt=f--
