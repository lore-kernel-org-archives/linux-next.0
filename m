From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-msm tree
Date: Wed, 1 Nov 2017 14:46:56 +1100
Message-ID: <20171101144656.691413a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751390AbdKADq6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Oct 2017 23:46:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>

Hi Rob,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/drm/drm_mm.h:49:0,
                 from include/drm/drmP.h:73,
                 from drivers/gpu/drm/msm/msm_drv.h:37,
                 from drivers/gpu/drm/msm/msm_gpu.h:24,
                 from drivers/gpu/drm/msm/msm_gpu.c:18:
drivers/gpu/drm/msm/msm_gpu.c: In function 'msm_gpu_init':
drivers/gpu/drm/msm/msm_gpu.c:780:31: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
   DRM_DEV_INFO_ONCE(drm->dev, "Only creating %lu ringbuffers\n",
                               ^
include/drm/drm_print.h:237:60: note: in definition of macro 'DRM_DEV_INFO'
  drm_dev_printk(dev, KERN_INFO, DRM_UT_NONE, __func__, "", fmt, \
                                                            ^
drivers/gpu/drm/msm/msm_gpu.c:780:3: note: in expansion of macro 'DRM_DEV_INFO_ONCE'
   DRM_DEV_INFO_ONCE(drm->dev, "Only creating %lu ringbuffers\n",
   ^

Introduced by commit

  f97decac5f4c ("drm/msm: Support multiple ringbuffers")

-- 
Cheers,
Stephen Rothwell
