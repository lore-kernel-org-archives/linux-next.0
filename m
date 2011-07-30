From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] i2c: i2c-pxa-pci.c needs module.h
Date: Fri, 29 Jul 2011 21:14:30 -0700
Message-ID: <20110729211430.6c4830bd.rdunlap@xenotime.net>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:60226 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751002Ab1G3EPX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Jul 2011 00:15:23 -0400
In-Reply-To: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-i2c@vger.kernel.org, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, khali@linux-fr.org, ben-linux@fluff.org

From: Randy Dunlap <rdunlap@xenotime.net>

i2c-pxa-pci.c uses interfaces from linux/module.h, so it should
include that file.  This fixes build errors.

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/i2c/busses/i2c-pxa-pci.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110729.orig/drivers/i2c/busses/i2c-pxa-pci.c
+++ linux-next-20110729/drivers/i2c/busses/i2c-pxa-pci.c
@@ -3,6 +3,7 @@
  * It does not support slave mode, the register slightly moved. This PCI
  * device provides three bars, every contains a single I2C controller.
  */
+#include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/i2c/pxa-i2c.h>
