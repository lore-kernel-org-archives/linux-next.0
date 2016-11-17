From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the drm tree
Date: Thu, 17 Nov 2016 13:59:08 +1100
Message-ID: <20161117135908.1537c1b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36121 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752375AbcKQC7K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Nov 2016 21:59:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem_shrinker.c

between commit:

  1233e2db199d ("drm/i915: Move object backing storage manipulation to its own locking")

from the drm tree and commit:

  3ab7c086d5ec ("locking/drm: Kill mutex trickery")
  c7faee2109f9 ("locking/drm: Fix i915_gem_shrinker_lock() locking")
  0f5225b024d4 ("locking/mutex, drm: Introduce mutex_trylock_recursive()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_gem_shrinker.c
index a6fc1bdc48af,c450076d2f9b..000000000000
--- a/drivers/gpu/drm/i915/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/i915_gem_shrinker.c
@@@ -35,33 -35,6 +35,24 @@@
  #include "i915_drv.h"
  #include "i915_trace.h"
  
- static bool mutex_is_locked_by(struct mutex *mutex, struct task_struct *task)
++static bool i915_gem_shrinker_lock(struct drm_device *dev, bool *unlock)
 +{
- 	if (!mutex_is_locked(mutex))
++	switch (mutex_trylock_recursive(&dev->struct_mutex)) {
++	case MUTEX_TRYLOCK_FAILED:
 +		return false;
 +
- #if defined(CONFIG_DEBUG_MUTEXES) || defined(CONFIG_MUTEX_SPIN_ON_OWNER)
- 	return mutex->owner == task;
- #else
- 	/* Since UP may be pre-empted, we cannot assume that we own the lock */
- 	return false;
- #endif
- }
- 
- static bool i915_gem_shrinker_lock(struct drm_device *dev, bool *unlock)
- {
- 	if (!mutex_trylock(&dev->struct_mutex)) {
- 		if (!mutex_is_locked_by(&dev->struct_mutex, current))
- 			return false;
++	case MUTEX_TRYLOCK_SUCCESS:
++		*unlock = true;
++		return true;
 +
++	case MUTEX_TRYLOCK_RECURSIVE:
 +		*unlock = false;
- 	} else {
- 		*unlock = true;
++		return true;
 +	}
 +
- 	return true;
++	BUG();
 +}
 +
  static bool any_vma_pinned(struct drm_i915_gem_object *obj)
  {
  	struct i915_vma *vma;
