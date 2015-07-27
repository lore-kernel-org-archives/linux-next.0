From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 27 Jul 2015 11:14:47 +1000
Message-ID: <20150727111447.72daeeb3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_crtc.c

between commit:

  5677d67ae394 ("drm: Stop resetting connector state to unknown")

from Linus' tree and commit:

  6295d607ad34 ("drm: Add modeset object iterators")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/drm_crtc.c
index fed748311b92,1f0da41ae2a1..000000000000
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@@ -5398,9 -5273,12 +5273,9 @@@ void drm_mode_config_reset(struct drm_d
  		if (encoder->funcs->reset)
  			encoder->funcs->reset(encoder);
  
- 	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
 -	drm_for_each_connector(connector, dev) {
 -		connector->status = connector_status_unknown;
 -
++	drm_for_each_connector(connector, dev)
  		if (connector->funcs->reset)
  			connector->funcs->reset(connector);
 -	}
  }
  EXPORT_SYMBOL(drm_mode_config_reset);
  
