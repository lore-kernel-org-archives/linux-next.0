From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the regulator
 tree
Date: Fri, 9 Mar 2012 18:15:17 +1100
Message-ID: <20120309181517.dce3405dc696afdf1a29be39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__9_Mar_2012_18_15_17_+1100_/tr+sEE9T3=iw+K0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:37082 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752289Ab2CIHPX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 02:15:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?IkhlaWtvIFN0w7xibmVyIg==?= <heiko@sntech.de>, Haojian Zhuang <haojian.zhuang@gmail.com>, Axel Lin <axel.lin@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>

--Signature=_Fri__9_Mar_2012_18_15_17_+1100_/tr+sEE9T3=iw+K0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
drivers/regulator/Kconfig between commit 8aa1ab9219e7 ("regulator: Sort
Kconfig and Makefile entries") from the regulator tree and commit
8a16a701ad78 ("regulator: Remove bq24022 regulator driver") from the
arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/regulator/Kconfig
index c733df5,740f468..0000000
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@@ -232,32 -233,6 +232,24 @@@ config REGULATOR_AB310
  	 AB3100 analog baseband dealing with power regulators
  	 for the system.
 =20
 +config REGULATOR_AB8500
 +	bool "ST-Ericsson AB8500 Power Regulators"
 +	depends on AB8500_CORE
 +	help
 +	  This driver supports the regulators found on the ST-Ericsson mixed
 +	  signal AB8500 PMIC
 +
 +config REGULATOR_DBX500_PRCMU
 +	bool
 +
 +config REGULATOR_DB8500_PRCMU
 +	bool "ST-Ericsson DB8500 Voltage Domain Regulators"
 +	depends on MFD_DB8500_PRCMU
 +	select REGULATOR_DBX500_PRCMU
 +	help
 +	  This driver supports the voltage domain regulators controlled by the
 +	  DB8500 PRCMU
 +
- config REGULATOR_BQ24022
- 	tristate "TI bq24022 Dual Input 1-Cell Li-Ion Charger IC"
- 	help
- 	  This driver controls a TI bq24022 Charger attached via
- 	  GPIOs. The provided current regulator can enable/disable
- 	  charging select between 100 mA and 500 mA charging current
- 	  limit.
-=20
  config REGULATOR_TPS6105X
  	tristate "TI TPS6105X Power regulators"
  	depends on TPS6105X

--Signature=_Fri__9_Mar_2012_18_15_17_+1100_/tr+sEE9T3=iw+K0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPWa4FAAoJEECxmPOUX5FEm0EP/3Gb/+zPVIBa76PdtPArn78P
Zi5gEvY12oz9RUOCINlOc76qjnhZ0mQpHrzc3X7kg5IS1qOf+HbhyYsrJfhNcf5b
kw9dPBUb6QP0EUp2BJIVkxqensVbDfSdcIm94pQmSkTl8rVvpqlPCr+6V5ux8/Ba
+oa7HmLEwBLUkCktyiYpFlCfulPMFZjNbotZcXYICeF0+LGZfrizGbJbB3hy39EC
85pwXqk3AyvyVaugRKNZY0bNcz2hLbMsG/nlV7mvguillAYfQ5cxa1Hlx6bDLcj/
F+Wy1zO0PxbAIzjxOZ769UtDi1WMPk9MIjWDr3+h8ByTwNrrq0E/RkDH8MvQG2NG
KnwOZzNmGF597/HciAbKg9Xrewc+Aq+l7Rx1EXIUg+gg5pbYJpbnqdoMcYLpE69j
c+KpG3SHyWSo3WmVauV3TKF5jj6mZj8HF3gRn8YT8hz7AcVkSPbCIPF2ia4rXjgv
7im+dm+/IDUobnzg2icN7w9l4iWT245TphWCzyAKuBkl2AhA51TdzKvHv8rlvZrQ
0geuFrPl+Eoo4LB52kwxSz0wYhVg7xz5AvXBQIdK9JhEgz2vYDaSU8jlMyPp/4s3
Bmcs2DltfsC2ejtEfGYMxy3gnHtkeMGi+NfKGzrUTmspJQw2lwAlYk3m7ArvH8t3
azS0t5lR0hNmgWcecxG9
=CnR4
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Mar_2012_18_15_17_+1100_/tr+sEE9T3=iw+K0--
