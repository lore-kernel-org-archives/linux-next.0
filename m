From: Rob Clark <robdclark@gmail.com>
Subject: Re: linux-next: build warning after merge of the drm-msm tree
Date: Wed, 1 Nov 2017 11:19:59 -0400
Message-ID: <CAF6AEGv6eHoeaVs+TDPtEzPYxGEXO__OjSnfhZqLGTeXVhkgeg@mail.gmail.com>
References: <20171101144656.691413a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:55205 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751511AbdKAPUB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Nov 2017 11:20:01 -0400
In-Reply-To: <20171101144656.691413a2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>

On Tue, Oct 31, 2017 at 11:46 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rob,
>
> After merging the drm-msm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> In file included from include/drm/drm_mm.h:49:0,
>                  from include/drm/drmP.h:73,
>                  from drivers/gpu/drm/msm/msm_drv.h:37,
>                  from drivers/gpu/drm/msm/msm_gpu.h:24,
>                  from drivers/gpu/drm/msm/msm_gpu.c:18:
> drivers/gpu/drm/msm/msm_gpu.c: In function 'msm_gpu_init':
> drivers/gpu/drm/msm/msm_gpu.c:780:31: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
>    DRM_DEV_INFO_ONCE(drm->dev, "Only creating %lu ringbuffers\n",
>                                ^
> include/drm/drm_print.h:237:60: note: in definition of macro 'DRM_DEV_INFO'
>   drm_dev_printk(dev, KERN_INFO, DRM_UT_NONE, __func__, "", fmt, \
>                                                             ^
> drivers/gpu/drm/msm/msm_gpu.c:780:3: note: in expansion of macro 'DRM_DEV_INFO_ONCE'
>    DRM_DEV_INFO_ONCE(drm->dev, "Only creating %lu ringbuffers\n",
>    ^
>
> Introduced by commit
>
>   f97decac5f4c ("drm/msm: Support multiple ringbuffers")

Oh, I thought Arnd fixed[1] that already, but it looks like I lost his
patch in the process of moving to a newer version of the
multiple-ringbuffers patch.

I've added Arnd's patch to msm-next.


[1] https://patchwork.freedesktop.org/patch/170111/
