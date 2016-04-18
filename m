From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Mon, 18 Apr 2016 14:10:02 +1000
Message-ID: <20160418141002.5a1632a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59122 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750975AbcDREKL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Apr 2016 00:10:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpio/gpio-f7188x.c: In function 'f7188x_gpio_set_single_ended':
drivers/gpio/gpio-f7188x.c:331:26: error: implicit declaration of function 'gpio_data_mode' [-Werror=implicit-function-declaration]
  superio_outb(sio->addr, gpio_data_mode(bank->regbase), data);
                          ^

Caused by commit

  f90c6bdb690b ("gpio: f7188x: use the new open drain callback")

I have used the gpio tree from next-20160415 for today.

-- 
Cheers,
Stephen Rothwell
