From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pinctrl tree
Date: Fri, 25 Sep 2015 13:34:10 +1000
Message-ID: <20150925133410.3c9e2b03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59441 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754591AbbIYDeM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Sep 2015 23:34:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@atmel.com>

Hi Linus,

After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pinctrl/pinctrl-at91-pio4.c: In function 'atmel_gpio_irq_set_type':
drivers/pinctrl/pinctrl-at91-pio4.c:170:3: error: implicit declaration of function '__irq_set_handler_locked' [-Werror=implicit-function-declaration]
   __irq_set_handler_locked(d->irq, handle_edge_irq);
   ^
drivers/pinctrl/pinctrl-at91-pio4.c: In function 'atmel_pinctrl_probe':
drivers/pinctrl/pinctrl-at91-pio4.c:925:3: warning: passing argument 2 of 'irq_set_chained_handler' from incompatible pointer type
   irq_set_chained_handler(res->start, atmel_gpio_irq_handler);
   ^
In file included from include/linux/gpio/driver.h:6:0,
                 from include/asm-generic/gpio.h:12,
                 from arch/arm/include/asm/gpio.h:9,
                 from include/linux/gpio.h:48,
                 from drivers/pinctrl/pinctrl-at91-pio4.c:18:
include/linux/irq.h:548:1: note: expected 'irq_flow_handler_t' but argument is of type 'void (*)(unsigned int,  struct irq_desc *)'
 irq_set_chained_handler(unsigned int irq, irq_flow_handler_t handle)
 ^

Caused by commit

  776180848b57 ("pinctrl: introduce driver for Atmel PIO4 controller")

I have used the pinctrl tree from next-20150924 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
