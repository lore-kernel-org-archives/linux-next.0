From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the extcon tree
Date: Mon, 25 May 2015 21:05:03 +1000
Message-ID: <20150525210503.6bd3dec3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/o7PFubrHOq0BoG5ZiHS2OCY"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41852 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752389AbbEYLFK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2015 07:05:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ramakrishna Pallala <ramakrishna.pallala@intel.com>, Lee Jones <lee.jones@linaro.org>

--Sig_/o7PFubrHOq0BoG5ZiHS2OCY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the extcon tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/power/axp288_charger.c: In function 'axp288_charger_probe':
drivers/power/axp288_charger.c:851:8: error: incompatible type for argument=
 2 of 'extcon_register_notifier'
  ret =3D extcon_register_notifier(info->cable.edev, &info->cable.nb);
        ^
In file included from drivers/power/axp288_charger.c:29:0:
include/linux/extcon.h:240:12: note: expected 'enum extcon' but argument is=
 of type 'struct notifier_block *'
 extern int extcon_register_notifier(struct extcon_dev *edev, enum extcon i=
d,
            ^
drivers/power/axp288_charger.c:851:8: error: too few arguments to function =
'extcon_register_notifier'
  ret =3D extcon_register_notifier(info->cable.edev, &info->cable.nb);
        ^
In file included from drivers/power/axp288_charger.c:29:0:
include/linux/extcon.h:240:12: note: declared here
 extern int extcon_register_notifier(struct extcon_dev *edev, enum extcon i=
d,
            ^
drivers/power/axp288_charger.c:912:2: error: incompatible type for argument=
 2 of 'extcon_unregister_notifier'
  extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
  ^
In file included from drivers/power/axp288_charger.c:29:0:
include/linux/extcon.h:242:12: note: expected 'enum extcon' but argument is=
 of type 'struct notifier_block *'
 extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extcon=
 id,
            ^
drivers/power/axp288_charger.c:912:2: error: too few arguments to function =
'extcon_unregister_notifier'
  extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
  ^
In file included from drivers/power/axp288_charger.c:29:0:
include/linux/extcon.h:242:12: note: declared here
 extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extcon=
 id,
            ^
drivers/power/axp288_charger.c: In function 'axp288_charger_remove':
drivers/power/axp288_charger.c:923:2: error: incompatible type for argument=
 2 of 'extcon_unregister_notifier'
  extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
  ^
In file included from drivers/power/axp288_charger.c:29:0:
include/linux/extcon.h:242:12: note: expected 'enum extcon' but argument is=
 of type 'struct notifier_block *'
 extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extcon=
 id,
            ^
drivers/power/axp288_charger.c:923:2: error: too few arguments to function =
'extcon_unregister_notifier'
  extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
  ^
In file included from drivers/power/axp288_charger.c:29:0:
include/linux/extcon.h:242:12: note: declared here
 extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extcon=
 id,
            ^

Caused by commit 843735b788a4 ("power: axp288_charger: axp288 charger
driver") from the battery tree interacting with commit 046050f6e623
("extcon: Update the prototype of extcon_register_notifier() with enum
extcon") from the extcon tree.

I applied this merge fix patch for tday and can carry it as necessary
(it is clearly not correct, but it will make it build):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 May 2015 21:00:24 +1000
Subject: [PATCH] power: axp288_charger: fix for AIP change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/power/axp288_charger.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/power/axp288_charger.c b/drivers/power/axp288_charger.c
index 5680317f4823..e4d569f57acc 100644
--- a/drivers/power/axp288_charger.c
+++ b/drivers/power/axp288_charger.c
@@ -848,7 +848,7 @@ static int axp288_charger_probe(struct platform_device =
*pdev)
 	/* Register for extcon notification */
 	INIT_WORK(&info->cable.work, axp288_charger_extcon_evt_worker);
 	info->cable.nb.notifier_call =3D axp288_charger_handle_cable_evt;
-	ret =3D extcon_register_notifier(info->cable.edev, &info->cable.nb);
+	ret =3D extcon_register_notifier(info->cable.edev, EXTCON_NONE, &info->ca=
ble.nb);
 	if (ret) {
 		dev_err(&info->pdev->dev,
 			"failed to register extcon notifier %d\n", ret);
@@ -909,7 +909,7 @@ intr_reg_failed:
 		extcon_unregister_interest(&info->otg.cable);
 	power_supply_unregister(info->psy_usb);
 psy_reg_failed:
-	extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
+	extcon_unregister_notifier(info->cable.edev, EXTCON_NONE, &info->cable.nb=
);
 	return ret;
 }
=20
@@ -920,7 +920,7 @@ static int axp288_charger_remove(struct platform_device=
 *pdev)
 	if (info->otg.cable.edev)
 		extcon_unregister_interest(&info->otg.cable);
=20
-	extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
+	extcon_unregister_notifier(info->cable.edev, EXTCON_NONE, &info->cable.nb=
);
 	power_supply_unregister(info->psy_usb);
=20
 	return 0;
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/o7PFubrHOq0BoG5ZiHS2OCY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYwHjAAoJEMDTa8Ir7ZwVk5EP/1Ds6PYoU1joWLQA5rnWeJVq
mIqbGXoBbXk7PNdy/Iej0fYnSZpvo6GEYqyhKWwvCmlvOMIU/UAUO7TOCLTIaB4K
ApT/9lCoCoGopBt4Ps6PTTi4/BlT0UPT3YLoyauBWpTBmlFDO2RiO13WouyvSGgA
6UEdK9kSq/OgCyV2fapmNI8Hd0LGqqAr+PNePXus7/y2UcLrLIx9xdK6HjDAo0gg
vEhwgvtjBuoVcPWu7qobO89m19I20ui7cpg1oYtkL/MGZboXHZIVGL5Zi5UyQO45
Y5BrLCCXJuEiEjhXMRjUY7rzEFq8d6NJTOjSLO/EEPDDx/J91gSvrVEA1stSm8Al
D8NGQutzNjMVM7oFZtIdX9EfGifEngo4fDiO1opkIUuiF+7XbOQOhlzDzu/1KG4w
IiYbCBekNqJBG6R0Wjs6pswwWlWPR9LXkOAyOUG2V+EUk99lXnXLXjBBAJuV+gme
AIgiG1w+SfxRl0uQwKw5H0q4krkZXqct6+xex2nUBvDrYxBD+u4jUgYkLzGXI6VV
HoLoBOpwDX4/wUjt4PYMbydTJBnDTXOeupWWndxllYwzdwwnuAX+horzz74rz/qn
JSb6zQfXBjNuNGG2Cl7wmEwXrtYxvES3Fb7dqieAbUQacUOxnPLgiaABpByHHhAP
IWmkxHCOeeXQup1iLGBY
=guVd
-----END PGP SIGNATURE-----

--Sig_/o7PFubrHOq0BoG5ZiHS2OCY--
