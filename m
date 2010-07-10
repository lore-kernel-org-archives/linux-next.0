From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] uvc: Fix multiple symbols definitions with UVC gadget and host drivers
Date: Sat, 10 Jul 2010 21:13:05 +0200
Message-ID: <1278789185-24989-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from perceval.irobotique.be ([92.243.18.41]:46023 "EHLO
	perceval.irobotique.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757Ab0GJTMJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 10 Jul 2010 15:12:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mchehab@infradead.org
Cc: mingo@elte.hu, randy.dunlap@oracle.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org

The UVC gadget driver borrowed code from the UVC host driver without
changing the symbol names. This results in a namespace clash with
multiple definitions of several symbols when compiling both drivers in
the kernel.

Make all generic UVC functions and variables static in the UVC gadget
driver, as the symbols are not referenced outside of the gadget driver.
Rename the uvc_trace_param global variable to uvc_gadget_trace_param.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/usb/gadget/f_uvc.c     |    4 +-
 drivers/usb/gadget/uvc.h       |   10 +--
 drivers/usb/gadget/uvc_queue.c |  153 +++++++++++++++++++++-------------------
 drivers/usb/gadget/uvc_queue.h |   20 -----
 drivers/usb/gadget/uvc_v4l2.c  |    2 +-
 drivers/usb/gadget/uvc_video.c |    6 +-
 drivers/usb/gadget/webcam.c    |    4 +-
 7 files changed, 89 insertions(+), 110 deletions(-)

diff --git a/drivers/usb/gadget/f_uvc.c b/drivers/usb/gadget/f_uvc.c
index fc2611f..dbe6db0 100644
--- a/drivers/usb/gadget/f_uvc.c
+++ b/drivers/usb/gadget/f_uvc.c
@@ -28,7 +28,7 @@
 
 #include "uvc.h"
 
-unsigned int uvc_trace_param;
+unsigned int uvc_gadget_trace_param;
 
 /* --------------------------------------------------------------------------
  * Function descriptors
@@ -656,6 +656,6 @@ error:
 	return ret;
 }
 
-module_param_named(trace, uvc_trace_param, uint, S_IRUGO|S_IWUSR);
+module_param_named(trace, uvc_gadget_trace_param, uint, S_IRUGO|S_IWUSR);
 MODULE_PARM_DESC(trace, "Trace level bitmask");
 
diff --git a/drivers/usb/gadget/uvc.h b/drivers/usb/gadget/uvc.h
index 0a705e6..e92454c 100644
--- a/drivers/usb/gadget/uvc.h
+++ b/drivers/usb/gadget/uvc.h
@@ -107,11 +107,11 @@ struct uvc_streaming_control {
 #define UVC_WARN_MINMAX				0
 #define UVC_WARN_PROBE_DEF			1
 
-extern unsigned int uvc_trace_param;
+extern unsigned int uvc_gadget_trace_param;
 
 #define uvc_trace(flag, msg...) \
 	do { \
-		if (uvc_trace_param & flag) \
+		if (uvc_gadget_trace_param & flag) \
 			printk(KERN_DEBUG "uvcvideo: " msg); \
 	} while (0)
 
@@ -220,16 +220,10 @@ struct uvc_file_handle
 #define to_uvc_file_handle(handle) \
 	container_of(handle, struct uvc_file_handle, vfh)
 
-extern struct v4l2_file_operations uvc_v4l2_fops;
-
 /* ------------------------------------------------------------------------
  * Functions
  */
 
-extern int uvc_video_enable(struct uvc_video *video, int enable);
-extern int uvc_video_init(struct uvc_video *video);
-extern int uvc_video_pump(struct uvc_video *video);
-
 extern void uvc_endpoint_stream(struct uvc_device *dev);
 
 extern void uvc_function_connect(struct uvc_device *uvc);
diff --git a/drivers/usb/gadget/uvc_queue.c b/drivers/usb/gadget/uvc_queue.c
index 4389199..f7395ac 100644
--- a/drivers/usb/gadget/uvc_queue.c
+++ b/drivers/usb/gadget/uvc_queue.c
@@ -78,7 +78,8 @@
  *
  */
 
-void uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
+static void
+uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
 {
 	mutex_init(&queue->mutex);
 	spin_lock_init(&queue->irqlock);
@@ -88,6 +89,28 @@ void uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
 }
 
 /*
+ * Free the video buffers.
+ *
+ * This function must be called with the queue lock held.
+ */
+static int uvc_free_buffers(struct uvc_video_queue *queue)
+{
+	unsigned int i;
+
+	for (i = 0; i < queue->count; ++i) {
+		if (queue->buffer[i].vma_use_count != 0)
+			return -EBUSY;
+	}
+
+	if (queue->count) {
+		vfree(queue->mem);
+		queue->count = 0;
+	}
+
+	return 0;
+}
+
+/*
  * Allocate the video buffers.
  *
  * Pages are reserved to make sure they will not be swapped, as they will be
@@ -95,8 +118,9 @@ void uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
  *
  * Buffers will be individually mapped, so they must all be page aligned.
  */
-int uvc_alloc_buffers(struct uvc_video_queue *queue, unsigned int nbuffers,
-		unsigned int buflength)
+static int
+uvc_alloc_buffers(struct uvc_video_queue *queue, unsigned int nbuffers,
+		  unsigned int buflength)
 {
 	unsigned int bufsize = PAGE_ALIGN(buflength);
 	unsigned int i;
@@ -150,28 +174,6 @@ done:
 	return ret;
 }
 
-/*
- * Free the video buffers.
- *
- * This function must be called with the queue lock held.
- */
-int uvc_free_buffers(struct uvc_video_queue *queue)
-{
-	unsigned int i;
-
-	for (i = 0; i < queue->count; ++i) {
-		if (queue->buffer[i].vma_use_count != 0)
-			return -EBUSY;
-	}
-
-	if (queue->count) {
-		vfree(queue->mem);
-		queue->count = 0;
-	}
-
-	return 0;
-}
-
 static void __uvc_query_buffer(struct uvc_buffer *buf,
 		struct v4l2_buffer *v4l2_buf)
 {
@@ -195,8 +197,8 @@ static void __uvc_query_buffer(struct uvc_buffer *buf,
 	}
 }
 
-int uvc_query_buffer(struct uvc_video_queue *queue,
-		struct v4l2_buffer *v4l2_buf)
+static int
+uvc_query_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *v4l2_buf)
 {
 	int ret = 0;
 
@@ -217,8 +219,8 @@ done:
  * Queue a video buffer. Attempting to queue a buffer that has already been
  * queued will return -EINVAL.
  */
-int uvc_queue_buffer(struct uvc_video_queue *queue,
-	struct v4l2_buffer *v4l2_buf)
+static int
+uvc_queue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *v4l2_buf)
 {
 	struct uvc_buffer *buf;
 	unsigned long flags;
@@ -298,8 +300,9 @@ static int uvc_queue_waiton(struct uvc_buffer *buf, int nonblocking)
  * Dequeue a video buffer. If nonblocking is false, block until a buffer is
  * available.
  */
-int uvc_dequeue_buffer(struct uvc_video_queue *queue,
-		struct v4l2_buffer *v4l2_buf, int nonblocking)
+static int
+uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *v4l2_buf,
+		   int nonblocking)
 {
 	struct uvc_buffer *buf;
 	int ret = 0;
@@ -359,8 +362,9 @@ done:
  * This function implements video queue polling and is intended to be used by
  * the device poll handler.
  */
-unsigned int uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
-		poll_table *wait)
+static unsigned int
+uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
+	       poll_table *wait)
 {
 	struct uvc_buffer *buf;
 	unsigned int mask = 0;
@@ -407,7 +411,8 @@ static struct vm_operations_struct uvc_vm_ops = {
  * This function implements video buffer memory mapping and is intended to be
  * used by the device mmap handler.
  */
-int uvc_queue_mmap(struct uvc_video_queue *queue, struct vm_area_struct *vma)
+static int
+uvc_queue_mmap(struct uvc_video_queue *queue, struct vm_area_struct *vma)
 {
 	struct uvc_buffer *uninitialized_var(buffer);
 	struct page *page;
@@ -458,6 +463,42 @@ done:
 }
 
 /*
+ * Cancel the video buffers queue.
+ *
+ * Cancelling the queue marks all buffers on the irq queue as erroneous,
+ * wakes them up and removes them from the queue.
+ *
+ * If the disconnect parameter is set, further calls to uvc_queue_buffer will
+ * fail with -ENODEV.
+ *
+ * This function acquires the irq spinlock and can be called from interrupt
+ * context.
+ */
+static void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
+{
+	struct uvc_buffer *buf;
+	unsigned long flags;
+
+	spin_lock_irqsave(&queue->irqlock, flags);
+	while (!list_empty(&queue->irqqueue)) {
+		buf = list_first_entry(&queue->irqqueue, struct uvc_buffer,
+				       queue);
+		list_del(&buf->queue);
+		buf->state = UVC_BUF_STATE_ERROR;
+		wake_up(&buf->wait);
+	}
+	/* This must be protected by the irqlock spinlock to avoid race
+	 * conditions between uvc_queue_buffer and the disconnection event that
+	 * could result in an interruptible wait in uvc_dequeue_buffer. Do not
+	 * blindly replace this logic by checking for the UVC_DEV_DISCONNECTED
+	 * state outside the queue code.
+	 */
+	if (disconnect)
+		queue->flags |= UVC_QUEUE_DISCONNECTED;
+	spin_unlock_irqrestore(&queue->irqlock, flags);
+}
+
+/*
  * Enable or disable the video buffers queue.
  *
  * The queue must be enabled before starting video acquisition and must be
@@ -474,7 +515,7 @@ done:
  * This function can't be called from interrupt context. Use
  * uvc_queue_cancel() instead.
  */
-int uvc_queue_enable(struct uvc_video_queue *queue, int enable)
+static int uvc_queue_enable(struct uvc_video_queue *queue, int enable)
 {
 	unsigned int i;
 	int ret = 0;
@@ -503,44 +544,8 @@ done:
 	return ret;
 }
 
-/*
- * Cancel the video buffers queue.
- *
- * Cancelling the queue marks all buffers on the irq queue as erroneous,
- * wakes them up and removes them from the queue.
- *
- * If the disconnect parameter is set, further calls to uvc_queue_buffer will
- * fail with -ENODEV.
- *
- * This function acquires the irq spinlock and can be called from interrupt
- * context.
- */
-void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
-{
-	struct uvc_buffer *buf;
-	unsigned long flags;
-
-	spin_lock_irqsave(&queue->irqlock, flags);
-	while (!list_empty(&queue->irqqueue)) {
-		buf = list_first_entry(&queue->irqqueue, struct uvc_buffer,
-				       queue);
-		list_del(&buf->queue);
-		buf->state = UVC_BUF_STATE_ERROR;
-		wake_up(&buf->wait);
-	}
-	/* This must be protected by the irqlock spinlock to avoid race
-	 * conditions between uvc_queue_buffer and the disconnection event that
-	 * could result in an interruptible wait in uvc_dequeue_buffer. Do not
-	 * blindly replace this logic by checking for the UVC_DEV_DISCONNECTED
-	 * state outside the queue code.
-	 */
-	if (disconnect)
-		queue->flags |= UVC_QUEUE_DISCONNECTED;
-	spin_unlock_irqrestore(&queue->irqlock, flags);
-}
-
-struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
-		struct uvc_buffer *buf)
+static struct uvc_buffer *
+uvc_queue_next_buffer(struct uvc_video_queue *queue, struct uvc_buffer *buf)
 {
 	struct uvc_buffer *nextbuf;
 	unsigned long flags;
@@ -568,7 +573,7 @@ struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
 	return nextbuf;
 }
 
-struct uvc_buffer *uvc_queue_head(struct uvc_video_queue *queue)
+static struct uvc_buffer *uvc_queue_head(struct uvc_video_queue *queue)
 {
 	struct uvc_buffer *buf = NULL;
 
diff --git a/drivers/usb/gadget/uvc_queue.h b/drivers/usb/gadget/uvc_queue.h
index 7f5a33f..1812a8e 100644
--- a/drivers/usb/gadget/uvc_queue.h
+++ b/drivers/usb/gadget/uvc_queue.h
@@ -58,30 +58,10 @@ struct uvc_video_queue {
 	struct list_head irqqueue;
 };
 
-extern void uvc_queue_init(struct uvc_video_queue *queue,
-		enum v4l2_buf_type type);
-extern int uvc_alloc_buffers(struct uvc_video_queue *queue,
-		unsigned int nbuffers, unsigned int buflength);
-extern int uvc_free_buffers(struct uvc_video_queue *queue);
-extern int uvc_query_buffer(struct uvc_video_queue *queue,
-		struct v4l2_buffer *v4l2_buf);
-extern int uvc_queue_buffer(struct uvc_video_queue *queue,
-		struct v4l2_buffer *v4l2_buf);
-extern int uvc_dequeue_buffer(struct uvc_video_queue *queue,
-		struct v4l2_buffer *v4l2_buf, int nonblocking);
-extern int uvc_queue_enable(struct uvc_video_queue *queue, int enable);
-extern void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect);
-extern struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
-		struct uvc_buffer *buf);
-extern unsigned int uvc_queue_poll(struct uvc_video_queue *queue,
-		struct file *file, poll_table *wait);
-extern int uvc_queue_mmap(struct uvc_video_queue *queue,
-		struct vm_area_struct *vma);
 static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
 {
 	return queue->flags & UVC_QUEUE_STREAMING;
 }
