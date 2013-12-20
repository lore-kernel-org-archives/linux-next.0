From: Frank Haverkamp <haver@linux.vnet.ibm.com>
Subject: [PATCH] GenWQE: Accidently casting to u32 where u64 is required
Date: Fri, 20 Dec 2013 20:27:20 +0100
Message-ID: <1387567640-25413-1-git-send-email-haver@linux.vnet.ibm.com>
References: <1387566773.1847.28.camel@oc7383187364.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387566773.1847.28.camel@oc7383187364.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: jim.epost@gmail.com, sfr@canb.auug.org.au, fengguang.wu@intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild-all@01.org, haver@linux.vnet.ibm.com
List-Id: linux-next.vger.kernel.org

Fix a casting to u32 where u64 would be appropriate.
The bad casting made the driver unusable.

Signed-off-by: Frank Haverkamp <haver@linux.vnet.ibm.com>
---
 drivers/misc/genwqe/card_utils.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/misc/genwqe/card_utils.c
+++ b/drivers/misc/genwqe/card_utils.c
@@ -59,7 +59,7 @@ int __genwqe_writeq(struct genwqe_dev *c
 	if (cd->mmio == NULL)
 		return -EIO;
 
-	__raw_writeq((__force u32)cpu_to_be64(val), cd->mmio + byte_offs);
+	__raw_writeq((__force u64)cpu_to_be64(val), cd->mmio + byte_offs);
 	return 0;
 }
 
