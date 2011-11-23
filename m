From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: manual merge of the slave-dma tree with the s5p
 tree
Date: Wed, 23 Nov 2011 16:58:41 +0530
Message-ID: <1322047721.1516.261.camel@vkoul-udesk3>
References: <20111121110837.05684cae0be90d4e7f0df47e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111121110837.05684cae0be90d4e7f0df47e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-next.vger.kernel.org

On Mon, 2011-11-21 at 11:08 +1100, Stephen Rothwell wrote:
> Hi Vinod,
> 
> Today's linux-next merge of the slave-dma tree got a conflict in
> drivers/dma/pl330.c between commit fc0b5cccc8dd ("DMA: PL330: Infer
> transfer direction from transfer request instead of platform data") from
> the s5p tree and commit db8196df4bb6 ("dmaengine: move drivers to
> dma_transfer_direction") from the slave-dma tree.
> 
> The former removed the code modified by the latter, so I did that.

Thanks Stephan,

It seems to be the right fix


-- 
~Vinod
