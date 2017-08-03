From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Date: Thu, 3 Aug 2017 13:03:01 +1000
Message-ID: <20170803130301.0ace5a56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57437 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751809AbdHCDDD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Aug 2017 23:03:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c

between commits:

  0b20a0f8c3cb ("drm: Add old state pointer to CRTC .enable() helper function")
  64581714b58b ("drm: Convert atomic drivers from CRTC .disable() to .atomic_disable()")

from the drm tree and commit:

  710e7a448783 ("drm/msm/mdp5: Don't use mode_set helper funcs for encoders and CRTCs")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
index 4322a502555a,aefe6d2cfa94..000000000000
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
@@@ -940,7 -954,8 +956,6 @@@ static const struct drm_crtc_funcs mdp5
  };
  
  static const struct drm_crtc_helper_funcs mdp5_crtc_helper_funcs = {
- 	.mode_set_nofb = mdp5_crtc_mode_set_nofb,
 -	.disable = mdp5_crtc_disable,
 -	.enable = mdp5_crtc_enable,
  	.atomic_check = mdp5_crtc_atomic_check,
  	.atomic_begin = mdp5_crtc_atomic_begin,
  	.atomic_flush = mdp5_crtc_atomic_flush,
