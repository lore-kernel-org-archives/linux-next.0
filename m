From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: manual merge of the slave-dma tree with the pm, mfd
 and rtc trees
Date: Thu, 27 Aug 2015 08:54:05 +0530
Message-ID: <20150827032405.GS13546@localhost>
References: <20150827112645.6c30e106@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150827112645.6c30e106@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lee Jones <lee.jones@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 27, 2015 at 11:26:45AM +1000, Stephen Rothwell wrote:
> Hi Vinod,
> 
> Today's linux-next merge of the slave-dma tree got conflicts in:
> 
>   drivers/dma/Kconfig
>   drivers/dma/Makefile
> 
> between commit:
> 
>   667dfed98615 ("dmaengine: add a driver for Intel integrated DMA 64-bit")
> 
> from the pm, mfd and rtc trees and commits:
> 
>   3c21619077be ("dmaengine: sort the Kconfig")
>   7e97229b3920 ("dmaengine: sort the makefile")
> 
> from the slave-dma tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen,

I looked at this and merge is sorted, so looks good to me

-- 
~Vinod
