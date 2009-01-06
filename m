From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree
Date: Tue, 6 Jan 2009 16:14:09 +1100
Message-ID: <20090106161409.da9932a2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60339 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751199AbZAFFOQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 00:14:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg KH <greg@kroah.com>

Hi Samuel,

Today's linux-next merge of the mfd tree got a conflict in
drivers/i2c/chips/Makefile between commit
a234ae259954121886f7f589a9cf1915d6dfab88 ("USB: move isp1301_omap to
drivers/usb/otg") from the usb tree and commits
87c13493e6a59c0da55c2824f0205f9ef941b760 ("mfd: move
drivers/i2c/chips/tps65010.c to drivers/mfd") and
88e75cc347f66bc20e3c2b920431fc07253d69be ("mfd: move
drivers/i2c/chips/menelaus.c to drivers/mfd") from the mfd tree.

Again, just adjacent removals.  I fixed it up (see below) and can carry
the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/i2c/chips/Makefile
index aa7552d,8b95f41..0000000
--- a/drivers/i2c/chips/Makefile
+++ b/drivers/i2c/chips/Makefile
@@@ -18,8 -18,7 +18,6 @@@ obj-$(CONFIG_SENSORS_PCA9539)	+= pca953
  obj-$(CONFIG_SENSORS_PCF8574)	+= pcf8574.o
  obj-$(CONFIG_PCF8575)		+= pcf8575.o
  obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
- obj-$(CONFIG_TPS65010)		+= tps65010.o
- obj-$(CONFIG_MENELAUS)		+= menelaus.o
 -obj-$(CONFIG_ISP1301_OMAP)	+= isp1301_omap.o
  obj-$(CONFIG_SENSORS_TSL2550)	+= tsl2550.o
  obj-$(CONFIG_MCU_MPC8349EMITX)	+= mcu_mpc8349emitx.o
  
