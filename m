From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Tue, 24 Jun 2008 16:55:08 +1000
Message-ID: <20080624165508.b9bcabbe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Jun_2008_16_55_09_+1000_KrwV+DdkVHxa_QSA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47420 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751293AbYFXGzT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 02:55:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__24_Jun_2008_16_55_09_+1000_KrwV+DdkVHxa_QSA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got a conflict in
drivers/net/Kconfig between commit
158d7abdae85e9ac43d99780c372d79c119f7626 ("tg3: Add mdio bus
registration") from the  tree and commit
b0dc4db2e4d4491ae35c286f1a0a632ee12d5d76 ("firmware: convert tg3 driver
to request_firmware()") from the firmware tree.

Just a case of overlapping additions of SELECTs.  I took them both.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Jun_2008_16_55_09_+1000_KrwV+DdkVHxa_QSA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhgmk0ACgkQTgG2atn1QN+pYACeOozEWZKvurmt9kH8JSeDaX9k
VmgAoJkbfoeRxOkPF8dIyubLhS6cv1hc
=gt6C
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Jun_2008_16_55_09_+1000_KrwV+DdkVHxa_QSA--
