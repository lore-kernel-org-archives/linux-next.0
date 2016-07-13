From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the v4l-dvb tree
Date: Wed, 13 Jul 2016 12:25:14 +1000
Message-ID: <20160713122514.5689c628@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44029 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750974AbcGMCZW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jul 2016 22:25:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/media/platform/omap/omap_voutdef.h

between commit:

  77430f0396af ("[media] omap_vout: use control framework")

from the v4l-dvb tree and commit:

  781a162244a2 ("[media] omap_vout: Switch to use the video/omapfb_dss.h header file")

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

diff --cc drivers/media/platform/omap/omap_voutdef.h
index 49de1475e473,94b5d65afb19..000000000000
--- a/drivers/media/platform/omap/omap_voutdef.h
+++ b/drivers/media/platform/omap/omap_voutdef.h
@@@ -11,8 -11,7 +11,8 @@@
  #ifndef OMAP_VOUTDEF_H
  #define OMAP_VOUTDEF_H
  
 +#include <media/v4l2-ctrls.h>
- #include <video/omapdss.h>
+ #include <video/omapfb_dss.h>
  #include <video/omapvrfb.h>
  
  #define YUYV_BPP        2
