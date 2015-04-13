From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 13 Apr 2015 11:02:57 +0300
Message-ID: <2288429.vI9C8UzuM6@avalon>
References: <20150410201143.4adb51b0@canb.auug.org.au> <2431868.FjHG917i2e@avalon> <20150413130557.75fc7f0f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44907 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752098AbbDMICc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2015 04:02:32 -0400
In-Reply-To: <20150413130557.75fc7f0f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>, Radhey Shyam Pandey <radheys@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Hans Verkuil <hans.verkuil@cisco.com>

Hi Stephen,

On Monday 13 April 2015 13:05:57 Stephen Rothwell wrote:
> On Fri, 10 Apr 2015 15:45:11 +0300 Laurent Pinchart wrote:
> > On Friday 10 April 2015 20:11:43 Stephen Rothwell wrote:
> > > Hi Mauro,
> > > 
> > > After merging the v4l-dvb tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > > 
> > > drivers/media/platform/xilinx/xilinx-dma.c:15:35: fatal error:
> > > linux/amba/xilinx_dma.h: No such file or directory #include
> > > <linux/amba/xilinx_dma.h>
> > > 
> > >                                    ^
> > > 
> > > Caused by commit df3305156f98 ("[media] v4l: xilinx: Add Xilinx Video
> > > IP core").
> > > 
> > > I have reverted that commit (and the 2 following it) for today.
> > 
> > linux/amba/xilinx_dma.h has been moved to linux/dma/xilinx_dma.h by
> > 
> > commit 937abe88aea3161cd3a563e577fc9cf4522c7aad
> > Author: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
> > Date:   Mon Mar 2 23:24:24 2015 +0530
> > 
> >     dmaengine: xilinx-dma: move header file to common location
> >     
> >     This patch moves the xilinx_dma.h header file
> >     to the include/linux/dma.
> >     
> >     Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> >     Signed-off-by: Vinod Koul <vinod.koul@intel.com>
> > 
> > Could you update the path instead of reverting the commits ?
> 
> I applied this:

Perfect, thank you.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 13 Apr 2015 12:48:27 +1000
> Subject: [PATCH] v4l: xilinx: fix for include file movement
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c
> b/drivers/media/platform/xilinx/xilinx-dma.c index
> 10209c294168..efde88adf624 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -12,7 +12,7 @@
>   * published by the Free Software Foundation.
>   */
> 
> -#include <linux/amba/xilinx_dma.h>
> +#include <linux/dma/xilinx_dma.h>
>  #include <linux/lcm.h>
>  #include <linux/list.h>
>  #include <linux/module.h>

-- 
Regards,

Laurent Pinchart
