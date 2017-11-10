From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with Linus Torvalds' tree
Date: Fri, 10 Nov 2017 14:13:49 +1100
Message-ID: <20171110141349.003e8584@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40279 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755781AbdKJDNw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Nov 2017 22:13:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Thierry Reding <treding@nvidia.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/pinctrl/bcm/pinctrl-bcm2835.c

between commit:

  c84284e59d60 ("pinctrl: bcm2835: fix build warning in bcm2835_gpio_irq_handle_bank")

from Linus Torvalds' tree and commits:

  f0fbe7bce733 ("gpio: Move irqdomain into struct gpio_irq_chip")
  9e9355bb2096 ("pinctrl: bcm2835: Fix some merge fallout")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/pinctrl/bcm/pinctrl-bcm2835.c
index ff782445dfb7,72d122748293..000000000000
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@@ -379,7 -380,10 +379,7 @@@ static void bcm2835_gpio_irq_handle_ban
  	events &= pc->enabled_irq_map[bank];
  	for_each_set_bit(offset, &events, 32) {
  		gpio = (32 * bank) + offset;
- 		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irqdomain,
 -		/* FIXME: no clue why the code looks up the type here */
 -		type = pc->irq_type[gpio];
 -
+ 		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,
  						     gpio));
  	}
  }
