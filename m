From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-panel tree with the tegra tree
Date: Mon, 17 Aug 2015 13:28:29 +1000
Message-ID: <20150817132829.0263f45d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42760 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750848AbbHQD2a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Aug 2015 23:28:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Thierry,

Today's linux-next merge of the drm-panel tree got a conflict in:

  arch/arm/configs/multi_v7_defconfig

between commit:

  258d9bc5e77f ("ARM: tegra: Update multi_v7_defconfig")

from the tegra tree and commit:

  330b48bd700d ("drm/bridge: Add vendor prefixes")

from the drm-panel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/configs/multi_v7_defconfig
index 019e1396925e,48b0362a0f0e..000000000000
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@@ -440,11 -430,8 +440,11 @@@ CONFIG_VIDEO_RENESAS_VSP1=
  CONFIG_VIDEO_ADV7180=m
  CONFIG_VIDEO_ML86V7667=m
  CONFIG_DRM=y
 +# CONFIG_DRM_I2C_CH7006 is not set
 +# CONFIG_DRM_I2C_SIL164 is not set
- CONFIG_DRM_PTN3460=m
- CONFIG_DRM_PS8622=m
+ CONFIG_DRM_NXP_PTN3460=m
+ CONFIG_DRM_PARADE_PS8622=m
 +CONFIG_DRM_NOUVEAU=m
  CONFIG_DRM_EXYNOS=m
  CONFIG_DRM_EXYNOS_DSI=y
  CONFIG_DRM_EXYNOS_FIMD=y
