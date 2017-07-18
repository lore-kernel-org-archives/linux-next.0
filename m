From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 18 Jul 2017 11:38:53 +1000
Message-ID: <20170718113853.713ada48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48281 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751440AbdGRBi4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Jul 2017 21:38:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commit

  b6dcaaac4474 ("drm/vblank: _ioctl posfix for ioctl handler")

interacting with commit

  d5288c88c67c ("switch compat_drm_wait_vblank() to drm_ioctl_kernel()")

from Linus' tree.

You should consider rebasing your branch onto v4.13-rc1 (or merging
v4.13-rc1) so that these (unnecessary) conflicts don't keep happening
during development and the next merge window.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 18 Jul 2017 11:35:10 +1000
Subject: [PATCH] drm/vblank: fix for "switch compat_drm_wait_vblank() to
 drm_ioctl_kernel()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/drm_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index d1f202852028..f8e96e648acf 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -842,7 +842,7 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
 	req.request.type = req32.request.type;
 	req.request.sequence = req32.request.sequence;
 	req.request.signal = req32.request.signal;
-	err = drm_ioctl_kernel(file, drm_wait_vblank, &req, DRM_UNLOCKED);
+	err = drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, DRM_UNLOCKED);
 	if (err)
 		return err;
 
-- 
2.13.2

-- 
Cheers,
Stephen Rothwell
