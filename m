From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 31 Jul 2017 12:24:07 +1000
Message-ID: <20170731122407.264f6899@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57995 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751823AbdGaCYJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 30 Jul 2017 22:24:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/nouveau/nv50_display.c

between commit:

  4a5431af19bc ("drm/nouveau/kms/nv50: update vblank state in response to modeset actions")

from Linus' tree and commit:

  ca814b25538a ("drm/vblank: Consistent drm_crtc_ prefix")

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

diff --cc drivers/gpu/drm/nouveau/nv50_display.c
index 2bc0dc985214,747c99c1e474..000000000000
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@@ -4080,8 -4068,7 +4081,8 @@@ nv50_disp_atomic_commit_tail(struct drm
  		if (crtc->state->event) {
  			unsigned long flags;
  			/* Get correct count/ts if racing with vblank irq */
 -			drm_crtc_accurate_vblank_count(crtc);
 +			if (crtc->state->active)
- 				drm_accurate_vblank_count(crtc);
++				drm_crtc_accurate_vblank_count(crtc);
  			spin_lock_irqsave(&crtc->dev->event_lock, flags);
  			drm_crtc_send_vblank_event(crtc, crtc->state->event);
  			spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
