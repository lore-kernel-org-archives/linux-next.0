From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Tue, 3 Jan 2017 12:59:02 +1100
Message-ID: <20170103125902.70f59c53@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49967 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757340AbdACB7G (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Jan 2017 20:59:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/i915_vma.c

between commit:

  7d1d9aea3ee0 ("drm/i915: Tidy i915_gem_valid_gtt_space()")

from the drm-intel tree and commit:

  3f85fb3462dc ("drm: Wrap drm_mm_node.hole_follows")

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

diff --cc drivers/gpu/drm/i915/i915_vma.c
index e008e4e8b481,325b917c5ad7..000000000000
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@@ -327,16 -313,18 +327,16 @@@ bool i915_gem_valid_gtt_space(struct i9
  	if (vma->vm->mm.color_adjust == NULL)
  		return true;
  
 -	if (!drm_mm_node_allocated(gtt_space))
 -		return true;
 -
 -	if (list_empty(&gtt_space->node_list))
 -		return true;
 +	/* Only valid to be called on an already inserted vma */
 +	GEM_BUG_ON(!drm_mm_node_allocated(node));
 +	GEM_BUG_ON(list_empty(&node->node_list));
  
 -	other = list_entry(gtt_space->node_list.prev, struct drm_mm_node, node_list);
 -	if (other->allocated && !drm_mm_hole_follows(other) && other->color != cache_level)
 +	other = list_prev_entry(node, node_list);
- 	if (color_differs(other, cache_level) && !other->hole_follows)
++	if (color_differs(other, cache_level) && !drm_mm_hole_follows(other))
  		return false;
  
 -	other = list_entry(gtt_space->node_list.next, struct drm_mm_node, node_list);
 -	if (other->allocated && !drm_mm_hole_follows(gtt_space) && other->color != cache_level)
 +	other = list_next_entry(node, node_list);
- 	if (color_differs(other, cache_level) && !node->hole_follows)
++	if (color_differs(other, cache_level) && !drm_mm_hole_follows(node))
  		return false;
  
  	return true;
