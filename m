From: Vinod <vkoul@kernel.org>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Thu, 4 Oct 2018 11:43:12 +0530
Message-ID: <20181004061312.GC2372@vkoul-mobl>
References: <20181004154438.64f9d8c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181004154438.64f9d8c2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Angelo Dureghello <angelo@sysam.it>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 04-10-18, 15:44, Stephen Rothwell wrote:
> Hi Vinod,
> 
> After merging the slave-dma tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/dma/fsl-edma.c:67: warning: "EDMA_SEEI_SEEI" redefined
>  #define EDMA_SEEI_SEEI(x) ((x) & 0x1F)
> 
> In file included from drivers/dma/fsl-edma.c:25:
> drivers/dma/fsl-edma-common.h:21: note: this is the location of the previous definition
>  #define EDMA_SEEI_SEEI(x) ((x) & GENMASK(4, 0))
> 
>  ...
> 
> drivers/dma/fsl-edma.c:115:6: error: nested redefinition of 'enum fsl_edma_pm_state'
>  enum fsl_edma_pm_state {
>       ^~~~~~~~~~~~~~~~~
> drivers/dma/fsl-edma.c:115:6: error: redeclaration of 'enum fsl_edma_pm_state'
> In file included from drivers/dma/fsl-edma.c:25:
> drivers/dma/fsl-edma-common.h:63:6: note: originally defined here
>  enum fsl_edma_pm_state {
>       ^~~~~~~~~~~~~~~~~
> 
> and so on ...
> 
> Caused by commit
> 
>   101d256a45ed ("Merge branch 'testing/dirn_remove' into next")
> 
> which reintroduced a whole lot of stuff into drivers/dma/fsl-edma.c that
> had been modev out in commit
> 
>   9d831528a656 ("dmaengine: fsl-edma: extract common fsl-edma code (no changes in behavior intended)")

I got a merge conflict but for include, so looks like merge went bad.
I will redo it and push

> I used the slave-dma tree from next-20181003 for today.

Thanks for updating

Best Regards,
-- 
~Vinod
