From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Wed, 5 Apr 2017 13:36:28 +1000
Message-ID: <20170405133628.4c9041f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752346AbdDEDgb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Apr 2017 23:36:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arto Merilainen <amerilainen@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/built-in.o:(__tracepoints+0x64): multiple definition of `__tracepoint_remove_device_from_group'
drivers/iommu/built-in.o:(__tracepoints+0x64): first defined here
drivers/gpu/built-in.o:(__tracepoints+0x3c): multiple definition of `__tracepoint_detach_device_from_domain'
drivers/iommu/built-in.o:(__tracepoints+0x3c): first defined here
drivers/gpu/built-in.o:(__tracepoints+0x0): multiple definition of `__tracepoint_io_page_fault'
drivers/iommu/built-in.o:(__tracepoints+0x0): first defined here
drivers/gpu/built-in.o:(__tracepoints+0x78): multiple definition of `__tracepoint_add_device_to_group'
drivers/iommu/built-in.o:(__tracepoints+0x78): first defined here
drivers/gpu/built-in.o:(__tracepoints+0x14): multiple definition of `__tracepoint_unmap'
drivers/iommu/built-in.o:(__tracepoints+0x14): first defined here
drivers/gpu/built-in.o:(__tracepoints+0x28): multiple definition of `__tracepoint_map'
drivers/iommu/built-in.o:(__tracepoints+0x28): first defined here
drivers/gpu/built-in.o:(__tracepoints+0x50): multiple definition of `__tracepoint_attach_device_to_domain'
drivers/iommu/built-in.o:(__tracepoints+0x50): first defined here

The tip tree has not changed since yesterday.  However, reverting
the drm-tegra tree fixes the build problem.  So there is some interaction
between the tip tree and today's drm-tegra tree.

So for now, I have reverted the merge of the drm-tegra tree.

-- 
Cheers,
Stephen Rothwell
