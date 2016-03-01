From: Alexandre Bounine <alexandre.bounine@idt.com>
Subject: [PATCH] rapidio/rio_mport_cdev: fix conflicting DMA configuration options
Date: Mon, 29 Feb 2016 19:05:36 -0500
Message-ID: <1456790736-14509-1-git-send-email-alexandre.bounine@idt.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mxout1.idt.com ([157.165.5.25]:44459 "EHLO mxout1.idt.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752610AbcCAAG3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Feb 2016 19:06:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Bounine <alexandre.bounine@idt.com>, Randy Dunlap <rdunlap@infradead.org>, Matt Porter <mporter@kernel.crashing.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

Fix to ensure that only CONFIG_RAPIDIO_DMA_ENGINE option is used to control
DMA code build.

Signed-off-by: Alexandre Bounine <alexandre.bounine@idt.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Matt Porter <mporter@kernel.crashing.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org
---
 drivers/rapidio/devices/rio_mport_cdev.c |   32 +++++++++++++----------------
 1 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index e9ec8dd..9faf4d5 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -178,7 +178,7 @@ struct mport_dev {
 	struct list_head		portwrites;
 	spinlock_t			pw_lock;
 	struct list_head	mappings;
-#ifdef CONFIG_DMA_ENGINE
+#ifdef CONFIG_RAPIDIO_DMA_ENGINE
 	struct dma_chan *dma_chan;
 	struct kref	dma_ref;
 	struct completion comp;
@@ -209,7 +209,7 @@ struct mport_cdev_priv {
 	wait_queue_head_t       event_rx_wait;
 	spinlock_t              fifo_lock;
 	unsigned int            event_mask; /* RIO_DOORBELL, RIO_PORTWRITE */
-#ifdef CONFIG_DMA_ENGINE
+#ifdef CONFIG_RAPIDIO_DMA_ENGINE
 	struct dma_chan		*dmach;
 	struct list_head	async_list;
 	struct list_head	pend_list;
@@ -532,7 +532,7 @@ static int maint_comptag_set(struct mport_cdev_priv *priv, void __user *arg)
 	return 0;
 }
 
-#ifdef CONFIG_DMA_ENGINE
+#ifdef CONFIG_RAPIDIO_DMA_ENGINE
 
 struct mport_dma_req {
 	struct list_head node;
@@ -1127,19 +1127,6 @@ err_tmo:
 	spin_unlock(&priv->req_lock);
 	return ret;
 }
-#else /* CONFIG_DMA_ENGINE */
-static int rio_mport_transfer_ioctl(struct file *filp, void *arg)
-{
-	return -ENODEV;
-}
-
-static int rio_mport_wait_for_async_dma(struct file *filp, void __user *arg)
-{
-	return -ENODEV;
-}
-#endif /* CONFIG_DMA_ENGINE */
-
-#ifdef CONFIG_RAPIDIO_DMA_ENGINE
 
 static int rio_mport_create_dma_mapping(struct mport_dev *md, struct file *filp,
 			uint64_t size, struct rio_mport_mapping **mapping)
@@ -1228,6 +1215,16 @@ static int rio_mport_free_dma(struct file *filp, void __user *arg)
 	return 0;
 }
 #else
+static int rio_mport_transfer_ioctl(struct file *filp, void *arg)
+{
+	return -ENODEV;
+}
+
+static int rio_mport_wait_for_async_dma(struct file *filp, void __user *arg)
+{
+	return -ENODEV;
+}
+
 static int rio_mport_alloc_dma(struct file *filp, void __user *arg)
 {
 	return -ENODEV;
@@ -1237,7 +1234,6 @@ static int rio_mport_free_dma(struct file *filp, void __user *arg)
 {
 	return -ENODEV;
 }
-
 #endif /* CONFIG_RAPIDIO_DMA_ENGINE */
 
 /*
@@ -1956,7 +1952,7 @@ static int mport_cdev_open(struct inode *inode, struct file *filp)
 		goto err_fifo;
 	}
 
-#ifdef CONFIG_DMA_ENGINE
+#ifdef CONFIG_RAPIDIO_DMA_ENGINE
 	INIT_LIST_HEAD(&priv->async_list);
 	INIT_LIST_HEAD(&priv->pend_list);
 	spin_lock_init(&priv->req_lock);
-- 
1.7.8.4
