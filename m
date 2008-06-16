From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless build failure
Date: Mon, 16 Jun 2008 15:38:28 +1000
Message-ID: <20080616153828.9a07e7ba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_15_38_28_+1000_tgy27cic05vcW6JV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43895 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751213AbYFPFig (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 01:38:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, Jouni Malinen <j@w1.fi>

--Signature=_Mon__16_Jun_2008_15_38_28_+1000_tgy27cic05vcW6JV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next build of the net (really wireless) tree failed like this:

drivers/net/wireless/mac80211_hwsim.c: In function 'init_mac80211_hwsim':
drivers/net/wireless/mac80211_hwsim.c:433: error: implicit declaration of
function 'device_create'

device_create has been removed (by commit
be27077d3768f713fb3d27aef5ad5d046b8b1201 ("driver core: remove
device_create()") from the driver-core tree).  It has been replaced by
device_create_drvdata to fix a race.  The replacement routine has alreday
been added to Linus' tree, so this patch should be able to update the
original.

I applied the patch below.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 0d69621eed6c615a517cccc27db3e065e83782bd Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 16 Jun 2008 15:35:10 +1000
Subject: [PATCH] wireless: fix fallout from device_create removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/mac80211_hwsim.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mac80211_hwsim.c b/drivers/net/wireless/m=
ac80211_hwsim.c
index 8da352a..5d30c57 100644
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@ -430,15 +430,16 @@ static int __init init_mac80211_hwsim(void)
 		hwsim_radios[i] =3D hw;
=20
 		data =3D hw->priv;
-		data->dev =3D device_create(hwsim_class, NULL, 0, "hwsim%d", i);
+		data->dev =3D device_create_drvdata(hwsim_class, NULL, 0, hw,
+						"hwsim%d", i);
 		if (IS_ERR(data->dev)) {
-			printk(KERN_DEBUG "mac80211_hwsim: device_create "
+			printk(KERN_DEBUG
+			       "mac80211_hwsim: device_create_drvdata "
 			       "failed (%ld)\n", PTR_ERR(data->dev));
 			err =3D -ENOMEM;
 			goto failed;
 		}
 		data->dev->driver =3D &mac80211_hwsim_driver;
-		dev_set_drvdata(data->dev, hw);
=20
 		SET_IEEE80211_DEV(hw, data->dev);
 		addr[3] =3D i >> 8;
--=20
1.5.5.4


--Signature=_Mon__16_Jun_2008_15_38_28_+1000_tgy27cic05vcW6JV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhV/FQACgkQTgG2atn1QN8voQCggNg2lr2onVpi6K2v8L0axMkt
TqsAn1cZnlOO4h3VTlMSawPbu6k2DdlC
=KmR1
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_15_38_28_+1000_tgy27cic05vcW6JV--
