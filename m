From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 16 Aug 2017 14:47:03 +1000
Message-ID: <20170816144703.378d4f4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49963 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751089AbdHPErF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Aug 2017 00:47:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>, Jason Ekstrand <jason@jlekstrand.net>, Chris Wilson <chris@chris-wilson.co.uk>, Dave Airlie <airlied@linux.ie>

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/i915_gem_execbuffer.c: In function 'get_fence_array':
drivers/gpu/drm/i915/i915_gem_execbuffer.c:2163:20: error: 'GFP_TEMPORARY' undeclared (first use in this function)
     __GFP_NOWARN | GFP_TEMPORARY);
                    ^

Caused by commit

  4d6fc0a48c52 ("mm: treewide: remove GFP_TEMPORARY allocation flag")

interacting with commit

  cf6e7bac6357 ("drm/i915: Add support for drm syncobjs")

from the drm-intel tree.

I applied the following merge fix patch (and I suspect - given the
comments in the former commit message - that this could be applied to
the drm-intel tree right now without any problems):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 16 Aug 2017 14:41:24 +1000
Subject: [PATCH] drm/i915: fix up for mm: treewide: remove GFP_TEMPORARY allocation flag

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/i915_gem_execbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
index 8fbdefe0216e..15ab3e6792f9 100644
--- a/drivers/gpu/drm/i915/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
@@ -2160,7 +2160,7 @@ get_fence_array(struct drm_i915_gem_execbuffer2 *args,
 		return ERR_PTR(-EFAULT);
 
 	fences = kvmalloc_array(args->num_cliprects, sizeof(*fences),
-				__GFP_NOWARN | GFP_TEMPORARY);
+				__GFP_NOWARN | GFP_KERNEL);
 	if (!fences)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.13.2

-- 
Cheers,
Stephen Rothwell
