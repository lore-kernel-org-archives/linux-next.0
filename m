From: Vinod Koul <vkoul@kernel.org>
Subject: Re: linux-next: build warning after merge of the slave-dma tree
Date: Mon, 26 Nov 2018 13:39:38 +0530
Message-ID: <20181126080855.GS3175@vkoul-mobl.Dlink>
References: <20181126165903.33b1d872@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181126165903.33b1d872@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>, dma <dmaengine@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 26-11-18, 16:59, Stephen Rothwell wrote:
> Hi Vinod,
> 
> After merging the slave-dma tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/dma/coh901318.c: In function 'coh901318_config':
> drivers/dma/coh901318.c:1805:16: warning: unused variable 'flags' [-Wunused-variable]
>   unsigned long flags;
>                 ^~~~~
> 
> Introduced by commit
> 
>   627469e4445b ("dmaengine: coh901318: Fix a double-lock bug")

Thanks for the report, I have fixed it up with below:

-- >8 --

>From fbbdec195155b4497cb83be37788865f98f31dca Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 26 Nov 2018 13:34:15 +0530
Subject: [PATCH] dmaengine: coh901318: Remove unused variable

Commit 627469e4445b ("dmaengine: coh901318: Fix a double-lock bug") left
flags variable unused, so remove it to fix the warning.

drivers/dma/coh901318.c: In function 'coh901318_config':
drivers/dma/coh901318.c:1805:16: warning: unused variable 'flags' [-Wunused-variable]
  unsigned long flags;
                ^~~~~

Reported-By: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/coh901318.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
index fd862a478738..b69d66e44052 100644
--- a/drivers/dma/coh901318.c
+++ b/drivers/dma/coh901318.c
@@ -1802,7 +1802,6 @@ static struct dma_chan *coh901318_xlate(struct of_phandle_args *dma_spec,
 static int coh901318_config(struct coh901318_chan *cohc,
 			    struct coh901318_params *param)
 {
-	unsigned long flags;
 	const struct coh901318_params *p;
 	int channel = cohc->id;
 	void __iomem *virtbase = cohc->base->virtbase;
-- 
2.14.5

-- 
~Vinod
