From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pinctrl tree
Date: Fri, 18 Dec 2015 14:45:16 +1100
Message-ID: <20151218144516.77c8e052@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36830 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752205AbbLRDpS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Dec 2015 22:45:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pramod Kumar <pramodku@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>

Hi Linus,

After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

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

  616043d58a89 ("pinctrl: Rename gpio driver from cygnus to iproc")

I have used the pinctrl tree from next-20151217 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
