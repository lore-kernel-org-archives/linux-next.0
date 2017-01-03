From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Tue, 3 Jan 2017 13:14:28 +1100
Message-ID: <20170103131428.64737315@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59145 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933080AbdACCOb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Jan 2017 21:14:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_pm.c

between commit:

  e339d67eeb02 ("drm/i915: Pass crtc state to vlv_compute_wm_level()")

from the drm-intel tree and commit:

  353c85989963 ("drm: Replace drm_format_plane_cpp() with fb->format->cpp[]")

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
index 4b12637e2084,ce03d9d5aca6..000000000000
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@@ -991,13 -960,13 +991,13 @@@ static uint16_t vlv_compute_wm_level(co
  	if (dev_priv->wm.pri_latency[level] == 0)
  		return USHRT_MAX;
  
 -	if (!state->base.visible)
 +	if (!plane_state->base.visible)
  		return 0;
  
- 	cpp = drm_format_plane_cpp(plane_state->base.fb->pixel_format, 0);
 -	cpp = state->base.fb->format->cpp[0];
 -	clock = crtc->config->base.adjusted_mode.crtc_clock;
 -	htotal = crtc->config->base.adjusted_mode.crtc_htotal;
 -	width = crtc->config->pipe_src_w;
++	cpp = plane_state->base.fb->format->cpp[0];
 +	clock = adjusted_mode->crtc_clock;
 +	htotal = adjusted_mode->crtc_htotal;
 +	width = crtc_state->pipe_src_w;
  	if (WARN_ON(htotal == 0))
  		htotal = 1;
  
