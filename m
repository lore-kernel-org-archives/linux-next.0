From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] soc/qbman: fix implicit header dependency now
 causing build fails
Date: Wed, 3 May 2017 19:15:24 +1000
Message-ID: <20170503191524.41e16fa5@canb.auug.org.au>
References: <20170502222112.16720-1-paul.gortmaker@windriver.com>
        <20170503084240.GC5077@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55351 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751042AbdECJP2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 May 2017 05:15:28 -0400
In-Reply-To: <20170503084240.GC5077@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <jroedel@suse.de>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org

Hi Joerg,

On Wed, 3 May 2017 10:42:40 +0200 Joerg Roedel <jroedel@suse.de> wrote:
>
> On Tue, May 02, 2017 at 06:21:12PM -0400, Paul Gortmaker wrote:
> > In commit 461a6946b1f9 ("iommu: Remove pci.h include from
> > trace/events/iommu.h") that header shuffle uncovered an implicit
> > include in this driver, manifesting as:
> > 
> >     CC      drivers/soc/fsl/qbman/qman_portal.o
> >     drivers/soc/fsl/qbman/qman_portal.c: In function 'qman_portal_probe':
> >     drivers/soc/fsl/qbman/qman_portal.c:299:2: error: implicit declaration of function 'dma_set_mask'
> >     drivers/soc/fsl/qbman/qman_portal.c:299:2: error: implicit declaration of function 'DMA_BIT_MASK'
> >         if (dma_set_mask(dev, DMA_BIT_MASK(40))) {
> >         ^
> > 
> > on the corenet32_smp_defconfig (and 64 bit respectively.)  The above
> > commit was singled out via git bisect.
> > 
> > The header it was implictly relying on getting was dma-mapping.h - so
> > we explicitly add it here.
> > 
> > Fixes: 461a6946b1f9 ("iommu: Remove pci.h include from trace/events/iommu.h")
> > Cc: Joerg Roedel <jroedel@suse.de>
> > Cc: Scott Wood <oss@buserror.net>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>  
> 
> Thanks for catching that, I though I found all breakages caused by
> removing this include. Obviously this wasn't true :)
> 
> I applied the fix to the iommu/core branch.

Thanks.

It looks like there is at least one more:

drivers/soc/fsl/qbman/qman.c: In function 'qman_init_fq':
drivers/soc/fsl/qbman/qman.c:1787:4: error: implicit declaration of function 'dma_map_single' [-Werror=implicit-function-declaration]
drivers/soc/fsl/qbman/qman.c:1788:21: error: 'DMA_TO_DEVICE' undeclared (first use in this function)
drivers/soc/fsl/qbman/qman.c:1789:4: error: implicit declaration of function 'dma_mapping_error' [-Werror=implicit-function-declaration]

This is from a powerpc orenet64_smp_defconfig build of today's
linux-next.
-- 
Cheers,
Stephen Rothwell
