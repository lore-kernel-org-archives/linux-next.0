From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree
Date: Tue, 6 Jan 2009 16:11:07 +1100
Message-ID: <20090106161107.a8448d3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44461 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750796AbZAFFLQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 00:11:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg KH <greg@kroah.com>

Hi Samuel,

Today's linux-next merge of the mfd tree got a conflict in
drivers/i2c/chips/Kconfig between commit
a234ae259954121886f7f589a9cf1915d6dfab88 ("USB: move isp1301_omap to
drivers/usb/otg") from the usb tree and commit
87c13493e6a59c0da55c2824f0205f9ef941b760 ("mfd: move
drivers/i2c/chips/tps65010.c to drivers/mfd") from the mfd tree.

Just context changes (due to adjacent deletions).  I fixed it up (see
below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/i2c/chips/Kconfig
index b2ea731,864ac56..0000000
--- a/drivers/i2c/chips/Kconfig
+++ b/drivers/i2c/chips/Kconfig
@@@ -114,19 -114,18 +114,6 @@@ config SENSORS_PCF859
  	  These devices are hard to detect and rarely found on mainstream
  	  hardware.  If unsure, say N.
  
- config TPS65010
- 	tristate "TPS6501x Power Management chips"
- 	depends on GPIOLIB
- 	default y if MACH_OMAP_H2 || MACH_OMAP_H3 || MACH_OMAP_OSK
- 	help
- 	  If you say yes here you get support for the TPS6501x series of
- 	  Power Management chips.  These include voltage regulators,
- 	  lithium ion/polymer battery charging, and other features that
- 	  are often used in portable devices like cell phones and cameras.
- 
- 	  This driver can also be built as a module.  If so, the module
- 	  will be called tps65010.
- 
 -config ISP1301_OMAP
 -	tristate "Philips ISP1301 with OMAP OTG"
 -	depends on ARCH_OMAP_OTG
 -	help
 -	  If you say yes here you get support for the Philips ISP1301
 -	  USB-On-The-Go transceiver working with the OMAP OTG controller.
 -	  The ISP1301 is used in products including H2 and H3 development
 -	  boards for Texas Instruments OMAP processors.
 -	  
 -	  This driver can also be built as a module.  If so, the module
 -	  will be called isp1301_omap.
 -
  config SENSORS_MAX6875
  	tristate "Maxim MAX6875 Power supply supervisor"
  	depends on EXPERIMENTAL
