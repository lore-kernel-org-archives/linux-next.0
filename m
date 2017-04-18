From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mux tree with the i2c tree
Date: Tue, 18 Apr 2017 15:59:58 +1000
Message-ID: <20170418155958.73116b94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45257 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754113AbdDRGAB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Apr 2017 02:00:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Hennerich <michael.hennerich@analog.com>

Hi all,

Today's linux-next merge of the mux tree got conflicts in:

  drivers/i2c/muxes/Makefile
  drivers/i2c/muxes/Kconfig

between commit:

  dbed8a803bd3 ("i2c: mux: ltc4306: LTC4306 and LTC4305 I2C multiplexer/switch")

from the i2c tree and commit:

  69c689cbeefa ("i2c: i2c-mux-gpmux: new driver")

from the mux tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/i2c/muxes/Kconfig
index 1e160fc37ecc,11115fb34f24..000000000000
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@@ -30,17 -30,19 +30,30 @@@ config I2C_MUX_GPI
  	  This driver can also be built as a module.  If so, the module
  	  will be called i2c-mux-gpio.
  
+ config I2C_MUX_GPMUX
+ 	tristate "General Purpose I2C multiplexer"
+ 	select MULTIPLEXER
+ 	depends on OF
+ 	help
+ 	  If you say yes to this option, support will be included for a
+ 	  general purpose I2C multiplexer. This driver provides access to
+ 	  I2C busses connected through a MUX, which in turn is controlled
+ 	  by a MUX-controller from the MUX subsystem.
+ 
+ 	  This driver can also be built as a module.  If so, the module
+ 	  will be called i2c-mux-gpmux.
+ 
 +config I2C_MUX_LTC4306
 +	tristate "LTC LTC4306/5 I2C multiplexer"
 +	select GPIOLIB
 +	select REGMAP_I2C
 +	help
 +	  If you say yes here you get support for the Analog Devices
 +	  LTC4306 or LTC4305 I2C mux/switch devices.
 +
 +	  This driver can also be built as a module.  If so, the module
 +	  will be called i2c-mux-ltc4306.
 +
  config I2C_MUX_PCA9541
  	tristate "NXP PCA9541 I2C Master Selector"
  	help
diff --cc drivers/i2c/muxes/Makefile
index ff7618cd5312,af43c6c3e861..000000000000
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@@ -6,7 -6,7 +6,8 @@@ obj-$(CONFIG_I2C_ARB_GPIO_CHALLENGE)	+
  obj-$(CONFIG_I2C_DEMUX_PINCTRL)		+= i2c-demux-pinctrl.o
  
  obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
+ obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
 +obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
  obj-$(CONFIG_I2C_MUX_MLXCPLD)	+= i2c-mux-mlxcpld.o
  obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
  obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
