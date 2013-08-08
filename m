From: David Herrmann <dh.herrmann@gmail.com>
Subject: [PATCH v2] drm: provide agp dummies for CONFIG_AGP=n
Date: Thu,  8 Aug 2013 22:19:12 +0200
Message-ID: <1375993152-2143-1-git-send-email-dh.herrmann@gmail.com>
References: <1375883595-10847-1-git-send-email-dh.herrmann@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:54255 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966325Ab3HHUTz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2013 16:19:55 -0400
Received: by mail-ee0-f51.google.com with SMTP id c1so1735521eek.24
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2013 13:19:54 -0700 (PDT)
In-Reply-To: <1375883595-10847-1-git-send-email-dh.herrmann@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, linux-next@vger.kernel.org, David Herrmann <dh.herrmann@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Warren <swarren@wwwdotorg.org>

We currently rely on gcc dead-code elimination so the drm_agp_* helpers
are not called if drm_core_has_AGP() is false. That's ugly as hell so
provide "static inline" dummies for the case that AGP is disabled.

Fixes a build-regression introduced by:

  commit 28ec711cd427f8b61f73712a43b8100ba8ca933b
  Author: David Herrmann <dh.herrmann@gmail.com>
  Date:   Sat Jul 27 16:37:00 2013 +0200

      drm/agp: move AGP cleanup paths to drm_agpsupport.c

v2: switch #ifdef -> #if (spotted by Stephen)

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Signed-off-by: David Herrmann <dh.herrmann@gmail.com>
---
 include/drm/drmP.h           |  49 +----------
 include/drm/drm_agpsupport.h | 194 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+), 47 deletions(-)
 create mode 100644 include/drm/drm_agpsupport.h

diff --git a/include/drm/drmP.h b/include/drm/drmP.h
index fba5473..3ecdde6 100644
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@ -62,10 +62,8 @@
 #endif
 #include <asm/mman.h>
 #include <asm/uaccess.h>
-#if defined(CONFIG_AGP) || defined(CONFIG_AGP_MODULE)
 #include <linux/types.h>
 #include <linux/agp_backend.h>
-#endif
 #include <linux/workqueue.h>
 #include <linux/poll.h>
 #include <asm/pgalloc.h>
@@ -1226,16 +1224,6 @@ static inline int drm_dev_to_irq(struct drm_device *dev)
 	return dev->driver->bus->get_irq(dev);
 }
 
