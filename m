From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the hwmon-staging tree
Date: Thu, 6 Jun 2019 10:32:20 +1000
Message-ID: <20190606103220.1168317e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jp2IeK1cPImbdQNeyy9X1hn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "amy.shih" <amy.shih@advantech.com.tw>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/jp2IeK1cPImbdQNeyy9X1hn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/hwmon/nct7904.c: In function 'nct7904_in_is_visible':
drivers/hwmon/nct7904.c:313:6: warning: this statement may fall through [-W=
implicit-fallthrough=3D]
   if (channel > 0 && (data->vsen_mask & BIT(index)))
      ^
drivers/hwmon/nct7904.c:315:2: note: here
  case hwmon_in_min:
  ^~~~
drivers/hwmon/nct7904.c: In function 'nct7904_fan_is_visible':
drivers/hwmon/nct7904.c:230:6: warning: this statement may fall through [-W=
implicit-fallthrough=3D]
   if (data->fanin_mask & (1 << channel))
      ^
drivers/hwmon/nct7904.c:232:2: note: here
  case hwmon_fan_min:
  ^~~~
drivers/hwmon/nct7904.c: In function 'nct7904_temp_is_visible':
drivers/hwmon/nct7904.c:443:6: warning: this statement may fall through [-W=
implicit-fallthrough=3D]
   if (channel < 5) {
      ^
drivers/hwmon/nct7904.c:450:2: note: here
  case hwmon_temp_max:
  ^~~~

Introduced by commit

  af55ab0b0792 ("hwmon: (nct7904) Add extra sysfs support for fan, voltage =
and temperature.")

I get these warnings because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/jp2IeK1cPImbdQNeyy9X1hn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz4XxQACgkQAVBC80lX
0GxHrwf/b52AhBEkP/dSy+wGbsZhpjUGSUeC6kHyqPyMrRMdf1DUSP15WdD9cfGr
ByAPjvP+UMZcz/+/bEwCSPobhgXRekE+CpEzIRTPudNcTspq0tTCWVnTLKLfjOx7
Fy/VJOsbq0oRGs7+V5YyxO2IR1ECNVbg906I2RKB2fSjCnJmY+a4f/frSkRgqnON
+UWufptun4ri8kvt4ab/IhFZc/dTaZzpuZr/AIVbxR5MBVXMAPdVhvyAMqYBXn7n
GWptCTJUvG0jdMEtBxkHNUAz9L2oVe+j1BdC5qOXxbZPZZE3slU0KEdKolurlW7H
cDiDTw3f65nUx3G/wZboyGfrmEgMLA==
=GsH5
-----END PGP SIGNATURE-----

--Sig_/jp2IeK1cPImbdQNeyy9X1hn--
