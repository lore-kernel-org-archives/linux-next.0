From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Mon, 21 Dec 2015 16:02:52 +1100
Message-ID: <20151221160252.01e3ea76@canb.auug.org.au>
References: <20151216143755.67915348@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54857 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750760AbbLUFCy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Dec 2015 00:02:54 -0500
In-Reply-To: <20151216143755.67915348@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

Hi Linus,

On Wed, 16 Dec 2015 14:37:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the gpio tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c: In function 'nsp_gpio_probe':
> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:699:4: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
>     set_irq_flags(irq, IRQF_VALID);
>     ^
> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:699:23: error: 'IRQF_VALID' undeclared (first use in this function)
>     set_irq_flags(irq, IRQF_VALID);
>                        ^
> 
> Caused by commit
> 
>   8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC")
> 
> set_irq_flags was removed before v4.3-rc2 ...
> 
> I have used the gpio tree from next-20151215 for today.

I am still getting this error.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
