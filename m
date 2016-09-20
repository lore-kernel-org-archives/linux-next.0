From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Tue, 20 Sep 2016 12:42:06 +1000
Message-ID: <20160920124206.67755097@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41903 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752974AbcITCmJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Sep 2016 22:42:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Liu Ying <gnuiyl@gmail.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/imx/ipuv3-crtc.c

between commit:

  a474478642d5 ("drm/imx: fix crtc vblank state regression")

from Linus' tree and commit:

  5f4df0c769a9 ("drm/imx: Use DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET flag")

from the drm tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/imx/ipuv3-crtc.c
index 462056e4b9e4,9df29f1cb16a..000000000000
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@@ -77,7 -77,8 +77,10 @@@ static void ipu_crtc_atomic_disable(str
  	}
  	spin_unlock_irq(&crtc->dev->event_lock);
  
 +	drm_crtc_vblank_off(crtc);
++
+ 	/* always disable planes on the CRTC */
+ 	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, true);
  }
  
  static void imx_drm_crtc_reset(struct drm_crtc *crtc)
