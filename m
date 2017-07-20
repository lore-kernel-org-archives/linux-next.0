From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Thu, 20 Jul 2017 11:23:33 +1000
Message-ID: <20170720112333.010b9ac8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56455 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932205AbdGTBXf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Jul 2017 21:23:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.c

between commit:

  99c539bef538 ("drm/i915: unregister interfaces first in unload")

from the drm-intel tree and commit:

  baf54385af78 ("drm/i915: Drop drm_vblank_cleanup")

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

diff --cc drivers/gpu/drm/i915/i915_drv.c
index f406aec8a499,04d9bd84ee43..000000000000
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@@ -1386,8 -1367,8 +1384,6 @@@ void i915_driver_unload(struct drm_devi
  
  	intel_gvt_cleanup(dev_priv);
  
- 	drm_vblank_cleanup(dev);
 -	i915_driver_unregister(dev_priv);
--
  	intel_modeset_cleanup(dev);
  
  	/*
