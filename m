From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Date: Tue, 17 Jan 2017 11:59:21 +1100
Message-ID: <20170117115921.7d80d719@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750863AbdAQA70 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Jan 2017 19:59:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  include/drm/drm_atomic.h

between commit:

  7e9081c5aac7 ("drm/fence: fix memory overwrite when setting out_fence fd")

from the drm-misc-fixes tree and commit:

  bdc571464c49 ("drm/atomic: Clean up wait_for_vblanks, v2.")

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

diff --cc include/drm/drm_atomic.h
index 56814e8ae7ea,f96220ed4004..000000000000
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@@ -144,7 -144,8 +144,8 @@@ struct __drm_crtcs_state 
  	struct drm_crtc *ptr;
  	struct drm_crtc_state *state;
  	struct drm_crtc_commit *commit;
 -	s64 __user *out_fence_ptr;
 +	s32 __user *out_fence_ptr;
+ 	unsigned last_vblank_count;
  };
  
  struct __drm_connnectors_state {
