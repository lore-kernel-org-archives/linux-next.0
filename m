From: Changli Gao <xiaosuo@gmail.com>
Subject: [PATCH] drm: build error when magic sysrq isn't enabled
Date: Wed, 31 Mar 2010 12:18:00 +0800
Message-ID: <4BB2CCF8.6020806@gmail.com>
Reply-To: xiaosuo@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:47057 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699Ab0CaESZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2010 00:18:25 -0400
Received: by gwaa18 with SMTP id a18so5162011gwa.19
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2010 21:18:24 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: xiaosuo <xiaosuo@gmail.com>

drm build error when magic sysrq isn't enabled

sysrq_drm_fb_helper_restore_op is only valid when magic sysrq is
enabled, but it is used whenever magic sysrq is enabled or not.

Signed-off-by: Changli Gao <xiaosuo@gmail.com>
----
drivers/gpu/drm/drm_fb_helper.c | 4 ++++
1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 85cdf05..0e5b4f6 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -913,7 +913,9 @@ int drm_fb_helper_single_fb_probe(struct drm_device *dev,
 		printk(KERN_INFO "registered panic notifier\n");
 		atomic_notifier_chain_register(&panic_notifier_list,
 					       &paniced);
+#ifdef CONFIG_MAGIC_SYSRQ
 		register_sysrq_key('v', &sysrq_drm_fb_helper_restore_op);
+#endif
 	}
 	list_add(&fb_helper->kernel_fb_list, &kernel_fb_helper_list);
 	return 0;
@@ -927,7 +929,9 @@ void drm_fb_helper_free(struct drm_fb_helper *helper)
 		printk(KERN_INFO "unregistered panic notifier\n");
 		atomic_notifier_chain_unregister(&panic_notifier_list,
 						 &paniced);
+#ifdef CONFIG_MAGIC_SYSRQ
 		unregister_sysrq_key('v', &sysrq_drm_fb_helper_restore_op);
+#endif
 	}
 	drm_fb_helper_crtc_free(helper);
 	fb_dealloc_cmap(&helper->fb->fbdev->cmap);
