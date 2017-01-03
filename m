From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Tue, 3 Jan 2017 13:08:52 +1100
Message-ID: <20170103130852.149e7e46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34995 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757361AbdACCIz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Jan 2017 21:08:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_overlay.c

between commit:

  39ccc04e7435 ("drm/i915: Use primary plane->state for overlay ckey setup")

from the drm-intel tree and commits:

  1967b34d5afb ("drm/i915: Add local 'fb' variables")
  438b74a5497c ("drm: Nuke fb->pixel_format")

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

diff --cc drivers/gpu/drm/i915/intel_overlay.c
index c95362327ffb,568d194435fd..000000000000
--- a/drivers/gpu/drm/i915/intel_overlay.c
+++ b/drivers/gpu/drm/i915/intel_overlay.c
@@@ -722,10 -666,8 +722,10 @@@ static void update_colorkey(struct inte
  	if (overlay->color_key_enabled)
  		flags |= DST_KEY_ENABLE;
  
 -	switch (fb->format->format) {
 +	if (state->base.visible)
- 		format = state->base.fb->pixel_format;
++		format = state->base.fb->format->format;
 +
 +	switch (format) {
  	case DRM_FORMAT_C8:
  		key = 0;
  		flags |= CLK_RGB8I_MASK;
