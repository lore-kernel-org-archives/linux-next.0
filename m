From: Vinod Koul <vkoul@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the slave-dma tree
Date: Mon, 29 Apr 2019 10:01:06 +0530
Message-ID: <20190429043106.GB3845@vkoul-mobl.Dlink>
References: <20190428171701.2a96cd3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190428171701.2a96cd3c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 28-04-19, 17:17, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   9bd1be60f55b ("dmaengine: stm32-dma: Fix unsigned variable compared with zero")
> 
> Fixes tag
> 
>   Fixes: f4fd2ec08f17: ("dmaengine: stm32-dma: use platform_get_irq()")
> 
> has these problem(s):
> 
>   - The colon following the SHA1 is unexpected
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Thanks Stephen for the report.

Have fixed it up.

-- 
~Vinod
