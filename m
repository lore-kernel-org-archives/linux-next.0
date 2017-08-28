From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 28 Aug 2017 12:32:38 +1000
Message-ID: <20170828123238.410885a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39997 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751799AbdH1Cck (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Aug 2017 22:32:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/imx/ipuv3-plane.c

between commit:

  5be5dd38d462 ("drm/imx: ipuv3-plane: fix YUV framebuffer scanout on the base plane")

from Linus' tree and commit:

  58dff39904c0 ("drm/imx: ipuv3-plane: use fb local variable instead of state->fb")

from the drm tree.

I fixed it up (the former included the latter change) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
