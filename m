From: Alexandre Bounine <alexandre.bounine@idt.com>
Subject: [PATCH] rapidio/rio_mport_cdev: fix build failure if CONFIG_DMA_ENGINE is not enabled
Date: Mon, 29 Feb 2016 11:52:15 -0500
Message-ID: <1456764735-705-1-git-send-email-alexandre.bounine@idt.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Bounine <alexandre.bounine@idt.com>, Randy Dunlap <rdunlap@infradead.org>, Matt Porter <mporter@kernel.crashing.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Fix the driver build failure if CONFIG_DMA_ENGINE option is not enabled
This patch is applicable to linux-next tree.

Signed-off-by: Alexandre Bounine <alexandre.bounine@idt.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Matt Porter <mporter@kernel.crashing.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org
---
 drivers/rapidio/devices/rio_mport_cdev.c |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index 6d56725..e9ec8dd 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -1133,7 +1133,7 @@ static int rio_mport_transfer_ioctl(struct file *filp, void *arg)
 	return -ENODEV;
 }
 
-static int rio_mport_wait_for_async_dma(struct file *filp, int32_t arg)
+static int rio_mport_wait_for_async_dma(struct file *filp, void __user *arg)
 {
 	return -ENODEV;
 }
@@ -1227,6 +1227,16 @@ static int rio_mport_free_dma(struct file *filp, void __user *arg)
 
 	return 0;
 }
+#else
+static int rio_mport_alloc_dma(struct file *filp, void __user *arg)
+{
+	return -ENODEV;
+}
+
+static int rio_mport_free_dma(struct file *filp, void __user *arg)
+{
+	return -ENODEV;
+}
 
 #endif /* CONFIG_RAPIDIO_DMA_ENGINE */
 
@@ -1935,10 +1945,7 @@ static int mport_cdev_open(struct inode *inode, struct file *filp)
 
 	INIT_LIST_HEAD(&priv->db_filters);
 	INIT_LIST_HEAD(&priv->pw_filters);
-	INIT_LIST_HEAD(&priv->async_list);
-	INIT_LIST_HEAD(&priv->pend_list);
 	spin_lock_init(&priv->fifo_lock);
-	spin_lock_init(&priv->req_lock);
 	init_waitqueue_head(&priv->event_rx_wait);
 	ret = kfifo_alloc(&priv->event_fifo,
 			  sizeof(struct rio_event) * MPORT_EVENT_DEPTH,
@@ -1950,6 +1957,9 @@ static int mport_cdev_open(struct inode *inode, struct file *filp)
 	}
 
 #ifdef CONFIG_DMA_ENGINE
+	INIT_LIST_HEAD(&priv->async_list);
+	INIT_LIST_HEAD(&priv->pend_list);
+	spin_lock_init(&priv->req_lock);
 	mutex_init(&priv->dma_lock);
 #endif
 
-- 
1.7.8.4
