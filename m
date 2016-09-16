From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-msm tree with Linus' tree
Date: Fri, 16 Sep 2016 10:48:22 +1000
Message-ID: <20160916104822.3168b510@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40316 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750717AbcIPAs0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Sep 2016 20:48:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Rob,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_gem_submit.c

between commit:

  d78d383ab354 ("drm/msm: protect against faults from copy_from_user() in submit ioctl")

from Linus' tree and commits:

  4cd0945901a6 ("drm/msm: submit support for out-fences")

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

diff --cc drivers/gpu/drm/msm/msm_gem_submit.c
index 880d6a9af7c8,3ac14cd1e5b9..000000000000
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@@ -394,8 -385,14 +402,16 @@@ int msm_ioctl_gem_submit(struct drm_dev
  	if (ret)
  		return ret;
  
 +	priv->struct_mutex_task = current;
 +
+ 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
+ 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
+ 		if (out_fence_fd < 0) {
+ 			ret = out_fence_fd;
+ 			goto out_unlock;
+ 		}
+ 	}
+ 
  	submit = submit_create(dev, gpu, args->nr_bos, args->nr_cmds);
  	if (!submit) {
  		ret = -ENOMEM;
@@@ -487,7 -529,8 +548,9 @@@ out
  	if (ret)
  		msm_gem_submit_free(submit);
  out_unlock:
+ 	if (ret && (out_fence_fd >= 0))
+ 		put_unused_fd(out_fence_fd);
 +	priv->struct_mutex_task = NULL;
  	mutex_unlock(&dev->struct_mutex);
  	return ret;
  }
