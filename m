From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: linux-next: manual merge of the gpio tree with the leds tree
Date: Thu, 9 Jan 2014 11:22:32 +0530
Message-ID: <CAK9yfHzFYQHLx9ALOPx+973WeamJCVQZXq61ZWG7TpnuPukDcA@mail.gmail.com>
References: <20140109164948.6a7341cfbd92258bc8d522e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:46865 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832AbaAIFwd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jan 2014 00:52:33 -0500
Received: by mail-oa0-f53.google.com with SMTP id h16so2858350oag.26
        for <linux-next@vger.kernel.org>; Wed, 08 Jan 2014 21:52:33 -0800 (PST)
In-Reply-To: <20140109164948.6a7341cfbd92258bc8d522e3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bryan Wu <cooloney@gmail.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>

On 9 January 2014 11:19, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> Today's linux-next merge of the gpio tree got a conflict in
> drivers/leds/leds-s3c24xx.c between commit cfc7937fb6bd ("leds: s3c24xx:
> Remove hardware.h inclusion") from the leds tree and commit 224feb33a645
> ("leds: s3c24xx: Fix build failure") from the gpio tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc drivers/leds/leds-s3c24xx.c
> index b7876eb09e8c,87cf215af798..000000000000
> --- a/drivers/leds/leds-s3c24xx.c
> +++ b/drivers/leds/leds-s3c24xx.c
> @@@ -18,9 -18,11 +18,10 @@@
>   #include <linux/gpio.h>
>   #include <linux/slab.h>
>   #include <linux/module.h>
>  +#include <linux/platform_data/leds-s3c24xx.h>
>
>  -#include <mach/hardware.h>
>   #include <mach/regs-gpio.h>
> + #include <plat/gpio-cfg.h>
>  -#include <linux/platform_data/leds-s3c24xx.h>
>
>   /* our context */
>

Looks good. Thanks Stephen.

-- 
With warm regards,
Sachin
