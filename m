From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the mfd tree
Date: Tue, 16 Feb 2016 14:33:21 +1100
Message-ID: <20160216143321.106e2e19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41621 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752759AbcBPDd1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 22:33:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

Hi Linus,

Today's linux-next merge of the gpio tree got conflicts in:

  drivers/gpio/Kconfig
  drivers/gpio/Makefile

between commit:

  5d8c473983fc ("gpio: tps65086: Add GPO driver for the TPS65086 PMIC")

from the mfd tree and commit:

  b866526d0cfe ("gpio: Add driver for TI TPIC2810")
  c366c76a2c41 ("gpio: add tps65218 gpio")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpio/Kconfig
index 2b80903965d1,ad226485a8e4..000000000000
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@@ -844,12 -889,13 +889,19 @@@ config GPIO_TIMBERDAL
  	---help---
  	Add support for the GPIO IP in the timberdale FPGA.
  
 +config GPIO_TPS65086
 +	tristate "TI TPS65086 GPO"
 +	depends on MFD_TPS65086
 +	help
 +	  This driver supports the GPO on TI TPS65086x PMICs.
 +
+ config GPIO_TPS65218
+ 	tristate "TPS65218 GPIO"
+ 	depends on MFD_TPS65218
+ 	help
+ 	  Select this option to enable GPIO driver for the TPS65218
+ 	  chip family.
+ 
  config GPIO_TPS6586X
  	bool "TPS6586X GPIO"
  	depends on MFD_TPS6586X
diff --cc drivers/gpio/Makefile
index c759190b73fa,f1d3d823d1bc..000000000000
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@@ -95,7 -97,8 +97,9 @@@ obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc35
  obj-$(CONFIG_ARCH_TEGRA)	+= gpio-tegra.o
  obj-$(CONFIG_GPIO_TIMBERDALE)	+= gpio-timberdale.o
  obj-$(CONFIG_GPIO_PALMAS)	+= gpio-palmas.o
 +obj-$(CONFIG_GPIO_TPS65086)	+= gpio-tps65086.o
+ obj-$(CONFIG_GPIO_TPIC2810)	+= gpio-tpic2810.o
+ obj-$(CONFIG_GPIO_TPS65218)	+= gpio-tps65218.o
  obj-$(CONFIG_GPIO_TPS6586X)	+= gpio-tps6586x.o
  obj-$(CONFIG_GPIO_TPS65910)	+= gpio-tps65910.o
  obj-$(CONFIG_GPIO_TPS65912)	+= gpio-tps65912.o
