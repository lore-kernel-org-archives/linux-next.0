From: Frank Haverkamp <haver@linux.vnet.ibm.com>
Subject: [PATCH 2/2] GenWQE: Replace dynamic_hex_dump with print_hex_dump_debug
Date: Fri, 20 Dec 2013 16:26:11 +0100
Message-ID: <1387553171-31469-2-git-send-email-haver@linux.vnet.ibm.com>
References: <CA+r1Zhimt7Xusnc4kkkVqfoRhfZRnreMmZqaN7WP7rSpZ3XTvw@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+r1Zhimt7Xusnc4kkkVqfoRhfZRnreMmZqaN7WP7rSpZ3XTvw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: fengguang.wu@intel.com
Cc: jim.epost@gmail.com, sfr@canb.auug.org.au, gregkh@linuxfoundation.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild-all@01.org, haver@linux.vnet.ibm.com
List-Id: linux-next.vger.kernel.org

As requested by Greg, replacing the hexdump function from dynamic_debug.h
with one defined in printk.h. I hope I picked the right one.

Signed-off-by: Frank Haverkamp <haver@linux.vnet.ibm.com>
---
 drivers/misc/genwqe/genwqe_driver.h |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/drivers/misc/genwqe/genwqe_driver.h
+++ b/drivers/misc/genwqe/genwqe_driver.h
@@ -31,7 +31,7 @@
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/dynamic_debug.h>
+#include <linux/printk.h>
 
 #include <asm/byteorder.h>
 #include <linux/genwqe/genwqe_card.h>
@@ -69,7 +69,9 @@ static inline void genwqe_hexdump(struct
 
 	scnprintf(prefix, sizeof(prefix), "%s %s: ",
 		  GENWQE_DEVNAME, pci_name(pci_dev));
-	dynamic_hex_dump(prefix, DUMP_PREFIX_OFFSET, 16, 1, buff, size, true);
+
+	print_hex_dump_debug(prefix, DUMP_PREFIX_OFFSET, 16, 1, buff,
+			     size, true);
 }
 
 #endif	/* __GENWQE_DRIVER_H__ */
