From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] gadget: f_fs.c needs to include pagemap.h
Date: Mon, 10 May 2010 10:51:36 -0700
Message-ID: <20100510105136.eee3e58a.randy.dunlap@oracle.com>
References: <20100510160234.54f76c0a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100510160234.54f76c0a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Nazarewicz <m.nazarewicz@samsung.com>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lud <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix g_ffs build error, add a needed header file:

drivers/usb/gadget/f_fs.c:1064:error: 'PAGE_CACHE_SIZE' undeclared (first use in this function)
drivers/usb/gadget/f_fs.c:1065:error: 'PAGE_CACHE_SHIFT' undeclared (first use in this function)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Michal Nazarewicz <m.nazarewicz@samsung.com>
---
 drivers/usb/gadget/f_fs.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100510.orig/drivers/usb/gadget/f_fs.c
+++ linux-next-20100510/drivers/usb/gadget/f_fs.c
@@ -28,6 +28,7 @@
 /* #define VERBOSE_DEBUG */
 
 #include <linux/blkdev.h>
+#include <linux/pagemap.h>
 #include <asm/unaligned.h>
 #include <linux/smp_lock.h>
 
