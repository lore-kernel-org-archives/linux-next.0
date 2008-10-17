From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree
Date: Fri, 17 Oct 2008 16:56:27 +1100
Message-ID: <20081017165627.90d1008f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38100 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750991AbYJQF4g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 01:56:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Eric Anholt <eric@anholt.net>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/i915/i915_dma.c between commit
80a914dc05683ecfc98f9e1887fd6564846ffbec ("misc: replace __FUNCTION__
with __func__") from Linus' tree and commit
811c552c21f3d7fca8eb647ccf0d303378ccea7d ("i915: Use struct_mutex to
protect ring in GEM mode") from the drm tree.

Just context changes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/gpu/drm/i915/i915_dma.c
index 9ac4720,593286e..0000000
--- a/drivers/gpu/drm/i915/i915_dma.c
+++ b/drivers/gpu/drm/i915/i915_dma.c
@@@ -516,8 -536,11 +536,11 @@@ static int i915_dispatch_flip(struct dr
  	drm_i915_private_t *dev_priv = dev->dev_private;
  	RING_LOCALS;
  
+ 	if (!dev_priv->sarea_priv)
+ 		return -EINVAL;
+ 
  	DRM_DEBUG("%s: page=%d pfCurrentPage=%d\n",
 -		  __FUNCTION__,
 +		  __func__,
  		  dev_priv->current_page,
  		  dev_priv->sarea_priv->pf_current_page);
  
@@@ -642,11 -677,17 +677,17 @@@ static int i915_cmdbuffer(struct drm_de
  static int i915_flip_bufs(struct drm_device *dev, void *data,
  			  struct drm_file *file_priv)
  {
+ 	int ret;
+ 
 -	DRM_DEBUG("%s\n", __FUNCTION__);
 +	DRM_DEBUG("%s\n", __func__);
  
- 	LOCK_TEST_WITH_RETURN(dev, file_priv);
+ 	RING_LOCK_TEST_WITH_RETURN(dev, file_priv);
+ 
+ 	mutex_lock(&dev->struct_mutex);
+ 	ret = i915_dispatch_flip(dev);
+ 	mutex_unlock(&dev->struct_mutex);
  
- 	return i915_dispatch_flip(dev);
+ 	return ret;
  }
  
  static int i915_getparam(struct drm_device *dev, void *data,
