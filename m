From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Tue, 3 Jan 2017 12:50:57 +1100
Message-ID: <20170103125057.0853a849@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35881 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756301AbdACBu7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Jan 2017 20:50:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem_evict.c

between commit:

  49d73912cbfc ("drm/i915: Convert vm->dev backpointer to vm->i915")

from the drm-intel tree and commit:

  9a71e277888b ("drm: Extract struct drm_mm_scan from struct drm_mm")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_gem_evict.c
index 6457fd0c33a8,85ceff1b74b6..000000000000
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@@ -96,7 -99,8 +99,8 @@@ i915_gem_evict_something(struct i915_ad
  			 u64 start, u64 end,
  			 unsigned flags)
  {
 -	struct drm_i915_private *dev_priv = to_i915(vm->dev);
 +	struct drm_i915_private *dev_priv = vm->i915;
+ 	struct drm_mm_scan scan;
  	struct list_head eviction_list;
  	struct list_head *phases[] = {
  		&vm->inactive_list,
@@@ -104,9 -108,10 +108,10 @@@
  		NULL,
  	}, **phase;
  	struct i915_vma *vma, *next;
+ 	struct drm_mm_node *node;
  	int ret;
  
 -	lockdep_assert_held(&vm->dev->struct_mutex);
 +	lockdep_assert_held(&vm->i915->drm.struct_mutex);
  	trace_i915_gem_evict(vm, min_size, alignment, flags);
  
  	/*
@@@ -122,21 -127,12 +127,19 @@@
  	 * On each list, the oldest objects lie at the HEAD with the freshest
  	 * object on the TAIL.
  	 */
- 	if (start != 0 || end != vm->total) {
- 		drm_mm_init_scan_with_range(&vm->mm, min_size,
- 					    alignment, cache_level,
- 					    start, end);
- 	} else
- 		drm_mm_init_scan(&vm->mm, min_size, alignment, cache_level);
+ 	drm_mm_scan_init_with_range(&scan, &vm->mm,
+ 				    min_size, alignment, cache_level,
+ 				    start, end,
+ 				    flags & PIN_HIGH ? DRM_MM_CREATE_TOP : 0);
  
 -	if (flags & PIN_NONBLOCK)
 +	/* Retire before we search the active list. Although we have
 +	 * reasonable accuracy in our retirement lists, we may have
 +	 * a stray pin (preventing eviction) that can only be resolved by
 +	 * retiring.
 +	 */
 +	if (!(flags & PIN_NONBLOCK))
 +		i915_gem_retire_requests(dev_priv);
 +	else
  		phases[1] = NULL;
  
  search_again:
