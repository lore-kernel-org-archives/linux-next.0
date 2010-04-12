From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 12 Apr 2010 15:06:51 +1000
Message-ID: <20100412150651.4dd8d6d7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53571 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750983Ab0DLFG4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Apr 2010 01:06:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/nouveau/nouveau_drv.h between commit
952eb63543552deb1bf1113739d59d29172d7755 ("drm/nouveau: remove some
unused members from drm_nouveau_private") from Linus' tree and commit
386516744ba45d50f42c6999151cc210cb4f96e4 ("drm/fb: fix fbdev object model
+ cleanup properly") from the drm tree.

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/nouveau/nouveau_drv.h
index ace630a,941339c..0000000
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@@ -533,8 -531,7 +533,6 @@@ struct drm_nouveau_private 
  		atomic_t validate_sequence;
  	} ttm;
  
- 	struct fb_info *fbdev_info;
- 
 -	int fifo_alloc_count;
  	struct nouveau_channel *fifos[NOUVEAU_MAX_CHANNEL_NR];
  
  	struct nouveau_engine engine;
