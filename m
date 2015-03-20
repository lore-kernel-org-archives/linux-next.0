From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the battery tree with the hid tree
Date: Fri, 20 Mar 2015 15:11:10 +1100
Message-ID: <20150320151110.02e10b33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DOZwT8L6vU8UOYCI3/=kYqJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Jason Gerecke <killertofu@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/DOZwT8L6vU8UOYCI3/=kYqJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Today's linux-next merge of the battery tree got conflicts in
drivers/hid/wacom.h and drivers/hid/wacom_sys.c between commit
953f2c5f7163 ("HID: wacom: Centralize updating of wacom_wac battery
status") and fce9957d8f61 ("HID: wacom: Allow dynamic battery
creation/destruction") from the hid tree and commit 297d716f6260
("power_supply: Change ownership from driver to core") from the battery
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).  I also applied the following merge fixup patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Mar 2015 14:59:36 +1100
Subject: [PATCH] HID: wacom: merge fix for "Change ownership from driver to=
 core"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hid/wacom_wac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 5588ba80ede9..57ee0d807af1 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -62,7 +62,7 @@ static void wacom_notify_battery(struct wacom_wac *wacom_=
wac,
 		wacom_wac->ps_connected =3D ps_connected;
=20
 		if (wacom->battery.dev)
-			power_supply_changed(&wacom->battery);
+			power_supply_changed(wacom->battery);
 	}
 }
=20
--=20
2.1.4

and this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Mar 2015 15:08:06 +1100
Subject: [PATCH] HID: wacom: merge fix 2 for "Change ownership from driver =
to core"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hid/wacom_sys.c | 4 ++--
 drivers/hid/wacom_wac.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 97940d7401d8..7dad9ea31490 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1343,11 +1343,11 @@ void wacom_battery_work(struct work_struct *work)
 	struct wacom *wacom =3D container_of(work, struct wacom, work);
=20
 	if ((wacom->wacom_wac.features.quirks & WACOM_QUIRK_BATTERY) &&
-	     !wacom->battery.dev) {
+	     !wacom->battery) {
 		wacom_initialize_battery(wacom);
 	}
 	else if (!(wacom->wacom_wac.features.quirks & WACOM_QUIRK_BATTERY) &&
-		 wacom->battery.dev) {
+		 wacom->battery) {
 		wacom_destroy_battery(wacom);
 	}
 }
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 57ee0d807af1..1a3ce3767415 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -61,7 +61,7 @@ static void wacom_notify_battery(struct wacom_wac *wacom_=
wac,
 		wacom_wac->bat_connected =3D bat_connected;
 		wacom_wac->ps_connected =3D ps_connected;
=20
-		if (wacom->battery.dev)
+		if (wacom->battery)
 			power_supply_changed(wacom->battery);
 	}
 }
@@ -2012,7 +2012,7 @@ static int wacom_status_irq(struct wacom_wac *wacom_w=
ac, size_t len)
 		wacom_notify_battery(wacom_wac, battery, charging,
 				     battery || charging, 1);
=20
-		if (!wacom->battery.dev &&
+		if (!wacom->battery &&
 		    !(features->quirks & WACOM_QUIRK_BATTERY)) {
 			features->quirks |=3D WACOM_QUIRK_BATTERY;
 			INIT_WORK(&wacom->work, wacom_battery_work);
@@ -2020,7 +2020,7 @@ static int wacom_status_irq(struct wacom_wac *wacom_w=
ac, size_t len)
 		}
 	}
 	else if ((features->quirks & WACOM_QUIRK_BATTERY) &&
-		 wacom->battery.dev) {
+		 wacom->battery) {
 		features->quirks &=3D ~WACOM_QUIRK_BATTERY;
 		INIT_WORK(&wacom->work, wacom_battery_work);
 		wacom_schedule_work(wacom_wac);
--=20
2.1.4

There may be more required, of course.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/hid/wacom.h
index ad7318db1dfe,0d0d0dd89d17..000000000000
--- a/drivers/hid/wacom.h
+++ b/drivers/hid/wacom.h
diff --cc drivers/hid/wacom_sys.c
index 353fe476be26,ba9af470bea0..000000000000
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@@ -1063,11 -1045,12 +1067,11 @@@ static int wacom_initialize_battery(str
 =20
  static void wacom_destroy_battery(struct wacom *wacom)
  {
- 	if (wacom->battery.dev) {
- 		power_supply_unregister(&wacom->battery);
- 		wacom->battery.dev =3D NULL;
- 		power_supply_unregister(&wacom->ac);
- 		wacom->ac.dev =3D NULL;
 -	if ((wacom->wacom_wac.features.quirks & WACOM_QUIRK_BATTERY) &&
 -	     wacom->battery) {
++	if (wacom->battery) {
+ 		power_supply_unregister(wacom->battery);
+ 		wacom->battery =3D NULL;
+ 		power_supply_unregister(wacom->ac);
+ 		wacom->ac =3D NULL;
  	}
  }
 =20

--Sig_/DOZwT8L6vU8UOYCI3/=kYqJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVC53lAAoJEMDTa8Ir7ZwVIysQAIr1zp/mDDJMzCh5NRqh6Cck
gEVnEU3TTl4Tna9JE58XK6TkrXMcURTq1uE/zbLEXk0M+j6VYSuKWIZ3rn4M5T71
0uDOvMuAq8WQNAHWv5r3L85ma6OsR/4gZ6p8rTOZ9MqwZYI6CdaGSXsWoXIUCLrz
xOUIhT7KhzO4SlB04UmIAK5OR5c0lRMjVqi4rubDRR57rqfbgAnDy/Bk5QC8IbXF
r8M4d0FQABlxhr89LJ0JSJHciqimNPCwVFA0+8Ysp5ZbtHv4kqVeKJJJHyAwmQVj
MlnlaEVEmePp+Cx+bFXiTlsp2UITe6Mq6T4PKgxfh6O28m3oOrJg1eO/ks79vbFv
+FBoBmQNEfqLSbC1V+0o1C+gR2+GARDxaGY2isGeTmaXNflkNPIlZEk/64i8TMoA
TwNpj97ZTAfVaOOjfxkAlfTwPiTUddQnZ9pi+TZfT1YdBflB+NTjaY+9m9Nyq8LL
lvPDFhRqsWD/DcuSa0vneiNauIIypRjPcTS3AODi42g3vv6ME92wyIXfufN7xHvt
tIdryGjRJ9rwkWrrn4R1kCC9O5G8ITH5kswELi3Bkp5K5NCy0xUMqwytQ+70zcc/
bUmbZztOjafhfXmI7V4oZTFIlYQa1teC7Net9K5Ck7+YXR6QBGJKOS5wZmKBN4ha
ISccYvh3v4x8SjHu4ncF
=2ICj
-----END PGP SIGNATURE-----

--Sig_/DOZwT8L6vU8UOYCI3/=kYqJ--
