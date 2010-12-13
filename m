From: Timur Tabi <timur@freescale.com>
Subject: [PATCH 1/2] driver-core: document restrictions on device_rename()
Date: Mon, 13 Dec 2010 14:08:52 -0600
Message-ID: <1292270933-4127-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:12768 "EHLO
	TX2EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754911Ab0LMUI6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Dec 2010 15:08:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, greg@kroah.com

Add text, courtesy of Kay Sievers, that provides some background on
device_rename() and why it shouldn't be used.

Signed-off-by: Timur Tabi <timur@freescale.com>
---

This patch is for linux-next

 drivers/base/core.c |   29 ++++++++++++++++++++++++++++-
 1 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 080e9ca..9cd3b5c 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1551,7 +1551,34 @@ EXPORT_SYMBOL_GPL(device_destroy);
  * on the same device to ensure that new_name is valid and
  * won't conflict with other devices.
  *
- * "Never use this function, bad things will happen" - gregkh
+ * Note: Don't call this function.  Currently, the networking layer calls this
+ * function, but that will change.  The following text from Kay Sievers offers
+ * some insight:
+ *
+ * Renaming devices is racy at many levels, symlinks and other stuff are not
+ * replaced atomically, and you get a "move" uevent, but it's not easy to
+ * connect the event to the old and new device. Device nodes are not renamed at
+ * all, there isn't even support for that in the kernel now.
+ *
+ * In the meantime, during renaming, your target name might be taken by another
+ * driver, creating conflicts. Or the old name is taken directly after you
+ * renamed it -- then you get events for the same DEVPATH, before you even see
+ * the "move" event. It's just a mess, and nothing new should ever rely on
+ * kernel device renaming. Besides that, it's not even implemented now for
+ * other things than (driver-core wise very simple) network devices.
+ *
+ * We are currently about to change network renaming in udev to completely
+ * disallow renaming of devices in the same namespace as the kernel uses,
+ * because we can't solve the problems properly, that arise with swapping names
+ * of multiple interfaces without races. Means, renaming of eth[0-9]* will only
+ * be allowed to some other name than eth[0-9]*, for the aforementioned
+ * reasons.
+ *
+ * Make up a "real" name in the driver before you register anything, or add
+ * some other attributes for userspace to find the device, or use udev to add
+ * symlinks -- but never rename kernel devices later, it's a complete mess. We
+ * don't even want to get into that and try to implement the missing pieces in
+ * the core. We really have other pieces to fix in the driver core mess. :)
  */
 int device_rename(struct device *dev, const char *new_name)
 {
-- 
1.7.2.3