-
-#if __OS_HAS_AGP
-static inline int drm_core_has_AGP(struct drm_device *dev)
-{
-	return drm_core_check_feature(dev, DRIVER_USE_AGP);
-}
-#else
-#define drm_core_has_AGP(dev) (0)
-#endif
-
 #if __OS_HAS_MTRR
 static inline int drm_core_has_MTRR(struct drm_device *dev)
 {
@@ -1292,14 +1280,6 @@ extern unsigned int drm_poll(struct file *filp, struct poll_table_struct *wait);
 
 				/* Memory management support (drm_memory.h) */
 #include <drm/drm_memory.h>
-extern void drm_free_agp(DRM_AGP_MEM * handle, int pages);
-extern int drm_bind_agp(DRM_AGP_MEM * handle, unsigned int start);
-extern DRM_AGP_MEM *drm_agp_bind_pages(struct drm_device *dev,
-				       struct page **pages,
-				       unsigned long num_pages,
-				       uint32_t gtt_offset,
-				       uint32_t type);
-extern int drm_unbind_agp(DRM_AGP_MEM * handle);
 
 				/* Misc. IOCTL support (drm_ioctl.h) */
 extern int drm_irq_by_busid(struct drm_device *dev, void *data,
@@ -1453,33 +1433,8 @@ extern int drm_modeset_ctl(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv);
 
 				/* AGP/GART support (drm_agpsupport.h) */
-extern struct drm_agp_head *drm_agp_init(struct drm_device *dev);
-extern void drm_agp_destroy(struct drm_agp_head *agp);
-extern void drm_agp_clear(struct drm_device *dev);
-extern int drm_agp_acquire(struct drm_device *dev);
-extern int drm_agp_acquire_ioctl(struct drm_device *dev, void *data,
-				 struct drm_file *file_priv);
-extern int drm_agp_release(struct drm_device *dev);
-extern int drm_agp_release_ioctl(struct drm_device *dev, void *data,
-				 struct drm_file *file_priv);
-extern int drm_agp_enable(struct drm_device *dev, struct drm_agp_mode mode);
-extern int drm_agp_enable_ioctl(struct drm_device *dev, void *data,
-				struct drm_file *file_priv);
-extern int drm_agp_info(struct drm_device *dev, struct drm_agp_info *info);
-extern int drm_agp_info_ioctl(struct drm_device *dev, void *data,
-			struct drm_file *file_priv);
-extern int drm_agp_alloc(struct drm_device *dev, struct drm_agp_buffer *request);
-extern int drm_agp_alloc_ioctl(struct drm_device *dev, void *data,
-			 struct drm_file *file_priv);
-extern int drm_agp_free(struct drm_device *dev, struct drm_agp_buffer *request);
-extern int drm_agp_free_ioctl(struct drm_device *dev, void *data,
-			struct drm_file *file_priv);
-extern int drm_agp_unbind(struct drm_device *dev, struct drm_agp_binding *request);
-extern int drm_agp_unbind_ioctl(struct drm_device *dev, void *data,
-			  struct drm_file *file_priv);
-extern int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request);
-extern int drm_agp_bind_ioctl(struct drm_device *dev, void *data,
-			struct drm_file *file_priv);
+
+#include <drm/drm_agpsupport.h>
 
 				/* Stub support (drm_stub.h) */
 extern int drm_setmaster_ioctl(struct drm_device *dev, void *data,
diff --git a/include/drm/drm_agpsupport.h b/include/drm/drm_agpsupport.h
new file mode 100644
index 0000000..a184eee
--- /dev/null
+++ b/include/drm/drm_agpsupport.h
@@ -0,0 +1,194 @@
+#ifndef _DRM_AGPSUPPORT_H_
+#define _DRM_AGPSUPPORT_H_
+
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/agp_backend.h>
+#include <drm/drmP.h>
+
+#if __OS_HAS_AGP
+
+void drm_free_agp(DRM_AGP_MEM * handle, int pages);
+int drm_bind_agp(DRM_AGP_MEM * handle, unsigned int start);
+int drm_unbind_agp(DRM_AGP_MEM * handle);
+DRM_AGP_MEM *drm_agp_bind_pages(struct drm_device *dev,
+				struct page **pages,
+				unsigned long num_pages,
+				uint32_t gtt_offset,
+				uint32_t type);
+
+struct drm_agp_head *drm_agp_init(struct drm_device *dev);
+void drm_agp_destroy(struct drm_agp_head *agp);
+void drm_agp_clear(struct drm_device *dev);
+int drm_agp_acquire(struct drm_device *dev);
+int drm_agp_acquire_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv);
+int drm_agp_release(struct drm_device *dev);
+int drm_agp_release_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv);
+int drm_agp_enable(struct drm_device *dev, struct drm_agp_mode mode);
+int drm_agp_enable_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv);
+int drm_agp_info(struct drm_device *dev, struct drm_agp_info *info);
+int drm_agp_info_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv);
+int drm_agp_alloc(struct drm_device *dev, struct drm_agp_buffer *request);
+int drm_agp_alloc_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file_priv);
+int drm_agp_free(struct drm_device *dev, struct drm_agp_buffer *request);
+int drm_agp_free_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv);
+int drm_agp_unbind(struct drm_device *dev, struct drm_agp_binding *request);
+int drm_agp_unbind_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv);
+int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request);
+int drm_agp_bind_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv);
+
+static inline int drm_core_has_AGP(struct drm_device *dev)
+{
+	return drm_core_check_feature(dev, DRIVER_USE_AGP);
+}
+
+#else /* __OS_HAS_AGP */
+
+static inline void drm_free_agp(DRM_AGP_MEM * handle, int pages)
+{
+}
+
+static inline int drm_bind_agp(DRM_AGP_MEM * handle, unsigned int start)
+{
+	return -ENODEV;
+}
+
+static inline int drm_unbind_agp(DRM_AGP_MEM * handle)
+{
+	return -ENODEV;
+}
+
+static inline DRM_AGP_MEM *drm_agp_bind_pages(struct drm_device *dev,
+					      struct page **pages,
+					      unsigned long num_pages,
+					      uint32_t gtt_offset,
+					      uint32_t type)
+{
+	return NULL;
+}
+
+static inline struct drm_agp_head *drm_agp_init(struct drm_device *dev)
+{
+	return NULL;
+}
+
+static inline void drm_agp_destroy(struct drm_agp_head *agp)
+{
+}
+
+static inline void drm_agp_clear(struct drm_device *dev)
+{
+}
+
+static inline int drm_agp_acquire(struct drm_device *dev)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_acquire_ioctl(struct drm_device *dev, void *data,
+					struct drm_file *file_priv)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_release(struct drm_device *dev)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_release_ioctl(struct drm_device *dev, void *data,
+					struct drm_file *file_priv)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_enable(struct drm_device *dev,
+				 struct drm_agp_mode mode)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_enable_ioctl(struct drm_device *dev, void *data,
+				       struct drm_file *file_priv)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_info(struct drm_device *dev,
+			       struct drm_agp_info *info)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_info_ioctl(struct drm_device *dev, void *data,
+				     struct drm_file *file_priv)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_alloc(struct drm_device *dev,
+				struct drm_agp_buffer *request)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_alloc_ioctl(struct drm_device *dev, void *data,
+				      struct drm_file *file_priv)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_free(struct drm_device *dev,
+			       struct drm_agp_buffer *request)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_free_ioctl(struct drm_device *dev, void *data,
+				     struct drm_file *file_priv)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_unbind(struct drm_device *dev,
+				 struct drm_agp_binding *request)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_unbind_ioctl(struct drm_device *dev, void *data,
+				       struct drm_file *file_priv)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_bind(struct drm_device *dev,
+			       struct drm_agp_binding *request)
+{
+	return -ENODEV;
+}
+
+static inline int drm_agp_bind_ioctl(struct drm_device *dev, void *data,
+				     struct drm_file *file_priv)
+{
+	return -ENODEV;
+}
+
+static inline int drm_core_has_AGP(struct drm_device *dev)
+{
+	return 0;
+}
+
+#endif /* __OS_HAS_AGP */
+
+#endif /* _DRM_AGPSUPPORT_H_ */
-- 
1.8.3.4
