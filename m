From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: build failure after merge of the imx-mxs tree
Date: Fri, 29 May 2015 21:16:55 +0800
Message-ID: <20150529131654.GL16165@dragon>
References: <20150529212859.0acb08e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:36370 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754988AbbE2NRx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2015 09:17:53 -0400
Received: by pacux9 with SMTP id ux9so17485584pac.3
        for <linux-next@vger.kernel.org>; Fri, 29 May 2015 06:17:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150529212859.0acb08e2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Fri, May 29, 2015 at 09:28:59PM +1000, Stephen Rothwell wrote:
> Hi Shawn,
> 
> After merging the imx-mxs tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> 
> drivers/clocksource/timer-imx-gpt.c:37:27: fatal error: asm/mach/time.h: No such file or directory
>  #include <asm/mach/time.h>
>                            ^
> 
> Caused by commit 77b0235b6b5c ("ARM: imx: move timer driver into
> drivers/clocksource").
> 
> I have marked it as BROKEN for now:

Thanks for the report.  I just sent a fix for it, and will get it into
my for-next branch soon.

Sorry for the breakage.

Shawn

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 29 May 2015 21:24:03 +1000
> Subject: [PATCH] ARM: imx: mark CLKSRC_IMX_GPT as BROKEN for now
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/clocksource/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 3c15a49fdac9..d8fedc925864 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -279,6 +279,7 @@ config CLKSRC_PXA
>  config CLKSRC_IMX_GPT
>  	bool "Clocksource using i.MX GPT" if COMPILE_TEST
>  	depends on OF
> +	depends on BROKEN
>  	select CLKSRC_MMIO
>  
>  config H8300_TMR16
> -- 
> 2.1.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
