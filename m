From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: galak merge conflict
Date: Wed, 11 Jun 2008 15:46:00 +1000
Message-ID: <20080611154600.91b35be7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Jun_2008_15_46_00_+1000_T7Mg_8A_xTwtc=9U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49999 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751849AbYFKFqK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 01:46:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kumar Gala <galak@kernel.crashing.org>
Cc: linux-next@vger.kernel.org, Laurent Pinchart <laurentp@cse-semaphore.com>, Paul Mackerras <paulus@samba.org>

--Signature=_Wed__11_Jun_2008_15_46_00_+1000_T7Mg_8A_xTwtc=9U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kumar,

Today's linux-next merge of the galak tree got a conflict in
Documentation/powerpc/booting-without-of.txt between commit
a5edeccb1a8432ae5d9fb9bccea5a4b64c565017 ("net: OpenFirmware GPIO based
MDIO bitbang driver") from the net/wireless tree and commit
83ff9dcf375c418ca3b98eb950711525ca1269e2 ("powerpc/sysdev: implement FSL
GTM support") from the galak tree.

I have relabeled the "MDIO on GPIOs" section to 'v'.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Jun_2008_15_46_00_+1000_T7Mg_8A_xTwtc=9U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhPZpgACgkQTgG2atn1QN/8kQCfbKwQJe0sNWbi54+55k121hpO
p30An3PfWplfczpu9GTDvdgwNd4Htz8H
=KG6i
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Jun_2008_15_46_00_+1000_T7Mg_8A_xTwtc=9U--
