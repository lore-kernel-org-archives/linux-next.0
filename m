From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Mon, 3 Aug 2015 12:11:56 +1000
Message-ID: <20150803121156.5ebaf847@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38005 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751438AbbHCCL6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Aug 2015 22:11:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/drm_atomic_helper.c

between commit:

  27667f4744fc ("i915: temporary fix for DP MST docking station NULL pointer dereference")

from Linus' tree and commit:

  fc596660dd4e ("drm/atomic: add connectors_changed to separate it from mode_changed, v2")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/drm_atomic_helper.c
index 90065c226fe5,0b475fae067d..000000000000
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@@ -230,12 -230,10 +230,12 @@@ update_connector_routing(struct drm_ato
  	}
  
  	connector_state->best_encoder = new_encoder;
 -	idx = drm_crtc_index(connector_state->crtc);
 +	if (connector_state->crtc) {
 +		idx = drm_crtc_index(connector_state->crtc);
  
 -	crtc_state = state->crtc_states[idx];
 -	crtc_state->connectors_changed = true;
 +		crtc_state = state->crtc_states[idx];
- 		crtc_state->mode_changed = true;
++		crtc_state->connectors_changed = true;
 +	}
  
  	DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] using [ENCODER:%d:%s] on [CRTC:%d]\n",
  			 connector->base.id,
