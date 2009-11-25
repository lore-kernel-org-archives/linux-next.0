From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the voltage tree with the mfd tree
Date: Wed, 25 Nov 2009 17:56:02 +1100
Message-ID: <20091125175602.0e765187.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Nov_2009_17_56_02_+1100_8Z_5UCGBwtgffRaX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51772 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751742AbZKYG4D (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Nov 2009 01:56:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@marvell.com>, Samuel Ortiz <sameo@linux.intel.com>

--Signature=_Wed__25_Nov_2009_17_56_02_+1100_8Z_5UCGBwtgffRaX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Liam,

Today's linux-next merge of the voltage tree got a conflict in
drivers/mfd/Kconfig between commit
b60463644b8baea3c649faeb9d7c44c104f14588 ("mfd: Fix 88PM8607 I2C
dependency") from the mfd tree and commit
258e3427f83a573d738344c2f5499da5e026e1df ("regulator: add 88PM8607 PMIC
driver") from the voltage tree.

I fixed it up using the mfd tree version. ("depends on I2C=3Dy" v "depends
on I2C").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Nov_2009_17_56_02_+1100_8Z_5UCGBwtgffRaX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksM1QIACgkQjjKRsyhoI8wXdwCfdsFWNDucEqMAoksH7dQy+RXs
51oAoIEbsLKGNOYlzggsgMH3Tmmb+SDr
=W7j2
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Nov_2009_17_56_02_+1100_8Z_5UCGBwtgffRaX--
