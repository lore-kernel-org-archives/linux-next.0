From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the hwmon-staging tree
Date: Mon, 17 Dec 2018 10:00:26 +1100
Message-ID: <20181217100026.03438bcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dzd9M8gZrQuqUT0Elw5Dp=U"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eddie James <eajames@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/dzd9M8gZrQuqUT0Elw5Dp=U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

After merging the hwmon-staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/hwmon/Kconfig:1298:warning: ignoring unsupported character '/'
drivers/hwmon/Kconfig:1299: syntax error
drivers/hwmon/Kconfig:1298:warning: ignoring unsupported character '/'
drivers/hwmon/Kconfig:1298:warning: ignoring unsupported character '/'
drivers/hwmon/Kconfig:1298: invalid statement

Caused by commit

  de75c2156b2f ("hwmon: Add On-Chip Controller (OCC) hwmon driver")

interacting with updates to the kconfig system.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 17 Dec 2018 09:50:14 +1100
Subject: [PATCH] hwmon: quote the path in Kconfig source statements

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hwmon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 62b68cd280dc..6f929bfa9fcd 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1295,7 +1295,7 @@ config SENSORS_NSA320
 	  This driver can also be built as a module. If so, the module
 	  will be called nsa320-hwmon.
=20
-source drivers/hwmon/occ/Kconfig
+source "drivers/hwmon/occ/Kconfig"
=20
 config SENSORS_PCF8591
 	tristate "Philips PCF8591 ADC/DAC"
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

--Sig_/dzd9M8gZrQuqUT0Elw5Dp=U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwW2QoACgkQAVBC80lX
0Gw/Qwf+N07HzHYu832boHvaSVadC7IutAx3CZa2PkZSNY8iGfEfHPHdqN/nVTk+
J7DvXuj7/p8/T4w8xty2hTVUzmYJhMwgh+DZkc0TQ0DccVTHRcc3Xdrx2zIY/hT4
oq5tYesPIj9bgvyxZ23i+ffmrikG6V+4Q+k45uRrpaWg71u7zMx0dVP1YGwFYkiy
/Nie8dU33rhNIncv3S2TUeyuDlM/C94BZyK+eZvwjWMXJajJL81/ayAsMSl7immL
x0ckeLRj83GWg4mN7EN4faLWt+pQLMDexeAHyROLUphQPb9MXjuVepk/R9rN0TRn
vHZCbgFdgqEhaHj0dPhL5N0u+kjvFQ==
=nlrm
-----END PGP SIGNATURE-----

--Sig_/dzd9M8gZrQuqUT0Elw5Dp=U--
