From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Fri, 22 Dec 2017 13:18:59 +1100
Message-ID: <20171222131859.774260f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36633 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753535AbdLVCTB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Dec 2017 21:19:01 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig
build) failed like this:

drivers/spi/spi-pxa2xx.c: In function 'setup_cs':
drivers/spi/spi-pxa2xx.c:1240:3: error: implicit declaration of function 'gpiod_free' [-Werror=implicit-function-declaration]
   gpiod_free(chip->gpiod_cs);
   ^

Caused by commit

  221886646f75 ("spi: pxa2xx: avoid redundant gpio_to_desc(desc_to_gpio()) round-trip")

Presumably a missing include file.

I have used the spi tree from next-20171221 for today.

-- 
Cheers,
Stephen Rothwell
