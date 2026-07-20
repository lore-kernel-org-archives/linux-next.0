Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4D3C5546;
	Mon, 20 Jul 2026 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559592; cv=none; b=eCeRNQZQr0M0sVeb8x+tPg43d8Brm8uYmszJYwr6AEyICGqaJyGkmBqhlO7PASWMCuhKgwVVEegO+0pqtvpexaqZM06yZ+A8sVuKjltplHQgK/2B0asfALV80zoI0clA0STVWW9sztQUEZitClC/5+61/kYUJ3gmZ+Ep400JkQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559592; c=relaxed/simple;
	bh=quB+OW2w1H0BntLyVToFtjzt446mihosy+zMkTmKT+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTy+QhpmFPtZs1zLo3M0JC3YJJcSyZ51ElxToPRevtf3LX2Z55yHd+NZwAMqXA/PgxVCJOQnNDID/WX6t2Phnj4s2MX6l46Yd9uVRwiOkf9XuLyKkpoDkoeVKYOz7dZGMQfvBQ9qUSjT1kzIZKURELupeLRo0z3RSLEiaYi46yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fF7E+aj3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fF7E+aj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAA81F00ACA;
	Mon, 20 Jul 2026 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784559591;
	bh=C5sbvGFV/qMTVfAil0YxgLw3cZzbm7C6yN/c0/cNLvI=;
	h=Date:From:To:Cc:Subject;
	b=fF7E+aj3Q5pAKteKmSIOssA67DdakeGpvlCcAQCOl61GjOx+yxKXT8UgpbaATdva/
	 +tNPW5ddusmBWVm38EbgyTfcgxZ22ssLIhs3C5mLMZRwwvPLPpzbZ9cY/Dj/eTNvvc
	 zZoae6LAC+a5CZXB6U5kTU+X7mjUzZamHUrE15OFsaG9X/+Ulo7Oe32YYW2AU6rVoR
	 176bxtPjIILOnw7mtUszyB3jWVZyvoBNSe6FWLNKTQmK1yDZHibbrszS2oqpRTbQsC
	 +1Xh4Ff/rYu7YhDBaZcpUeBuwO3Jal8df2HYF/fCPlHlUF7vzVAvmrEHdzl+ysGWO9
	 ChAVlKzkK5R2A==
Date: Mon, 20 Jul 2026 15:59:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julian Braha <julianbraha@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the nvmem tree with the char-misc tree
Message-ID: <al434tAltVHThf2L@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9bCBlf4BPvPi89E2"
Content-Disposition: inline


--9bCBlf4BPvPi89E2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvmem tree got conflicts in:

  drivers/nvmem/Makefile
  drivers/nvmem/Kconfig

between commits:

  b7846af2e6ca8 ("nvmem: airoha: Add support for SMC eFUSE")
  804a588eb58a2 ("nvmem: cleanup dead code in Kconfig")

=66rom the char-misc tree and commits:

  b13e7886c2e16 ("nvmem: airoha: Add support for SMC eFUSE")
  d5bd22d9d2032 ("nvmem: cleanup dead code in Kconfig")
  addd9b7203a3d ("eeprom: move nvmem EEPROM drivers to drivers/nvmem/")
  29d8d70e55efe ("nvmem: airoha: add ARM64 dependency")

=66rom the nvmem tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/nvmem/Kconfig
index e10f7ff725ff9,c36c2a4c2a0b7..0000000000000
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@@ -28,8 -28,96 +28,96 @@@ source "drivers/nvmem/layouts/Kconfig
 =20
  # Devices
 =20
