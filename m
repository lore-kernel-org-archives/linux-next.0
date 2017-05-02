From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] soc/qbman: fix implicit header dependency now
 causing build fails
Date: Wed, 3 May 2017 09:38:01 +1000
Message-ID: <20170503093801.7c8fb4b4@canb.auug.org.au>
References: <20170502222112.16720-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37157 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750912AbdEBXiE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 May 2017 19:38:04 -0400
In-Reply-To: <20170502222112.16720-1-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <jroedel@suse.de>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org

Hi all,

On Tue, 2 May 2017 18:21:12 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
>
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
> ---
>  drivers/soc/fsl/qbman/qman_portal.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
> index adbaa30d3c5a..4a6a8ae5e0aa 100644
> --- a/drivers/soc/fsl/qbman/qman_portal.c
> +++ b/drivers/soc/fsl/qbman/qman_portal.c
> @@ -30,6 +30,8 @@
>  
>  #include "qman_priv.h"
>  
> +#include <linux/dma-mapping.h>
> +
>  struct qman_portal *qman_dma_portal;
>  EXPORT_SYMBOL(qman_dma_portal);
>  
> -- 
> 2.11.0

Thanks, Paul, I was just getting around to looking into that build
failure.  I will add this to linux-next as a merge fix patch for the
merge of the iommu tree until Joerg gets around to including it in his
tree.

-- 
Cheers,
Stephen Rothwell
