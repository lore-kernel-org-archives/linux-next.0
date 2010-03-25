From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH 1/3 -next] drm: fix build error when SYSRQ is disabled
Date: Thu, 25 Mar 2010 11:29:05 -0700
Message-ID: <4BABAB71.3010402@oracle.com>
References: <20100325173853.f06a7b33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100325173853.f06a7b33.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build error when CONFIG_MAGIC_SYSRQ is not enabled:

drivers/gpu/drm/drm_fb_helper.c:915: error: 'sysrq_drm_fb_helper_restore_op' undeclared (first use in this function)
drivers/gpu/drm/drm_fb_helper.c:929: error: 'sysrq_drm_fb_helper_restore_op' undeclared (first use in this function)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: David Airlie <airlied@linux.ie>
---
 drivers/gpu/drm/drm_fb_helper.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20100325.orig/drivers/gpu/drm/drm_fb_helper.c
+++ linux-next-20100325/drivers/gpu/drm/drm_fb_helper.c
@@ -283,6 +283,8 @@ static struct sysrq_key_op sysrq_drm_fb_
 	.help_msg = "force-fb(V)",
 	.action_msg = "Restore framebuffer console",
 };
+#else
+static struct sysrq_key_op sysrq_drm_fb_helper_restore_op = { };
 #endif
 
 static void drm_fb_helper_on(struct fb_info *info)
