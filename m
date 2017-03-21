From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-tegra tree with the drm tree
Date: Tue, 21 Mar 2017 11:45:45 +1100
Message-ID: <20170321114545.39fdd45a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750836AbdCUArv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Mar 2017 20:47:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>

Hi all,

Today's linux-next merge of the drm-tegra tree got a conflict in:

  drivers/gpu/drm/tegra/drm.c

between commit:

  10437d9b475e ("drm: tegra: use vblank hooks in struct drm_crtc_funcs")

from the drm tree and commit:

  3f2ea8cee24f ("drm/tegra: Don't leak kernel pointer to userspace")

from the drm-tegra tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/tegra/drm.c
index dba4e090d3df,3f8bd7bd6532..000000000000
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@@ -804,6 -864,49 +864,15 @@@ static const struct file_operations teg
  	.llseek = noop_llseek,
  };
  
 -static u32 tegra_drm_get_vblank_counter(struct drm_device *drm,
 -					unsigned int pipe)
 -{
 -	struct drm_crtc *crtc = drm_crtc_from_index(drm, pipe);
 -	struct tegra_dc *dc = to_tegra_dc(crtc);
 -
 -	if (!crtc)
 -		return 0;
 -
 -	return tegra_dc_get_vblank_counter(dc);
 -}
 -
 -static int tegra_drm_enable_vblank(struct drm_device *drm, unsigned int pipe)
 -{
 -	struct drm_crtc *crtc = drm_crtc_from_index(drm, pipe);
 -	struct tegra_dc *dc = to_tegra_dc(crtc);
 -
 -	if (!crtc)
 -		return -ENODEV;
 -
 -	tegra_dc_enable_vblank(dc);
 -
 -	return 0;
 -}
 -
 -static void tegra_drm_disable_vblank(struct drm_device *drm, unsigned int pipe)
 -{
 -	struct drm_crtc *crtc = drm_crtc_from_index(drm, pipe);
 -	struct tegra_dc *dc = to_tegra_dc(crtc);
 -
 -	if (crtc)
 -		tegra_dc_disable_vblank(dc);
 -}
 -
+ static int tegra_drm_context_cleanup(int id, void *p, void *data)
+ {
+ 	struct tegra_drm_context *context = p;
+ 
+ 	tegra_drm_context_free(context);
+ 
+ 	return 0;
+ }
+ 
  static void tegra_drm_preclose(struct drm_device *drm, struct drm_file *file)
  {
  	struct tegra_drm_file *fpriv = file->driver_priv;
