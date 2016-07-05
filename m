From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree (from the
 drm-intel tree)
Date: Tue, 5 Jul 2016 13:53:03 +1000
Message-ID: <20160705135303.6a1bc80a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47957 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753602AbcGEDxH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jul 2016 23:53:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/uapi/linux/stddef.h:1:0,
                 from include/linux/stddef.h:4,
                 from include/uapi/linux/posix_types.h:4,
                 from include/uapi/linux/types.h:13,
                 from include/linux/types.h:5,
                 from include/linux/sysrq.h:18,
                 from drivers/gpu/drm/i915/i915_irq.c:31:
drivers/gpu/drm/i915/i915_irq.c: In function 'i915_hangcheck_elapsed':
include/linux/compiler.h:542:50: error: incompatible types when initializing type 'const void * const' using type 'bool {aka _Bool}'
  __maybe_unused const void * const _________p2 = _________p1; \
                                                  ^
drivers/gpu/drm/i915/i915_irq.c:3098:7: note: in expansion of macro 'lockless_dereference'
  if (!lockless_dereference(dev_priv->gt.awake))
       ^

Caused by commit

  67d97da34917 ("drm/i915: Only start retire worker when idle")

from the drm-intel tree interacting with commit

  331b6d8c7afc ("locking/barriers: Validate lockless_dereference() is used on a pointer type")

from the tip tree.

>From include/linux/compiler.h:

  * lockless_dereference() - safely load a pointer for later dereference
  * @p: The pointer to load

It looks like lockless_dererence() has been used incorrectly
in the drm-intel tree commit since its argument must be a
pointer to be dererenced later. The same thing is done in
drivers/gpu/drm/i915/i915_gem.c as well.

I have applied the following hack patch for now, but this needs to be
fixed properly.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 5 Jul 2016 13:44:39 +1000
Subject: [PATCH] drm/i915: hack around bad use of lockless_dereference()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/i915_gem.c | 2 +-
 drivers/gpu/drm/i915/i915_irq.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index d3502c0603e5..1f91f187b2a8 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -3290,7 +3290,7 @@ i915_gem_retire_work_handler(struct work_struct *work)
 	 * We do not need to do this test under locking as in the worst-case
 	 * we queue the retire worker once too often.
 	 */
-	if (lockless_dereference(dev_priv->gt.awake))
+	if (/*lockless_dereference*/(dev_priv->gt.awake))
 		queue_delayed_work(dev_priv->wq,
 				   &dev_priv->gt.retire_work,
 				   round_jiffies_up_relative(HZ));
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index f6de8dd567a2..2c1926418691 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -3095,7 +3095,7 @@ static void i915_hangcheck_elapsed(struct work_struct *work)
 	if (!i915.enable_hangcheck)
 		return;
 
-	if (!lockless_dereference(dev_priv->gt.awake))
+	if (!/*lockless_dereference*/(dev_priv->gt.awake))
 		return;
 
 	/* As enabling the GPU requires fairly extensive mmio access,
-- 
2.8.1




-- 
Cheers,
Stephen Rothwell
