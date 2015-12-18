From: Pramod Kumar <pramodku@broadcom.com>
Subject: RE: linux-next: build failure after merge of the pinctrl tree
Date: Fri, 18 Dec 2015 05:34:58 +0000
Message-ID: <0C803592FC378B4E83922050AB46442A2ADB1C73@SJEXCHMB10.corp.ad.broadcom.com>
References: <20151218144516.77c8e052@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:7527 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751006AbbLRFe7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Dec 2015 00:34:59 -0500
In-Reply-To: <20151218144516.77c8e052@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>

Hi Stephen/Linus,

The patch " [PATCH v2 5/7] gpio: Rename func/macro/var to IP-block,iproc" 
(https://lkml.org/lkml/2015/11/18/1004) in "for-next" and "devel" of  pinctrl
tree ( http://git.linaro.org/people/linus.walleij/linux-pinctrl.git ) has little rebase issue.

Original patch has:
<snip>
-static void cygnus_gpio_unregister_pinconf(struct cygnus_gpio *chip)
+static void iproc_gpio_unregister_pinconf(struct iproc_gpio *chip)
<snip>

while "for-next" and "devel" branch of pinctrl tree has:
<snip>
-static void cygnus_gpio_unregister_pinconf(struct cygnus_gpio *chip)
+static void iproc_gpio_unregister_pinconf(struct cygnus_gpio *chip) 
<snip>

Please suggest us how could we fix this issue.

Regards,
Pramod

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: 18 December 2015 09:15
> To: Linus Walleij
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Pramod Kumar;
> Ray Jui; Scott Branden
> Subject: linux-next: build failure after merge of the pinctrl tree
> 
> Hi Linus,
> 
> After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c: In function
> 'iproc_gpio_unregister_pinconf':
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:642:25: error: dereferencing pointer to
> incomplete type 'struct cygnus_gpio'
>   pinctrl_unregister(chip->pctl);
>                          ^
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c: In function 'iproc_gpio_probe':
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:738:32: warning: passing argument 1 of
> 'iproc_gpio_unregister_pinconf' from incompatible pointer type [-
> Wincompatible-pointer-types]
>   iproc_gpio_unregister_pinconf(chip);
>                                 ^
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:640:13: note: expected 'struct
> cygnus_gpio *' but argument is of type 'struct iproc_gpio *'
>  static void iproc_gpio_unregister_pinconf(struct cygnus_gpio *chip)
>              ^
> 
> Caused by commit
> 
>   616043d58a89 ("pinctrl: Rename gpio driver from cygnus to iproc")
> 
> I have used the pinctrl tree from next-20151217 for today.
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
