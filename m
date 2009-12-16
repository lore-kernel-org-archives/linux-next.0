From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree with Linus' tree
Date: Wed, 16 Dec 2009 13:00:49 +1100
Message-ID: <20091216130049.60a1774c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Dec_2009_13_00_49_+1100_r/5FJq1p/lpEl+aZ"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934482AbZLPCBM@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__16_Dec_2009_13_00_49_+1100_r/5FJq1p/lpEl+aZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
drivers/platform/x86/eeepc-laptop.c between commit
471452104b8520337ae2fb48c4e61cd4896e025d ("const: constify remaining
dev_pm_ops") from Linus' tree and commit
52bbe3c7b413d656833686f9f08e5dcab3786eeb ("eeepc-laptop: code movement")
from the acpi tree.

The latter just moved the code that the former was updating.  I fixed it
up (see below) and can carry the fix for a while.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/platform/x86/eeepc-laptop.c
index e647a85,d07a4c0..0000000
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@@ -866,16 -862,37 +862,37 @@@ static int eeepc_hotk_restore(struct de
  	return 0;
  }
 =20
 -static struct dev_pm_ops eeepc_pm_ops =3D {
++static const struct dev_pm_ops eeepc_pm_ops =3D {
+ 	.thaw =3D eeepc_hotk_thaw,
+ 	.restore =3D eeepc_hotk_restore,
+ };
+=20
+ static struct platform_driver platform_driver =3D {
+ 	.driver =3D {
+ 		.name =3D EEEPC_LAPTOP_FILE,
+ 		.owner =3D THIS_MODULE,
+ 		.pm =3D &eeepc_pm_ops,
+ 	}
+ };
+=20
  /*
-  * Hwmon
+  * Hwmon device
   */
+=20
+ #define EEEPC_EC_SC00      0x61
+ #define EEEPC_EC_FAN_PWM   (EEEPC_EC_SC00 + 2) /* Fan PWM duty cycle (%) =
*/
+ #define EEEPC_EC_FAN_HRPM  (EEEPC_EC_SC00 + 5) /* High byte, fan speed (R=
PM) */
+ #define EEEPC_EC_FAN_LRPM  (EEEPC_EC_SC00 + 6) /* Low byte, fan speed (RP=
M) */
+=20
+ #define EEEPC_EC_SFB0      0xD0
+ #define EEEPC_EC_FAN_CTRL  (EEEPC_EC_SFB0 + 3) /* Byte containing SF25  */
+=20
  static int eeepc_get_fan_pwm(void)
  {
- 	int value =3D 0;
+ 	u8 value =3D 0;
 =20
- 	read_acpi_int(NULL, EEEPC_EC_FAN_PWM, &value);
- 	value =3D value * 255 / 100;
- 	return (value);
+ 	ec_read(EEEPC_EC_FAN_PWM, &value);
+ 	return value * 255 / 100;
  }
 =20
  static void eeepc_set_fan_pwm(int value)

--Signature=_Wed__16_Dec_2009_13_00_49_+1100_r/5FJq1p/lpEl+aZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksoP1EACgkQjjKRsyhoI8ztRwCeMjon+GI2gS7GAUQdQRAR6/sV
whsAoKCbuI5ObFGi79OHXEcVzygqdFdH
=9W29
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Dec_2009_13_00_49_+1100_r/5FJq1p/lpEl+aZ--
