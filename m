From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Tue, 16 Feb 2016 14:48:42 +1100
Message-ID: <20160216144842.1db2a67b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53150 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751600AbcBPDso (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 22:48:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpio/gpio-tps65218.c: In function 'tps65218_gpio_request':
drivers/gpio/gpio-tps65218.c:74:26: error: 'struct gpio_chip' has no member named 'desc'
  unsigned long flags = gc->desc[offset].flags;
                          ^

Caused by commit

  c366c76a2c41 ("gpio: add tps65218 gpio")

interacting with commit

  1c3cdb186172 ("gpio: move descriptors into gpio_device")

both from the gpio tree.

I have used the gpio tree from next-20160215 fro today.

-- 
Cheers,
Stephen Rothwell
