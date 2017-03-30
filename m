From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Date: Thu, 30 Mar 2017 12:14:07 +1100
Message-ID: <20170330121407.14d9d1e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36743 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933103AbdC3BOK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Mar 2017 21:14:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>, Jani Nikula <jani.nikula@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/intel_ringbuffer.h

between commit:

  dd68f2ba0720 ("drm/i915/execlists: Wrap tail pointer after reset tweaking")

from the drm-intel-fixes tree and commit:

  73dec95e6ba3 ("drm/i915: Emit to ringbuffer directly")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/intel_ringbuffer.h
index 8cb2078c5bfc,847aea554464..000000000000
--- a/drivers/gpu/drm/i915/intel_ringbuffer.h
+++ b/drivers/gpu/drm/i915/intel_ringbuffer.h
@@@ -522,19 -525,14 +525,20 @@@ intel_ring_advance(struct drm_i915_gem_
  }
  
  static inline u32
 +intel_ring_wrap(const struct intel_ring *ring, u32 pos)
 +{
 +	return pos & (ring->size - 1);
 +}
 +
- static inline u32 intel_ring_offset(struct intel_ring *ring, void *addr)
++static inline u32
+ intel_ring_offset(struct drm_i915_gem_request *req, void *addr)
  {
  	/* Don't write ring->size (equivalent to 0) as that hangs some GPUs. */
- 	u32 offset = addr - ring->vaddr;
- 	return intel_ring_wrap(ring, offset);
+ 	u32 offset = addr - req->ring->vaddr;
+ 	GEM_BUG_ON(offset > req->ring->size);
 -	return offset & (req->ring->size - 1);
++	return intel_ring_wrap(req->ring, offset);
  }
  
- int __intel_ring_space(int head, int tail, int size);
  void intel_ring_update_space(struct intel_ring *ring);
  
  void intel_engine_init_global_seqno(struct intel_engine_cs *engine, u32 seqno);
