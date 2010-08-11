From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] hwmon: jc42 depends on I2C
Date: Wed, 11 Aug 2010 10:35:11 -0700
Message-ID: <20100811103511.41428e62.randy.dunlap@oracle.com>
References: <20100811140009.6ff33109.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:42081 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753424Ab0HKRgn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Aug 2010 13:36:43 -0400
In-Reply-To: <20100811140009.6ff33109.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, lm-sensors@lm-sensors.org, Guenter Roeck <guenter.roeck@ericsson.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

jc42 uses i2c interfaces, so it should depend on I2C.

drivers/hwmon/jc42.c:426: error: implicit declaration of function 'i2c_check_functionality'
drivers/hwmon/jc42.c:521: error: implicit declaration of function 'i2c_smbus_read_word_data'
drivers/hwmon/jc42.c:529: error: implicit declaration of function 'i2c_smbus_write_word_data'
drivers/hwmon/jc42.c:580: error: implicit declaration of function 'i2c_add_driver'
drivers/hwmon/jc42.c:585: error: implicit declaration of function 'i2c_del_driver'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	lm-sensors@lm-sensors.org
---
 drivers/hwmon/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100811.orig/drivers/hwmon/Kconfig
+++ linux-next-20100811/drivers/hwmon/Kconfig
@@ -465,6 +465,7 @@ config SENSORS_JZ4740
 
 config SENSORS_JC42
 	tristate "JEDEC JC42.4 compliant temperature sensors"
+	depends on I2C
 	help
 	  If you say yes here you get support for Jedec JC42.4 compliant
 	  temperature sensors. Support will include, but not be limited to,
