From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the gpio tree
Date: Tue, 30 May 2017 13:52:30 +1000
Message-ID: <20170530135230.7e78aba2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46145 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750733AbdE3Dwe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 May 2017 23:52:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Linus,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpio/gpiolib.c: In function 'gpiochip_irqchip_init_valid_mask':
drivers/gpio/gpiolib.c:1474:6: warning: unused variable 'i' [-Wunused-variable]
  int i;
      ^

Introduced by commit

  923a654c186c ("gpiolib: Re-use bitmap_fill() instead of open coded loop")

-- 
Cheers,
Stephen Rothwell
