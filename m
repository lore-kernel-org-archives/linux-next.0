From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: linux-next: arm tree build failure
Date: Tue, 19 Aug 2008 13:16:21 +0200
Message-ID: <200808191316.21469.marek.vasut@gmail.com>
References: <20080819155319.23e0e8b4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.152]:51957 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753578AbYHSLMd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 07:12:33 -0400
Received: by fg-out-1718.google.com with SMTP id 19so1941446fgg.17
        for <linux-next@vger.kernel.org>; Tue, 19 Aug 2008 04:12:32 -0700 (PDT)
In-Reply-To: <20080819155319.23e0e8b4.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

Dne Tuesday 19 of August 2008 07:53:19 Stephen Rothwell napsal(a):
> Hi Russell,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> drivers/input/touchscreen/ucb1400_ts.c: In function
> 'ucb1400_ts_detect_irq': drivers/input/touchscreen/ucb1400_ts.c:333: error:
> 'NO_IRQ' undeclared (first use in this function)
>
> I applied the following patch.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
> From 3a6383e5556524c941c1421a0e65a0725189ac9e Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 19 Aug 2008 15:49:30 +1000
> Subject: [PATCH] ucb1400: restore NO_IRQ definition
>
> This piece of code was removed by commit
> 2881353061f896c3894c64e39cf2be35b36aa9fc ("[ARM] 5184/1: Split ucb1400_ts
> into core and touchscreen").
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/input/touchscreen/ucb1400_ts.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/input/touchscreen/ucb1400_ts.c
> b/drivers/input/touchscreen/ucb1400_ts.c index 006499b..5498662 100644
> --- a/drivers/input/touchscreen/ucb1400_ts.c
> +++ b/drivers/input/touchscreen/ucb1400_ts.c
> @@ -289,6 +289,10 @@ static void ucb1400_ts_close(struct input_dev *idev)
>  	ucb1400_reg_write(ucb->ac97, UCB_TS_CR, 0);
>  }
>
> +#ifndef NO_IRQ
> +#define NO_IRQ	0
> +#endif
> +
>  /*
>   * Try to probe our interrupt, rather than relying on lots of
>   * hard-coded machine dependencies.

This is my fault indeed, sorry. I tested only on ARM.
