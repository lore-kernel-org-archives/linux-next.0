From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the drm-misc tree
Date: Fri, 14 Aug 2015 15:35:32 +1000
Message-ID: <20150814153532.78cd6e88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50596 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750728AbbHNFfe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Aug 2015 01:35:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

drivers/gpu/drm/exynos/exynos_drm_drv.c:290:2: warning: initialization from incompatible pointer type
  .get_vblank_counter = drm_vblank_count,
  ^
drivers/gpu/drm/exynos/exynos_drm_drv.c:290:2: warning: (near initialization for 'exynos_drm_driver.get_vblank_counter')
drivers/gpu/drm/rcar-du/rcar_du_drv.c:262:2: warning: initialization from incompatible pointer type
  .get_vblank_counter = drm_vblank_count,
  ^
drivers/gpu/drm/rcar-du/rcar_du_drv.c:262:2: warning: (near initialization for 'rcar_du_driver.get_vblank_counter')
drivers/gpu/drm/msm/msm_drv.c:981:2: warning: initialization from incompatible pointer type
  .get_vblank_counter = drm_vblank_count,
  ^
drivers/gpu/drm/msm/msm_drv.c:981:2: warning: (near initialization for 'msm_driver.get_vblank_counter')

Introduced by commit

  b90180b057f7 ("drm/irq: More pipe/crtc consistency cleanups")

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
