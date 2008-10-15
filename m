From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree
Date: Wed, 15 Oct 2008 20:30:10 +1100
Message-ID: <20081015203010.279b57dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47812 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751243AbYJOJk6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 05:40:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: linux-next@vger.kernel.org, =?UTF-8?B?Ik1hcmVrIFZhxaF1dCI=?= <marek.vasut@gmail.com>, David Brownell <dbrownell@users.sourceforge.net>, Eric Miao <eric.miao@marvell.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>

Hi Samuel,

Today's linux-next merge of the mfd tree got a conflict in
drivers/mfd/Kconfig and drivers/mfd/Makefile between various commits from
Linus' tree and commits from the mfd tree.

Just overlapping additions.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/mfd/Kconfig
index 5eff8ad,fe3c083..0000000
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@@ -50,15 -50,20 +50,29 @@@ config HTC_PASIC
  	  HTC Magician devices, respectively. Actual functionality is
  	  handled by the leds-pasic3 and ds1wm drivers.
  
 +config UCB1400_CORE
 +	tristate "Philips UCB1400 Core driver"
 +	help
 +	  This enables support for the Philips UCB1400 core functions.
 +	  The UCB1400 is an AC97 audio codec.
 +
 +	  To compile this driver as a module, choose M here: the
 +	  module will be called ucb1400_core.
 +
+ config TWL4030_CORE
+ 	bool "Texas Instruments TWL4030/TPS659x0 Support"
+ 	depends on I2C=y && GENERIC_HARDIRQS && (ARCH_OMAP2 || ARCH_OMAP3)
+ 	help
+ 	  Say yes here if you have TWL4030 family chip on your board.
+ 	  This core driver provides register access and IRQ handling
+ 	  facilities, and registers devices for the various functions
+ 	  so that function-specific drivers can bind to them.
+ 
+ 	  These multi-function chips are found on many OMAP2 and OMAP3
+ 	  boards, providing power management, RTC, GPIO, keypad, a
+ 	  high speed USB OTG transceiver, an audio codec (on most
+ 	  versions) and many other features.
+ 
  config MFD_TMIO
  	bool
  	default n
@@@ -87,44 -92,17 +101,55 @@@ config MFD_TC6393X
  	help
  	  Support for Toshiba Mobile IO Controller TC6393XB
  
 +config MFD_WM8400
 +	tristate "Support Wolfson Microelectronics WM8400"
 +	help
 +	  Support for the Wolfson Microelecronics WM8400 PMIC and audio
 +	  CODEC.  This driver adds provides common support for accessing
 +	  the device, additional drivers must be enabled in order to use
 +	  the functionality of the device.
 +
 +config MFD_WM8350
 +	tristate
 +
 +config MFD_WM8350_CONFIG_MODE_0
 +	bool
 +	depends on MFD_WM8350
 +
 +config MFD_WM8350_CONFIG_MODE_1
 +	bool
 +	depends on MFD_WM8350
 +
 +config MFD_WM8350_CONFIG_MODE_2
 +	bool
 +	depends on MFD_WM8350
 +
 +config MFD_WM8350_CONFIG_MODE_3
 +	bool
 +	depends on MFD_WM8350
 +
 +config MFD_WM8350_I2C
 +	tristate "Support Wolfson Microelectronics WM8350 with I2C"
 +	select MFD_WM8350
 +	depends on I2C
 +	help
 +	  The WM8350 is an integrated audio and power management
 +	  subsystem with watchdog and RTC functionality for embedded
 +	  systems.  This option enables core support for the WM8350 with
 +	  I2C as the control interface.  Additional options must be
 +	  selected to enable support for the functionality of the chip.
 +
+ config PMIC_DA903X
+ 	bool "Dialog Semiconductor DA9030/DA9034 PMIC Support"
+ 	depends on I2C=y
+ 	help
+ 	  Say yes here to support for Dialog Semiconductor DA9030 (a.k.a
+ 	  ARAVA) and DA9034 (a.k.a MICCO), these are Power Management IC
+ 	  usually found on PXA processors-based platforms. This includes
+ 	  the I2C driver and the core APIs _only_, you have to select
+ 	  individual components like LCD backlight, voltage regulators,
+ 	  LEDs and battery-charger under the corresponding menus.
+ 
  endmenu
  
  menu "Multimedia Capabilities Port drivers"
diff --cc drivers/mfd/Makefile
index 759b1fe,8dcbb51..0000000
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@@ -12,10 -12,7 +12,11 @@@ obj-$(CONFIG_MFD_T7L66XB)	+= t7l66xb.
  obj-$(CONFIG_MFD_TC6387XB)	+= tc6387xb.o
  obj-$(CONFIG_MFD_TC6393XB)	+= tc6393xb.o
  
 +obj-$(CONFIG_MFD_WM8400)	+= wm8400-core.o
 +wm8350-objs			:= wm8350-core.o wm8350-regmap.o wm8350-gpio.o
 +obj-$(CONFIG_MFD_WM8350)	+= wm8350.o
 +obj-$(CONFIG_MFD_WM8350_I2C)	+= wm8350-i2c.o
+ obj-$(CONFIG_TWL4030_CORE)	+= twl4030-core.o
  
  obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
  
@@@ -27,4 -24,5 +28,6 @@@ obj-$(CONFIG_MCP_UCB1200_TS)	+= ucb1x00
  ifeq ($(CONFIG_SA1100_ASSABET),y)
  obj-$(CONFIG_MCP_UCB1200)	+= ucb1x00-assabet.o
  endif
 +obj-$(CONFIG_UCB1400_CORE)	+= ucb1400_core.o
+ 
+ obj-$(CONFIG_PMIC_DA903X)	+= da903x.o
