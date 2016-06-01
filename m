From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree with Linus' tree
Date: Wed, 1 Jun 2016 10:07:46 +1000
Message-ID: <20160601100746.7a731254@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Yao <mark.yao@rock-chips.com>
List-Id: linux-next.vger.kernel.org

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in:

  drivers/gpu/drm/rockchip/rockchip_drm_drv.c

between commit:

  2d90d477430d ("drm/rockchip: support non-iommu buffer path")

from Linus' tree and commit:

  ac09e446377a ("drm: convert DT component matching to component_match_add_release()")

from the arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index a409d1f703cb,8168810053b3..000000000000
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@@ -507,18 -502,9 +512,20 @@@ static int rockchip_drm_platform_probe(
  			continue;
  		}
  
 +		iommu = of_parse_phandle(port->parent, "iommus", 0);
 +		if (!iommu || !of_device_is_available(iommu->parent)) {
 +			dev_dbg(dev, "no iommu attached for %s, using non-iommu buffers\n",
 +				port->parent->full_name);
 +			/*
 +			 * if there is a crtc not support iommu, force set all
 +			 * crtc use non-iommu buffer.
 +			 */
 +			is_support_iommu = false;
 +		}
 +
- 		component_match_add(dev, &match, compare_of, port->parent);
+ 		of_node_get(port->parent);
+ 		component_match_add_release(dev, &match, release_of,
+ 					    compare_of, port->parent);
  		of_node_put(port);
  	}
  
