From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  voltage tree build failure
Date: Mon, 14 Jul 2008 23:35:30 +1000
Message-ID: <20080714233530.f0edf140.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__14_Jul_2008_23_35_30_+1000_CxBhX4Z.QVur.J3K"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45387 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753458AbYGNNfm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Jul 2008 09:35:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liam Girdwood <lg@opensource.wolfsonmicro.com>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Philipp Zabel <philipp.zabel@gmail.com>

--Signature=_Mon__14_Jul_2008_23_35_30_+1000_CxBhX4Z.QVur.J3K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Liam,

Today's linux-next build (arm versatile_defconfig) failed like this:

drivers/regulator/Kconfig:59: can't open file "drivers/regulator/wm8350/Kco=
nfig"

Commit 03ec18c8752a9b12006ffff23a5582b4482073ce ("regulator: TI bq24022
Li-Ion Charger driver") added some includes to drivers/regulator/Kconfig
of things that don't exist ...

Unfortunately, this broke all arm builds.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Jul_2008_23_35_30_+1000_CxBhX4Z.QVur.J3K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh7ViIACgkQjjKRsyhoI8zQagCfRLhqXMNOay/MisOXa867xAdj
ziYAnRZqi89yDM4y2tqQl394Tv/9MHp+
=nIg1
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Jul_2008_23_35_30_+1000_CxBhX4Z.QVur.J3K--
