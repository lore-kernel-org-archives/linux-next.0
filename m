From: Archit Taneja <architt@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 14 Jul 2015 10:30:56 +0530
Message-ID: <55A49788.9070301@codeaurora.org>
References: <20150714125232.5059feb5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57900 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379AbbGNFBD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Jul 2015 01:01:03 -0400
In-Reply-To: <20150714125232.5059feb5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


Hi,

On 07/14/2015 08:22 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/virtio/virtgpu_drm_bus.c: In function 'virtio_pci_kick_out_firmware_fb':
> drivers/gpu/drm/virtio/virtgpu_drm_bus.c:55:2: error: implicit declaration of function 'drm_fb_helper_remove_conflicting_framebuffers' [-Werror=implicit-function-declaration]
>    drm_fb_helper_remove_conflicting_framebuffers(ap, "virtiodrmfb",
>    ^
>
> Caused by commit
>
>    7bd870e7b1c8 ("drm/virtio: Use new drm_fb_helper functions")
>
> I have used the drm-misc tree from next-20150713 for today.
>
> (That commit said "COMPILE TESTED ONLY"  :-()

My bad. The commit messages were for a slightly older version.
I'll fix this, and the warnings in the other mail.

Thanks,
Archit


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
