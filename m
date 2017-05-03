From: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH -next] soc/qbman: fix implicit header dependency now
 causing build fails
Date: Wed, 3 May 2017 10:42:40 +0200
Message-ID: <20170503084240.GC5077@suse.de>
References: <20170502222112.16720-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43469 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751533AbdECImo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 May 2017 04:42:44 -0400
Content-Disposition: inline
In-Reply-To: <20170502222112.16720-1-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org

Hi Paul,

On Tue, May 02, 2017 at 06:21:12PM -0400, Paul Gortmaker wrote:
> In commit 461a6946b1f9 ("iommu: Remove pci.h include from
> trace/events/iommu.h") that header shuffle uncovered an implicit
> include in this driver, manifesting as:
> 
>     CC      drivers/soc/fsl/qbman/qman_portal.o
>     drivers/soc/fsl/qbman/qman_portal.c: In function 'qman_portal_probe':
>     drivers/soc/fsl/qbman/qman_portal.c:299:2: error: implicit declaration of function 'dma_set_mask'
>     drivers/soc/fsl/qbman/qman_portal.c:299:2: error: implicit declaration of function 'DMA_BIT_MASK'
>         if (dma_set_mask(dev, DMA_BIT_MASK(40))) {
>         ^
> 
> on the corenet32_smp_defconfig (and 64 bit respectively.)  The above
> commit was singled out via git bisect.
> 
> The header it was implictly relying on getting was dma-mapping.h - so
> we explicitly add it here.
> 
> Fixes: 461a6946b1f9 ("iommu: Remove pci.h include from trace/events/iommu.h")
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: Scott Wood <oss@buserror.net>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Thanks for catching that, I though I found all breakages caused by
removing this include. Obviously this wasn't true :)

I applied the fix to the iommu/core branch.


	Joerg
