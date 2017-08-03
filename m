From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-msm tree
Date: Thu, 3 Aug 2017 13:12:25 +1000
Message-ID: <20170803131225.70ffe26c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32999 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751188AbdHCDM1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Aug 2017 23:12:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>

Hi all,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from drivers/gpu/drm/msm/msm_drv.h:37:0,
                 from drivers/gpu/drm/msm/msm_gpu.h:24,
                 from drivers/gpu/drm/msm/msm_gpu.c:18:
drivers/gpu/drm/msm/msm_gpu.c: In function 'msm_gpu_init':
drivers/gpu/drm/msm/msm_gpu.c:742:31: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
   DRM_DEV_INFO_ONCE(drm->dev, "Only creating %lu ringbuffers\n",
                               ^
include/drm/drmP.h:208:60: note: in definition of macro 'DRM_DEV_INFO'
  drm_dev_printk(dev, KERN_INFO, DRM_UT_NONE, __func__, "", fmt, \
                                                            ^
drivers/gpu/drm/msm/msm_gpu.c:742:3: note: in expansion of macro 'DRM_DEV_INFO_ONCE'
   DRM_DEV_INFO_ONCE(drm->dev, "Only creating %lu ringbuffers\n",
   ^

Introduced by commit

  c2fceabca6d5 ("drm/msm: Support multiple ringbuffers")

-- 
Cheers,
Stephen Rothwell
