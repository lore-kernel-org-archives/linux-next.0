From: Vinod Koul <vinod.koul@linux.intel.com>
Subject: Re: linux-next: manual merge of the slave-dma tree with the arm
 tree
Date: Fri, 13 Jul 2012 08:39:02 +0530
Message-ID: <1342148942.1726.0.camel@vkoul-udesk3>
References: <20120702131645.a318e0db6ee778718b6de271@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120702131645.a318e0db6ee778718b6de271@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhangfei Gao <zhangfei.gao@marvell.com>, Leo Yan <leoy@marvell.com>, Qiao Zhou <zhouqiao@marvell.com>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Mon, 2012-07-02 at 13:16 +1000, Stephen Rothwell wrote:
> Hi Vinod,
> 
> Today's linux-next merge of the slave-dma tree got conflicts in
> drivers/dma/Kconfig and drivers/dma/Makefile between commit 06dba53e6fcf
> ("dmaengine: add OMAP DMA engine driver") from the arm tree and commit
> c6da0ba8dfc8 ("dmaengine: mmp_tdma: add mmp tdma support") from the
> slave-dma tree.
Thanks, Looks like Russell has merged the OMAP changes into his tree?


-- 
~Vinod
