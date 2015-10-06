From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Tue, 6 Oct 2015 12:09:34 +1100
Message-ID: <20151006120934.29093843@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52567 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751166AbbJFBJg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2015 21:09:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Dave,

After merging the drm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/drm_fb_helper.c: In function 'restore_fbdev_mode':
drivers/gpu/drm/drm_fb_helper.c:448:5: error: 'error' undeclared (first use in this function)
     error = true;
     ^

Caused by commit

  03f9abb28c3e ("drm: handle cursor_set2 in restore_fbdev_mode")

>From Linus' tree interacting with commit

  b7bdf0a87add ("drm/fb-helper: Use -errno return in restore_mode_unlocked")

from the drm tree.

I added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 6 Oct 2015 12:04:49 +1100
Subject: [PATCH] drm/fb-helper: merge fix for "Use -errno return in restore_mode_unlocked"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 97d1a4633c5c..bd6d4ab27512 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -445,7 +445,7 @@ static int restore_fbdev_mode(struct drm_fb_helper *fb_helper)
 		if (crtc->funcs->cursor_set2) {
 			ret = crtc->funcs->cursor_set2(crtc, NULL, 0, 0, 0, 0, 0);
 			if (ret)
-				error = true;
+				return ret;
 		} else if (crtc->funcs->cursor_set) {
 			ret = crtc->funcs->cursor_set(crtc, NULL, 0, 0, 0);
 			if (ret)
-- 
2.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
