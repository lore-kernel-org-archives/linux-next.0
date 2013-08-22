From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: Tree for Aug 21 [ screen corruption in graphical
 mode ]
Date: Thu, 22 Aug 2013 09:24:17 +0200
Message-ID: <20130822072417.GM26909@phenom.ffwll.local>
References: <CA+icZUUkS-UptLRM1CfcaHH=8UD-ZaHbXr8wFkA+YKyk-rPjvg@mail.gmail.com>
 <20130821134441.GE26909@phenom.ffwll.local>
 <CA+icZUVLau7AgZvcnWKjx=tc4WeuJ3qEH7qQta+YLKDmxk6QvA@mail.gmail.com>
 <20130821212012.GH26909@phenom.ffwll.local>
 <CA+icZUUoZ3WRNChLJ8vfP_MxJhTu2annkWCmB8jnqOxNKSEtOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUUoZ3WRNChLJ8vfP_MxJhTu2annkWCmB8jnqOxNKSEtOg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 22, 2013 at 08:32:47AM +0200, Sedat Dilek wrote:
> It's independent of the applied patch.
> My problem goes away with SNA but still exists with UXA.
> 
> As said in my previous analysis... switching back to Ubuntu's graphics
> did not show the symptoms, too.
> 
> It's interesting to see, it is a problem of the intel-ddx.

Nope, it's just that uxa and sna have completely different buffer object
usage patterns. Not the first time only one of them hits an issue ...

> Anyway, SNA seems here to be approx. 20% faster in gtkperf-0.40, so I
> will use it.
> 
> I am open and willing to test any patches you will provide.
> Please, let me know.

Found a new bugger, please test the below patch.

Thanks, Daniel
---
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index ef92c69..e0bff07 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -2616,6 +2616,9 @@ int i915_vma_unbind(struct i915_vma *vma)
 	drm_i915_private_t *dev_priv = obj->base.dev->dev_private;
 	int ret;
 
+	/* For now we only ever use 1 vma per object */
+	WARN_ON(!list_is_singular(&obj->vma_list));
+
 	if (list_empty(&vma->vma_link))
 		return 0;
 
@@ -2661,7 +2664,9 @@ int i915_vma_unbind(struct i915_vma *vma)
 	drm_mm_remove_node(&vma->node);
 
 destroy:
-	i915_gem_vma_destroy(vma);
+	/* Keep the vma as a placeholder in the execbuffer reservation lists */
+	if (!list_empty(&vma->exec_list))
+		i915_gem_vma_destroy(vma);
 
 	/* Since the unbound list is global, only move to that list if
 	 * no more VMAs exist.
@@ -4171,10 +4176,6 @@ void i915_gem_vma_destroy(struct i915_vma *vma)
 	WARN_ON(vma->node.allocated);
 	list_del(&vma->vma_link);
 
-	/* Keep the vma as a placeholder in the execbuffer reservation lists */
-	if (!list_empty(&vma->exec_list))
-		return;
-
 	kfree(vma);
 }
 
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
