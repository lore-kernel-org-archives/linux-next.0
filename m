From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 5 Apr 2017 10:24:56 +0300
Message-ID: <bcb177fd-c58e-3f87-6eda-f27d952b6773@nvidia.com>
References: <20170405133628.4c9041f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16582 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751298AbdDEHZD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Apr 2017 03:25:03 -0400
In-Reply-To: <20170405133628.4c9041f1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arto Merilainen <amerilainen@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>

On 05.04.2017 06:36, Stephen Rothwell wrote:
> Hi all,
>
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/gpu/built-in.o:(__tracepoints+0x64): multiple definition of `__tracepoint_remove_device_from_group'
> drivers/iommu/built-in.o:(__tracepoints+0x64): first defined here
> drivers/gpu/built-in.o:(__tracepoints+0x3c): multiple definition of `__tracepoint_detach_device_from_domain'
> drivers/iommu/built-in.o:(__tracepoints+0x3c): first defined here
> drivers/gpu/built-in.o:(__tracepoints+0x0): multiple definition of `__tracepoint_io_page_fault'
> drivers/iommu/built-in.o:(__tracepoints+0x0): first defined here
> drivers/gpu/built-in.o:(__tracepoints+0x78): multiple definition of `__tracepoint_add_device_to_group'
> drivers/iommu/built-in.o:(__tracepoints+0x78): first defined here
> drivers/gpu/built-in.o:(__tracepoints+0x14): multiple definition of `__tracepoint_unmap'
> drivers/iommu/built-in.o:(__tracepoints+0x14): first defined here
> drivers/gpu/built-in.o:(__tracepoints+0x28): multiple definition of `__tracepoint_map'
> drivers/iommu/built-in.o:(__tracepoints+0x28): first defined here
> drivers/gpu/built-in.o:(__tracepoints+0x50): multiple definition of `__tracepoint_attach_device_to_domain'
> drivers/iommu/built-in.o:(__tracepoints+0x50): first defined here
>
> The tip tree has not changed since yesterday.  However, reverting
> the drm-tegra tree fixes the build problem.  So there is some interaction
> between the tip tree and today's drm-tegra tree.
>
> So for now, I have reverted the merge of the drm-tegra tree.
>

Looks like this is caused by my patch to add IOMMU support to Host1x. 
I'm confused by how it doesn't appear on ARMv8, though. The cause is 
that host1x/dev.c defines CREATE_TRACE_POINTS and includes 
trace/events/host1x.h, which is fine. However, it then also includes, 
among other local files, dev.h. This used to be fine, but my patch adds 
an include of linux/iommu.h to dev.h, so we get this failure. I'll post 
a fix shortly.

Thanks,
Mikko.
