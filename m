From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the gpio tree
Date: Thu, 16 Jun 2016 14:32:00 +1000
Message-ID: <20160616143200.586e649d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60433 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750989AbcFPEcD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jun 2016 00:32:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from drivers/gpio/gpiolib.c:25:0:
drivers/gpio/gpiolib.c: In function 'lineevent_irq_thread':
include/linux/kfifo.h:403:39: warning: 'ge.id' may be used uninitialized in this function [-Wmaybe-uninitialized]
    )[__kfifo->in & __tmp->kfifo.mask] = \
                                       ^
drivers/gpio/gpiolib.c:657:24: note: 'ge.id' was declared here
  struct gpioevent_data ge;
                        ^

Introduced by commit

  61f922db7221 ("gpio: userspace ABI for reading GPIO line events")

This is in the kfifo_put() call.

-- 
Cheers,
Stephen Rothwell
