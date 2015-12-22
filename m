From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Tue, 22 Dec 2015 16:42:10 +1100
Message-ID: <20151222164210.170ec46c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38293 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752679AbbLVFmN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Dec 2015 00:42:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>

Hi Linus,

After merging the gpio tree, today's linux-next build (lots without
CONFIG_OF) failed like this:

drivers/gpio/gpio-pxa.c: In function 'pxa_gpio_probe':
drivers/gpio/gpio-pxa.c:648:12: error: 'pxa_irq_domain_ops' undeclared (first use in this function)

Caused by commit

  384ca3c6a28d ("gpio: pxa: change the interrupt management")

The reference to pxa_irq_domain_ops was moved out of the protection of
CONFIG_OF ...

Discovered after the release.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
