From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Thu, 30 Jul 2015 13:04:44 +1000
Message-ID: <20150730130444.2ac0706c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43620 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750734AbbG3DEq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jul 2015 23:04:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/drm_crtc.c

between commit:

  5677d67ae394 ("drm: Stop resetting connector state to unknown")

from Linus' tree and commit:

  1c473be11958 ("drm: Fixup locking WARNINGs in drm_mode_config_reset")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/drm_crtc.c
index c91c18b2b1d4,7d02e32b4e94..000000000000
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@@ -5273,9 -5273,14 +5273,11 @@@ void drm_mode_config_reset(struct drm_d
  		if (encoder->funcs->reset)
  			encoder->funcs->reset(encoder);
  
+ 	mutex_lock(&dev->mode_config.mutex);
 -	drm_for_each_connector(connector, dev) {
 -		connector->status = connector_status_unknown;
 -
 +	drm_for_each_connector(connector, dev)
  		if (connector->funcs->reset)
  			connector->funcs->reset(connector);
 -	}
+ 	mutex_unlock(&dev->mode_config.mutex);
  }
  EXPORT_SYMBOL(drm_mode_config_reset);
  
