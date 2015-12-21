From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pinctrl tree
Date: Mon, 21 Dec 2015 15:58:11 +1100
Message-ID: <20151221155811.04a84bf1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46875 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750850AbbLUE6O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Dec 2015 23:58:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pramod Kumar <pramodku@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>

Hi Linus,

After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:640:50: warning: 'struct cygnus_gpio' declared inside parameter list
 static void iproc_gpio_unregister_pinconf(struct cygnus_gpio *chip)
                                                  ^
drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:640:50: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/pinctrl/bcm/pinctrl-iproc-gpio.c: In function 'iproc_gpio_unregister_pinconf':
drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:642:25: error: dereferencing pointer to incomplete type 'struct cygnus_gpio'
  pinctrl_unregister(chip->pctl);   
                         ^
drivers/pinctrl/bcm/pinctrl-iproc-gpio.c: In function 'iproc_gpio_probe':
drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:738:32: warning: passing argument 1 of 'iproc_gpio_unregister_pinconf' from incompatible pointer type [-Wincompatible-pointer-types]   
  iproc_gpio_unregister_pinconf(chip);
                                ^   
drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:640:13: note: expected 'struct cygnus_gpio *' but argument is of type 'struct iproc_gpio *'
 static void iproc_gpio_unregister_pinconf(struct cygnus_gpio *chip)
             ^

Caused by commit

 afc8c78d179d ("gpio: Rename func/macro/var to IP-block,iproc")

This does not look like it has even been build tested :-(

I have used the pinctrl tree from next-20151217 again as the previous
(fixed) error was hiding this one.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
