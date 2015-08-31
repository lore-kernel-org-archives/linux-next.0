From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Mon, 31 Aug 2015 16:40:46 +1000
Message-ID: <20150831164046.0ffd7c55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59541 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751862AbbHaGku (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Aug 2015 02:40:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Fengguang Wu <fengguang.wu@intel.com>

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpio/gpio-etraxfs.c: In function 'etraxfs_gpio_irq_request_resources':
drivers/gpio/gpio-etraxfs.c:300:2: error: 'ret' undeclared (first use in this function)
  ret = gpiochip_lock_as_irq(&chip->bgc.gc, d->hwirq);
  ^

Caused by commit

  5e22ec019823 ("gpio: extraxfs: fix returnvar.cocci warnings")

I have used the gpio tree from next-20150828 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
