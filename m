From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the drm-intel tree
Date: Tue, 8 Nov 2016 15:25:41 +1100
Message-ID: <20161108152541.096711bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
List-Id: linux-next.vger.kernel.org

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem_shrinker.c

between commits:

  1233e2db199d ("drm/i915: Move object backing storage manipulation to its own locking")

from the drm-intel tree and commit:

  3ab7c086d5ec ("locking/drm: Kill mutex trickery")
  c7faee2109f9 ("locking/drm: Fix i915_gem_shrinker_lock() locking")

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
index a6fc1bdc48af,e9bd2a81d03a..000000000000
--- a/drivers/gpu/drm/i915/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/i915_gem_shrinker.c
@@@ -35,33 -35,6 +35,15 @@@
  #include "i915_drv.h"
  #include "i915_trace.h"
  
- static bool mutex_is_locked_by(struct mutex *mutex, struct task_struct *task)
- {
- 	if (!mutex_is_locked(mutex))
- 		return false;
- 
- #if defined(CONFIG_DEBUG_MUTEXES) || defined(CONFIG_MUTEX_SPIN_ON_OWNER)
- 	return mutex->owner == task;
- #else
- 	/* Since UP may be pre-empted, we cannot assume that we own the lock */
- 	return false;
- #endif
- }
- 
 +static bool i915_gem_shrinker_lock(struct drm_device *dev, bool *unlock)
 +{
- 	if (!mutex_trylock(&dev->struct_mutex)) {
- 		if (!mutex_is_locked_by(&dev->struct_mutex, current))
- 			return false;
- 
- 		*unlock = false;
- 	} else {
- 		*unlock = true;
- 	}
++	if (!mutex_trylock(&dev->struct_mutex))
++		return false;
 +
++	*unlock = true;
 +	return true;
 +}
 +
  static bool any_vma_pinned(struct drm_i915_gem_object *obj)
  {
  	struct i915_vma *vma;
