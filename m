From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the drm-msm tree
Date: Thu, 13 Aug 2015 16:00:43 +1000
Message-ID: <20150813160043.651ffef6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60574 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751378AbbHMGAp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Aug 2015 02:00:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hai Li <hali@codeaurora.org>

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c

between commit:

  bdbc06e2309b ("drm/msm/dsi: Save/Restore PLL status across PHY reset")

from the drm-msm tree and commit:

  3dde2c2b968a ("drm/msm/dsi: Convert to clk_hw based provider APIs")

from the clk tree.

I fixed it up (the former removed some of the code updated by the latter)
and can carry the fix as necessary (no action is required).



-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