+ if NVMEM_SYSFS
+=20
+ config EEPROM_AT24
+ 	tristate "I2C EEPROMs / RAMs / ROMs from most vendors"
+ 	depends on I2C && SYSFS
+ 	select REGMAP
+ 	select REGMAP_I2C
+ 	help
+ 	  Enable this driver to get read/write support to most I2C EEPROMs
+ 	  and compatible devices like FRAMs, SRAMs, ROMs etc. After you
+ 	  configure the driver to know about each chip on your target
+ 	  board.  Use these generic chip names, instead of vendor-specific
+ 	  ones like at24c64, 24lc02 or fm24c04:
+=20
+ 	     24c00, 24c01, 24c02, spd (readonly 24c02), 24c04, 24c08,
+ 	     24c16, 24c32, 24c64, 24c128, 24c256, 24c512, 24c1024, 24c2048
+=20
+ 	  Unless you like data loss puzzles, always be sure that any chip
+ 	  you configure as a 24c32 (32 kbit) or larger is NOT really a
+ 	  24c16 (16 kbit) or smaller, and vice versa. Marking the chip
+ 	  as read-only won't help recover from this. Also, if your chip
+ 	  has any software write-protect mechanism you may want to review the
+ 	  code to make sure this driver won't turn it on by accident.
+=20
+ 	  If you use this with an SMBus adapter instead of an I2C adapter,
+ 	  full functionality is not available.  Only smaller devices are
+ 	  supported (24c16 and below, max 4 kByte).
+=20
+ 	  This driver can also be built as a module.  If so, the module
+ 	  will be called at24.
+=20
+ config EEPROM_AT25
+ 	tristate "SPI EEPROMs (FRAMs) from most vendors"
+ 	depends on SPI && SYSFS
+ 	select SPI_MEM
+ 	help
+ 	  Enable this driver to get read/write support to most SPI EEPROMs
+ 	  and Cypress FRAMs,
+ 	  after you configure the board init code to know about each eeprom
+ 	  on your target board.
+=20
+ 	  This driver can also be built as a module.  If so, the module
+ 	  will be called at25.
+=20
+ config EEPROM_93XX46
+ 	tristate "Microwire EEPROM 93XX46 support"
+ 	depends on SPI && SYSFS
+ 	select REGMAP
+ 	help
+ 	  Driver for the microwire EEPROM chipsets 93xx46x. The driver
+ 	  supports both read and write commands and also the command to
+ 	  erase the whole EEPROM.
+=20
+ 	  This driver can also be built as a module.  If so, the module
+ 	  will be called eeprom_93xx46.
+=20
+ 	  If unsure, say N.
+=20
+ config EEPROM_EE1004
+ 	tristate "SPD EEPROMs on DDR4 memory modules"
+ 	depends on I2C && SYSFS
+ 	help
+ 	  Enable this driver to get read support to SPD EEPROMs following
+ 	  the JEDEC EE1004 standard. These are typically found on DDR4
+ 	  SDRAM memory modules.
+=20
+ 	  This driver can also be built as a module.  If so, the module
+ 	  will be called ee1004.
+=20
+ config EEPROM_M24LR
+ 	tristate "STMicroelectronics M24LR RFID/NFC EEPROM support"
+ 	depends on I2C && SYSFS
+ 	select REGMAP_I2C
+ 	help
+ 	  This enables support for STMicroelectronics M24LR RFID/NFC EEPROM
+ 	  chips. These dual-interface devices expose two I2C addresses:
+ 	  one for EEPROM memory access and another for control and system
+ 	  configuration (e.g. UID, password handling).
+=20
+ 	  This driver provides a sysfs interface for control functions and
+ 	  integrates with the nvmem subsystem for EEPROM access.
+=20
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called m24lr.
+=20
+ endif # NVMEM_SYSFS
+=20
  config NVMEM_AIROHA_SMC_EFUSES
  	tristate "Airoha SMC eFuse support"
+ 	depends on ARM64
  	depends on ARCH_AIROHA || COMPILE_TEST
  	depends on HAVE_ARM_SMCCC
  	default ARCH_AIROHA
diff --combined drivers/nvmem/Makefile
index f6f2bc51dee19,2bbfb9ff18859..0000000000000
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@@ -10,6 -10,11 +10,11 @@@ nvmem_layouts-y			:=3D layouts.
  obj-y				+=3D layouts/
 =20
  # Devices
+ obj-$(CONFIG_EEPROM_AT24)		+=3D at24.o
+ obj-$(CONFIG_EEPROM_AT25)		+=3D at25.o
+ obj-$(CONFIG_EEPROM_93XX46)		+=3D eeprom_93xx46.o
+ obj-$(CONFIG_EEPROM_EE1004)		+=3D ee1004.o
+ obj-$(CONFIG_EEPROM_M24LR)		+=3D m24lr.o
  obj-$(CONFIG_NVMEM_AIROHA_SMC_EFUSES)	+=3D nvmem-airoha-smc-efuses.o
  nvmem-airoha-smc-efuses-y 		:=3D airoha-smc-efuses.o
  obj-$(CONFIG_NVMEM_AN8855_EFUSE)	+=3D nvmem-an8855-efuse.o

--9bCBlf4BPvPi89E2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeN+IACgkQJNaLcl1U
h9At3wf/YrhE9mvrhzXjwpWDcgP/6q17NEm8/I8xfodL8QbCKiExYOTWv6+rpiHG
pTuefLISyaH1F3QYwCjZsEObO8F5OSZ8KgW8yssck3hGv6rjPl/AuvsCNik8cI9v
z3Oy2xnLbJAiKdxMYjSUDtju9hDj31EClSo/vZ3TKLURE8fwKw2MnF6rnUnh0eKH
cpPVN40kS1awIvruetSeJNnMpYGRfyll/P9vWIertIC5zU0XmrhdEQi9h8IoUwR5
7CBor7CLHelsgQO8OOwNgDY9iIEaks/+2KL/hBjCIL74Xk1EVYXmuKQgxb0SbjFA
BzhK9i/FH4gBgCJej2r/a4bBKpbknA==
=qoyM
-----END PGP SIGNATURE-----

--9bCBlf4BPvPi89E2--
