From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the pinctrl tree
Date: Tue, 13 Sep 2016 13:15:53 +1000
Message-ID: <20160913131553.5d48be65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45078 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751500AbcIMDP5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Sep 2016 23:15:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Paul Gortmaker <paul.gortmaker@windriver.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/gpio/gpio-mxc.c

between commit:

  e188cbf7564f ("gpio: mxc: shift gpio_mxc_init() to subsys_initcall level")

from the pinctrl tree and commit:

  2c8d6c869feb ("gpio: mxc: drop unused MODULE_ tags from non-modular code")

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

diff --cc drivers/gpio/gpio-mxc.c
index e38989a4fa0c,e35af5249478..000000000000
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@@ -515,10 -510,4 +515,4 @@@ static int __init gpio_mxc_init(void
  {
  	return platform_driver_register(&mxc_gpio_driver);
  }
 -postcore_initcall(gpio_mxc_init);
 +subsys_initcall(gpio_mxc_init);
- 
- MODULE_AUTHOR("Freescale Semiconductor, "
- 	      "Daniel Mack <danielncaiaq.de>, "
- 	      "Juergen Beisert <kernel@pengutronix.de>");
- MODULE_DESCRIPTION("Freescale MXC GPIO");
- MODULE_LICENSE("GPL");
