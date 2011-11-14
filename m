From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: linux-next: build failure after merge of the pm tree (and warning)
Date: Tue, 15 Nov 2011 00:33:29 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1111150032170.32143@axis700.grange>
References: <20111114131730.ae09bb18b87e67f61a97275e@canb.auug.org.au>
 <201111150014.50898.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:62899 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752689Ab1KNXdk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Nov 2011 18:33:40 -0500
In-Reply-To: <201111150014.50898.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Dan Williams <dan.j.williams@intel.com>

Hi Rafael

On Tue, 15 Nov 2011, Rafael J. Wysocki wrote:

> On Monday, November 14, 2011, Stephen Rothwell wrote:
> > Hi Rafael,
> > 
> > After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > drivers/dma/dmatest.c: In function 'dmatest_func':
> > drivers/dma/dmatest.c:255:2: error: implicit declaration of function 'set_freezable_with_signal' [-Werror=implicit-function-declaration]
> > 
> > Caused by commit cd3bc8fbc2d5 ("freezer: kill unused
> > set_freezable_with_signal()") interacting with commit 981ed70d8e4f
> > ("dmatest: make dmatest threads freezable") from Linus' tree (merged into
> > v3.2-rc1).
> > 
> > I reverted the pm tree commit for today.
> 
> Thanks, I've added the following patch to linux-pm/linux-next, which should
> fix this problem (Tejun, if that's not the right thing to do, please let me
> know).
> 
> Rafael
> 
> 
> ---
> From: Rafael J. Wysocki <rjw@sisk.pl>
> Subject: Freezer: Make dmatest_func() use set_freezable()
> 
> According to the commit cd3bc8fbc2d55ae0918184fb34992054dc4eb710
> (freezer: kill unused set_freezable_with_signal()) changelog,
> it should be sufficient to use set_freezable() instead of
> set_freezable_with_signal(), which has been removed, in
> dmatest_func(), so do that and fix a build issue.
> 
> Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
> ---
>  drivers/dma/dmatest.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux/drivers/dma/dmatest.c
> ===================================================================
> --- linux.orig/drivers/dma/dmatest.c
> +++ linux/drivers/dma/dmatest.c
> @@ -252,7 +252,7 @@ static int dmatest_func(void *data)
>  	int			i;
>  
>  	thread_name = current->comm;
> -	set_freezable_with_signal();
> +	set_freezable();

No, this isn't a correct fix.

Thanks
Guennadi

>  
>  	ret = -ENOMEM;
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
