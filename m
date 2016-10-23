From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Mon, 24 Oct 2016 10:59:14 +1100
Message-ID: <20161024105914.7b5d88d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49569 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756813AbcJWX7R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Oct 2016 19:59:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_pm.c

between commit:

  1186fa85eb9b ("drm/i915/gen9: minimum scanlines for Y tile is not always 4")

from the drm-intel tree and commit:

  bd2ef25d921c ("drm: Add drm_rotation_90_or_270()")

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

diff --cc drivers/gpu/drm/i915/intel_pm.c
index ea01b406d776,1472400ddce3..000000000000
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@@ -3601,42 -3560,6 +3601,42 @@@ static int skl_compute_plane_wm(const s
  	cpp = drm_format_plane_cpp(fb->pixel_format, 0);
  	plane_pixel_rate = skl_adjusted_plane_pixel_rate(cstate, intel_pstate);
  
- 	if (intel_rotation_90_or_270(pstate->rotation)) {
++	if (drm_rotation_90_or_270(pstate->rotation)) {
 +		int cpp = (fb->pixel_format == DRM_FORMAT_NV12) ?
 +			drm_format_plane_cpp(fb->pixel_format, 1) :
 +			drm_format_plane_cpp(fb->pixel_format, 0);
 +
 +		switch (cpp) {
 +		case 1:
 +			y_min_scanlines = 16;
 +			break;
 +		case 2:
 +			y_min_scanlines = 8;
 +			break;
 +		case 4:
 +			y_min_scanlines = 4;
 +			break;
 +		default:
 +			MISSING_CASE(cpp);
 +			return -EINVAL;
 +		}
 +	} else {
 +		y_min_scanlines = 4;
 +	}
 +
 +	plane_bytes_per_line = width * cpp;
 +	if (fb->modifier[0] == I915_FORMAT_MOD_Y_TILED ||
 +	    fb->modifier[0] == I915_FORMAT_MOD_Yf_TILED) {
 +		plane_blocks_per_line =
 +		      DIV_ROUND_UP(plane_bytes_per_line * y_min_scanlines, 512);
 +		plane_blocks_per_line /= y_min_scanlines;
 +	} else if (fb->modifier[0] == DRM_FORMAT_MOD_NONE) {
 +		plane_blocks_per_line = DIV_ROUND_UP(plane_bytes_per_line, 512)
 +					+ 1;
 +	} else {
 +		plane_blocks_per_line = DIV_ROUND_UP(plane_bytes_per_line, 512);
 +	}
 +
  	method1 = skl_wm_method1(plane_pixel_rate, cpp, latency);
  	method2 = skl_wm_method2(plane_pixel_rate,
  				 cstate->base.adjusted_mode.crtc_htotal,
