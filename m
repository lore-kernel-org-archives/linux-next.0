From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci merge conflict
Date: Wed, 11 Jun 2008 13:23:38 +1000
Message-ID: <20080611132338.f68e6cb1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Jun_2008_13_23_38_+1000_Kd+bdD1rsf_6_9G_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37481 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753970AbYFKDXt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 23:23:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>, Alex Chiang <achiang@hp.com>

--Signature=_Wed__11_Jun_2008_13_23_38_+1000_Kd+bdD1rsf_6_9G_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
drivers/pci/hotplug/fakephp.c between commit
b9a4a152420e0158822ffb0cf0e57d36019604c7 ("driver-core: prepare for
removal of 20 char limit from struct device") from the driver-core tree
and commit fe99740cac117f208707488c03f3789cf4904957 ("PCI: construct one
fakephp slot per PCI slot") from the pci tree.

I did what seemed to be the right thing - it seems that the driver-core
patch to this file is no longer needed.  It is worth a check.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Jun_2008_13_23_38_+1000_Kd+bdD1rsf_6_9G_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhPRToACgkQTgG2atn1QN8L+QCfb6NnNjtbZpeKRKahE+aCdswb
M9MAnjiWzxeDb+S5HsYpXxm27sVAIExP
=w/7t
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Jun_2008_13_23_38_+1000_Kd+bdD1rsf_6_9G_--
