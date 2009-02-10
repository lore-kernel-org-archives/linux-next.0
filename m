From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Tue, 10 Feb 2009 17:22:08 +1100
Message-ID: <20090210172208.84d8b7dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54092 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751221AbZBJGWQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Feb 2009 01:22:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/drm_memory.c between commit
9b8d5a124f133fe9a75397d20b874844a2e3d7e9 ("drm/radeon: fix ioremap
conflict with AGP mappings") from Linus' tree and commit
b16d90f80a3707fff2d13627076362272a466849 ("drm: Split drm_map and
drm_local_map") from the drm tree.

Just a context change.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/gpu/drm/drm_memory.c
index bcc869b,1132d16..0000000
--- a/drivers/gpu/drm/drm_memory.c
+++ b/drivers/gpu/drm/drm_memory.c
@@@ -169,17 -169,12 +169,17 @@@ void drm_core_ioremap(struct drm_local_
  }
  EXPORT_SYMBOL(drm_core_ioremap);
  
- void drm_core_ioremap_wc(struct drm_map *map, struct drm_device *dev)
+ void drm_core_ioremap_wc(struct drm_local_map *map, struct drm_device *dev)
  {
 -	map->handle = ioremap_wc(map->offset, map->size);
 +	if (drm_core_has_AGP(dev) &&
 +	    dev->agp && dev->agp->cant_use_aperture && map->type == _DRM_AGP)
 +		map->handle = agp_remap(map->offset, map->size, dev);
 +	else
 +		map->handle = ioremap_wc(map->offset, map->size);
  }
  EXPORT_SYMBOL(drm_core_ioremap_wc);
 +
- void drm_core_ioremapfree(struct drm_map *map, struct drm_device *dev)
+ void drm_core_ioremapfree(struct drm_local_map *map, struct drm_device *dev)
  {
  	if (!map->handle || !map->size)
  		return;