-extern struct uvc_buffer *uvc_queue_head(struct uvc_video_queue *queue);
 
 #endif /* __KERNEL__ */
 
diff --git a/drivers/usb/gadget/uvc_v4l2.c b/drivers/usb/gadget/uvc_v4l2.c
index a7989f2..2dcffda 100644
--- a/drivers/usb/gadget/uvc_v4l2.c
+++ b/drivers/usb/gadget/uvc_v4l2.c
@@ -363,7 +363,7 @@ uvc_v4l2_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
-struct v4l2_file_operations uvc_v4l2_fops = {
+static struct v4l2_file_operations uvc_v4l2_fops = {
 	.owner		= THIS_MODULE,
 	.open		= uvc_v4l2_open,
 	.release	= uvc_v4l2_release,
diff --git a/drivers/usb/gadget/uvc_video.c b/drivers/usb/gadget/uvc_video.c
index de8cbc4..b08f354 100644
--- a/drivers/usb/gadget/uvc_video.c
+++ b/drivers/usb/gadget/uvc_video.c
@@ -271,7 +271,7 @@ error:
  * This function fills the available USB requests (listed in req_free) with
  * video data from the queued buffers.
  */
-int
+static int
 uvc_video_pump(struct uvc_video *video)
 {
 	struct usb_request *req;
@@ -328,7 +328,7 @@ uvc_video_pump(struct uvc_video *video)
 /*
  * Enable or disable the video stream.
  */
-int
+static int
 uvc_video_enable(struct uvc_video *video, int enable)
 {
 	unsigned int i;
@@ -367,7 +367,7 @@ uvc_video_enable(struct uvc_video *video, int enable)
 /*
  * Initialize the UVC video stream.
  */
-int
+static int
 uvc_video_init(struct uvc_video *video)
 {
 	INIT_LIST_HEAD(&video->req_free);
diff --git a/drivers/usb/gadget/webcam.c b/drivers/usb/gadget/webcam.c
index 417fd68..f5f3030 100644
--- a/drivers/usb/gadget/webcam.c
+++ b/drivers/usb/gadget/webcam.c
@@ -28,10 +28,10 @@
 #include "config.c"
 #include "epautoconf.c"
 
-#include "f_uvc.c"
 #include "uvc_queue.c"
-#include "uvc_v4l2.c"
 #include "uvc_video.c"
+#include "uvc_v4l2.c"
+#include "f_uvc.c"
 
 /* --------------------------------------------------------------------------
  * Device descriptor
-- 
1.7.1
