From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the galak tree
Date: Thu, 17 Jul 2008 15:30:50 +1000
Message-ID: <20080717153050.2c2ceb47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Jul_2008_15_30_50_+1000_GVVE8/CxuwCo643x"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56766 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750821AbYGQFa7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 01:30:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kumar Gala <galak@kernel.crashing.org>
Cc: linux-next@vger.kernel.org, Laurent Pinchart <laurentp@cse-semaphore.com>, Jeff Garzik <jeff@garzik.org>

--Signature=_Thu__17_Jul_2008_15_30_50_+1000_GVVE8/CxuwCo643x
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kumar,

Today's linux-next merge of the galak tree got a conflict in
drivers/net/fs_enet/fs_enet-main.c between commit
d8b35fac8c7e1b44d873c1afcc5f88bc5ef4b361 ("fs_enet: MDIO on GPIO
support") from the net tree and commit
b219108cbacee5f2eaeca63cba013688eeba3bd4 ("fs_enet: Remove !
CONFIG_PPC_CPM_NEW_BINDING code") from the galak tree.

Overlapping move/add.  I fixed it up and can carry the fix.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Jul_2008_15_30_50_+1000_GVVE8/CxuwCo643x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh+2QoACgkQjjKRsyhoI8xBBwCePbIfRUBqKHOe0WGz6zccAz3K
SZgAniECi9lGMkrJhD7Ha88WBXlZXU2V
=cNRO
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Jul_2008_15_30_50_+1000_GVVE8/CxuwCo643x--
