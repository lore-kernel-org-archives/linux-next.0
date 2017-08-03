From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-msm tree
Date: Thu, 3 Aug 2017 13:09:49 +1000
Message-ID: <20170803130949.34e8cd0d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52409 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751188AbdHCDJv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Aug 2017 23:09:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>

Hi all,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/msm/adreno/a5xx_gpu.c: In function 'a5xx_zap_shader_init':
drivers/gpu/drm/msm/adreno/a5xx_gpu.c:493:19: warning: unused variable 'a5xx_gpu' [-Wunused-variable]
  struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
                   ^

Introduced by commit

  8d6f08272b6f ("drm/msm: Remove uneeded platform dev members")

-- 
Cheers,
Stephen Rothwell
