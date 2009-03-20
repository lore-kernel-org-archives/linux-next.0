From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] Staging: psb: fix build problem
Date: Fri, 20 Mar 2009 14:35:22 +0300
Message-ID: <20090320113522.GA26267@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.229]:11858 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751736AbZCTLfj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2009 07:35:39 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

drivers/staging/psb/psb_drv.c:1372: error: 'struct drm_minor' has no member named 'dev_root'
drivers/staging/psb/psb_drv.c:1374: error: 'struct drm_minor' has no member named 'dev_root'
drivers/staging/psb/psb_drv.c:1394: error: unknown field 'dri_library_name' specified in initializ
drivers/staging/psb/ttm/ttm_pat_compat.h:40: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'pgprot_ttm_x86_wc'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/staging/psb/psb_drv.c            |   14 ++++----------
 drivers/staging/psb/ttm/ttm_pat_compat.h |    1 +
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/psb/psb_drv.c b/drivers/staging/psb/psb_drv.c
index de16037..cf7997a 100644
--- a/drivers/staging/psb/psb_drv.c
+++ b/drivers/staging/psb/psb_drv.c
@@ -237,11 +237,6 @@ static void get_ci_info(struct drm_psb_private *dev_priv)
 	return;
 }
 
-static int dri_library_name(struct drm_device *dev, char *buf)
-{
-	return snprintf(buf, PAGE_SIZE, "psb\n");
-}
-
 static void psb_set_uopt(struct drm_psb_uopt *uopt)
 {
 	uopt->clock_gating = drm_psb_clock_gating;
@@ -1369,9 +1364,9 @@ static int psb_ospm_read(char *buf, char **start, off_t offset, int request,
 static int psb_proc_init(struct drm_minor *minor)
 {
 	struct proc_dir_entry *ent;
-	if (!minor->dev_root)
+	if (!minor->proc_root)
 		return 0;
-	ent = create_proc_read_entry(OSPM_PROC_ENTRY, 0, minor->dev_root,
+	ent = create_proc_read_entry(OSPM_PROC_ENTRY, 0, minor->proc_root,
 			psb_ospm_read, minor);
 	if (ent)
 		return 0;
@@ -1381,9 +1376,9 @@ static int psb_proc_init(struct drm_minor *minor)
 
 static void psb_proc_cleanup(struct drm_minor *minor)
 {
-	if (!minor->dev_root)
+	if (!minor->proc_root)
 		return;
-	remove_proc_entry(OSPM_PROC_ENTRY, minor->dev_root);
+	remove_proc_entry(OSPM_PROC_ENTRY, minor->proc_root);
 	return;
 }
 
@@ -1391,7 +1386,6 @@ static struct drm_driver driver = {
 	.driver_features = DRIVER_HAVE_IRQ | DRIVER_IRQ_SHARED,
 	.load = psb_driver_load,
 	.unload = psb_driver_unload,
-	.dri_library_name = dri_library_name,
 	.get_reg_ofs = drm_core_get_reg_ofs,
 	.ioctls = psb_ioctls,
 	.device_is_agp = psb_driver_device_is_agp,
diff --git a/drivers/staging/psb/ttm/ttm_pat_compat.h b/drivers/staging/psb/ttm/ttm_pat_compat.h
index f9b0bf0..7715daf 100644
--- a/drivers/staging/psb/ttm/ttm_pat_compat.h
+++ b/drivers/staging/psb/ttm/ttm_pat_compat.h
@@ -33,6 +33,7 @@
 #ifndef _TTM_PAT_COMPAT_
 #define _TTM_PAT_COMPAT_
 #include <asm/page.h>
+#include <asm/pgtable_types.h>
 
 extern void ttm_pat_init(void);
 extern void ttm_pat_takedown(void);
