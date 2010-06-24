From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] zram: fix build errors, depends on BLOCK
Date: Wed, 23 Jun 2010 20:27:09 -0700
Message-ID: <20100623202709.4ecb798c.randy.dunlap@oracle.com>
References: <20100623154531.0a4b02e1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100623154531.0a4b02e1.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Nitin Gupta <ngupta@vflare.org>, devel@driverdev.osuosl.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix 49 zram build errors in one swoop.  Examples:

drivers/staging/zram/zram_drv.c:225: error: dereferencing pointer to incomplete type
drivers/staging/zram/zram_drv.c:226: error: implicit declaration of function 'bio_for_each_segment'
drivers/staging/zram/zram_drv.c:226: error: expected ';' before '{' token
drivers/staging/zram/zram_drv.c:281: error: implicit declaration of function 'bio_endio'
drivers/staging/zram/zram_drv.c:285: error: implicit declaration of function 'bio_io_error'
drivers/staging/zram/zram_drv.c:545: error: implicit declaration of function 'set_capacity'
drivers/staging/zram/zram_drv.c:548: error: implicit declaration of function 'queue_flag_set_unlocked'
drivers/staging/zram/zram_drv.c:548: error: 'QUEUE_FLAG_NONROT' undeclared (first use in this function)
drivers/staging/zram/zram_drv.c:548: error: dereferencing pointer to incomplete type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	devel@driverdev.osuosl.org
Cc:	Nitin Gupta <ngupta@vflare.org>
---
 drivers/staging/zram/Kconfig    |    1 +
 drivers/staging/zram/zram_drv.c |    1 +
 2 files changed, 2 insertions(+)

--- linux-next-20100623.orig/drivers/staging/zram/Kconfig
+++ linux-next-20100623/drivers/staging/zram/Kconfig
@@ -1,5 +1,6 @@
 config ZRAM
 	tristate "Compressed RAM block device support"
+	depends on BLOCK
 	select LZO_COMPRESS
 	select LZO_DECOMPRESS
 	default n
--- linux-next-20100623.orig/drivers/staging/zram/zram_drv.c
+++ linux-next-20100623/drivers/staging/zram/zram_drv.c
@@ -17,6 +17,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/bio.h>
 #include <linux/bitops.h>
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
