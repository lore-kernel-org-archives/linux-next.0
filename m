From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the mips tree
Date: Wed, 3 Jun 2015 16:48:42 +1000
Message-ID: <20150603164842.1615c414@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oOsKleqY22rQxi+V/Q/R/ij"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42230 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752361AbbFCGsu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2015 02:48:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@ti.com>

--Sig_/oOsKleqY22rQxi+V/Q/R/ij
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/phy/Makefile between commit d38dee131827 ("PHY: Add driver for
Pistachio USB2.0 PHY") from the mips tree and commit 1c14905ef951
("phy: add driver for TI TUSB1210 ULPI PHY") from the usb tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/phy/Makefile
index 75a37dc952f5,0a2041803135..000000000000
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@@ -40,4 -40,4 +40,5 @@@ obj-$(CONFIG_PHY_STIH41X_USB)		+=3D phy-s
  obj-$(CONFIG_PHY_QCOM_UFS) 	+=3D phy-qcom-ufs.o
  obj-$(CONFIG_PHY_QCOM_UFS) 	+=3D phy-qcom-ufs-qmp-20nm.o
  obj-$(CONFIG_PHY_QCOM_UFS) 	+=3D phy-qcom-ufs-qmp-14nm.o
 +obj-$(CONFIG_PHY_PISTACHIO_USB)		+=3D phy-pistachio-usb.o
+ obj-$(CONFIG_PHY_TUSB1210)		+=3D phy-tusb1210.o

--Sig_/oOsKleqY22rQxi+V/Q/R/ij
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbqNQAAoJEMDTa8Ir7ZwVSIoQAI8eYy5HQ80JQtTd74Ss2gV8
Tt5X3wK7vYqpgAqQcVPjN1qunT2KxpZjP6vuxKgz7lSJlzWLz37e0+TS7mCD0usj
qP8JagFBzZlg2I8YbCYs8bj8IGX+1OKuFO7gWFhtYntkahwzZnj+Pg/WgVWl94xf
F8+tSR1NBkO5zwKqBul1rMnh/I7a8IAJDOirYNkdiHbmA75bWTKqlUIvWBBu/fHe
tT4koavHY17SfokFSs8CDkGf/cXOx6/zuGozMFkPu55EirSr00d0lxG/cVVFfa6P
4VOYcNeOAPooWGXQmPhL2X8sW3c5SwB8NETmozGI2iBaNe1rWuw+BzyLHPgbg0Bg
5LyiOL+uoQaDlV+hotEV4vLNMDwavO1PGjCUSqDsyijr3M477HS8HUYuPOtIMcLr
+lgcvN20cpUKefKtWIo/VZAGrMomKAFAiX/qedPHebjhwMmQlAVne3e0ybWWzeNk
fVR0gNMxSbwlIyyZCOD587OwwKBN4MLsH27VwNu7cj2lppghhQ351BKFgm4Vl4Uv
lo11GpQd8Db1IZfsDMTWQjUpdr1HkfwizPCPFwHoBgp/YR6zqE/eE2UYrowYa8nU
QgX6X5IWSPWmM/tLmcN0Xi+WToMSCy0wl5c7RTC1HbGf/GRc/lktVKcykVUI4wFP
3zqBkUiqSlO+WKZtX/BF
=XZyS
-----END PGP SIGNATURE-----

--Sig_/oOsKleqY22rQxi+V/Q/R/ij--
