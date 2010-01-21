From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] mfd: htc-i2cpld depends on GPIOLIB
Date: Wed, 20 Jan 2010 19:55:34 -0800
Message-ID: <4B57D036.2000001@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:33081 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751551Ab0AUDz7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2010 22:55:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

htc-i2cpld should depend on GPIOLIB, otherwise there are many
build errors:

drivers/mfd/htc-i2cpld.c:50: error: field 'chip_out' has incomplete type
drivers/mfd/htc-i2cpld.c:54: error: field 'chip_in' has incomplete type
drivers/mfd/htc-i2cpld.c:243: warning: type defaults to 'int' in declaration of '__mptr'
drivers/mfd/htc-i2cpld.c:243: warning: initialization from incompatible pointer type
drivers/mfd/htc-i2cpld.c:278: warning: type defaults to 'int' in declaration of '__mptr'
drivers/mfd/htc-i2cpld.c:278: warning: initialization from incompatible pointer type
drivers/mfd/htc-i2cpld.c:282: warning: type defaults to 'int' in declaration of '__mptr'
drivers/mfd/htc-i2cpld.c:282: warning: initialization from incompatible pointer type
drivers/mfd/htc-i2cpld.c:315: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:322: warning: type defaults to 'int' in declaration of '__mptr'
drivers/mfd/htc-i2cpld.c:322: warning: initialization from incompatible pointer type
drivers/mfd/htc-i2cpld.c:467+: error: dereferencing pointer to incomplete type [19X]
drivers/mfd/htc-i2cpld.c:490: error: implicit declaration of function 'gpiochip_add'
drivers/mfd/htc-i2cpld.c:504: error: implicit declaration of function 'gpiochip_remove'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>
---
 drivers/mfd/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100120.orig/drivers/mfd/Kconfig
+++ linux-next-20100120/drivers/mfd/Kconfig
@@ -80,7 +80,7 @@ config HTC_PASIC3
 
 config HTC_I2CPLD
 	bool "HTC I2C PLD chip support"
-	depends on I2C=y
+	depends on I2C=y && GPIOLIB
 	help
 	  If you say yes here you get support for the supposed CPLD
 	  found on omap850 HTC devices like the HTC Wizard and HTC Herald.
