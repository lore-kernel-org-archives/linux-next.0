From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] regulator: aat2870-regulator.c needs module.h
Date: Fri, 29 Jul 2011 21:13:09 -0700
Message-ID: <20110729211309.92e8b744.rdunlap@xenotime.net>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

aat2870-regulator.c needs to include linux/module.h to fix multiple
build errors.

drivers/regulator/aat2870-regulator.c:145: error: 'THIS_MODULE' undeclared here (not in a function)
drivers/regulator/aat2870-regulator.c:230: warning: type defaults to 'int' in declaration of 'MODULE_DESCRIPTION'
drivers/regulator/aat2870-regulator.c:231: warning: type defaults to 'int' in declaration of 'MODULE_LICENSE'
drivers/regulator/aat2870-regulator.c:232: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/regulator/aat2870-regulator.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110729.orig/drivers/regulator/aat2870-regulator.c
+++ linux-next-20110729/drivers/regulator/aat2870-regulator.c
@@ -22,6 +22,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/err.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
