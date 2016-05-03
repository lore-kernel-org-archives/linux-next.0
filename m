From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-msm tree with the drm-misc tree
Date: Tue, 3 May 2016 13:28:45 +1000
Message-ID: <20160503132845.106166c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39918 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932223AbcECD2r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2016 23:28:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Hi Rob,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_atomic.c

between commit:

  a3ccfb9feb46 ("drm/msm: Rename async to nonblock.")

from the drm-misc tree and commit:

  afadc4bb9380 ("drm/msm: remove fence_cbs")

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

diff --cc drivers/gpu/drm/msm/msm_atomic.c
index 5c6130969f4d,2b4142a05024..000000000000
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@@ -199,11 -190,11 +189,11 @@@ int msm_atomic_check(struct drm_device 
   * Zero for success or -errno.
   */
  int msm_atomic_commit(struct drm_device *dev,
 -		struct drm_atomic_state *state, bool async)
 +		struct drm_atomic_state *state, bool nonblock)
  {
+ 	struct msm_drm_private *priv = dev->dev_private;
  	int nplanes = dev->mode_config.num_total_plane;
  	int ncrtcs = dev->mode_config.num_crtc;
- 	ktime_t timeout;
  	struct msm_commit *c;
  	int i, ret;
  
@@@ -275,8 -270,8 +269,8 @@@
  	 * current layout.
  	 */
  
 -	if (async) {
 +	if (nonblock) {
- 		msm_queue_fence_cb(dev, &c->fence_cb, c->fence);
+ 		queue_work(priv->atomic_wq, &c->work);
  		return 0;
  	}
  
