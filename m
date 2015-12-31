From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Thu, 31 Dec 2015 13:40:11 +1100
Message-ID: <20151231134011.165b239b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42317 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752239AbbLaCkN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Dec 2015 21:40:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Yao <mark.yao@rock-chips.com>

Hi Dave,

After merging the drm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: "vop_component_ops" [drivers/gpu/drm/rockchip/rockchip_vop_reg.ko] undefined!

Caused by commit

  a67719d18229 ("drm/rockchip: vop: spilt register related into rockchip_reg_vop.c")

I have added the following fix patch for today (just because its
Christmas :-)):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 31 Dec 2015 13:35:27 +1100
Subject: [PATCH] drm/rockchip: vop: export vop_component_ops to modules

Fixes: a67719d18229 ("drm/rockchip: vop: spilt register related into rockchip_reg_vop.c")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index d83bf87ba71e..f5b3da2f92d7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1395,3 +1395,4 @@ const struct component_ops vop_component_ops = {
 	.bind = vop_bind,
 	.unbind = vop_unbind,
 };
+EXPORT_SYMBOL_GPL(vop_component_ops);
-- 
2.6.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
