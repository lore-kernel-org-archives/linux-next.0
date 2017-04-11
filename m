From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the v4l-dvb tree
Date: Tue, 11 Apr 2017 10:27:19 +1000
Message-ID: <20170411102719.17042877@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53793 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752187AbdDKA1V (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 20:27:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Shawn Guo <shawn.guo@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/exynos/exynos_hdmi.c

between commit:

  278c811c5d05 ("[media] exynos_hdmi: add CEC notifier support")

from the v4l-dvb tree and commit:

  64b0e1d6c6a1 ("drm: exynos: use vblank hooks in struct drm_crtc_funcs")

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

diff --cc drivers/gpu/drm/exynos/exynos_hdmi.c
index bc4c8d0a66f4,52438404c8c9..000000000000
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@@ -43,9 -43,6 +43,8 @@@
  
  #include <drm/exynos_drm.h>
  
 +#include <media/cec-notifier.h>
 +
- #include "exynos_drm_drv.h"
  #include "exynos_drm_crtc.h"
  
  #define HOTPLUG_DEBOUNCE_MS		1100
