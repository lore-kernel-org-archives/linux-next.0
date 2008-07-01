From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Tue, 1 Jul 2008 17:19:40 +1000
Message-ID: <20080701171940.6f282113.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_17_19_40_+1000_o7xw.kT+YcDiOhly"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37614 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752344AbYGAHTu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 03:19:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Anton Vorontsov <avorontsov@ru.mvista.com>, Kumar Gala <galak@kernel.crashing.org>, Jason Jin <Jason.jin@freescale.com>, Laurent Pinchart <laurentp@cse-semaphore.com>, Jeff Garzik <jgarzik@redhat.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Tue__1_Jul_2008_17_19_40_+1000_o7xw.kT+YcDiOhly
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in  between
commits aee1dc73b519227084d77b0b2fc972b68b4153d8 ("[POWERPC] Update
booting-without-of for Freescale PCIe MSI") and
83ff9dcf375c418ca3b98eb950711525ca1269e2 ("powerpc/sysdev: implement FSL
GTM support") from the powerpc tree and commit
a5edeccb1a8432ae5d9fb9bccea5a4b64c565017 ("net: OpenFirmware GPIO based
MDIO bitbang driver") from the net tree.

They are just overlapping additions. I renumbered(?) the "MDIO on GPIOs"
section to 'v'.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_17_19_40_+1000_o7xw.kT+YcDiOhly
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhp2owACgkQjjKRsyhoI8xVrQCfYGH7Yh0cdpkLisXntFeHC2d/
sDUAn0fokTgC7nE4/pqxhq3GSI6i8kZn
=oEkA
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_17_19_40_+1000_o7xw.kT+YcDiOhly--
