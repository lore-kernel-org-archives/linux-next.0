From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Date: Fri, 19 May 2017 12:04:15 +1000
Message-ID: <20170519120326.6fa226fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36093 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753889AbdESCES (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 May 2017 22:04:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pandiyan Dhinakaran <dhinakaran.pandiyan@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_dp_mst.c

between commit:

  f424f55e3177 ("drm/i915: Track MST link bandwidth")

from the drm tree and commit:

  3d65a735d834 ("drm/i915/mst: use max link not sink lane count")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/intel_dp_mst.c
index 1dee9933005f,5af22a7c11bf..000000000000
--- a/drivers/gpu/drm/i915/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/intel_dp_mst.c
@@@ -56,7 -56,8 +56,7 @@@ static bool intel_dp_mst_compute_config
  	 * for MST we always configure max link bw - the spec doesn't
  	 * seem to suggest we should do otherwise.
  	 */
- 	lane_count = drm_dp_max_lane_count(intel_dp->dpcd);
+ 	lane_count = intel_dp_max_lane_count(intel_dp);
 -
  	pipe_config->lane_count = lane_count;
  
  	pipe_config->pipe_bpp = bpp;
