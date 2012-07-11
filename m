From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 10 (gpio/gpio-tps65910.c)
Date: Tue, 10 Jul 2012 22:44:37 -0700
Message-ID: <4FFD12C5.9090204@xenotime.net>
References: <20120710174320.3b7dd806e20ee74ca1b1685f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:55146 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753315Ab2GKFpV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jul 2012 01:45:21 -0400
In-Reply-To: <20120710174320.3b7dd806e20ee74ca1b1685f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, Graeme Gregory <gg@slimlogic.co.uk>, Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>

On 07/10/2012 12:43 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120709:
> 



on i386:

when CONFIG_OF_GPIO is not enabled:

drivers/gpio/gpio-tps65910.c: In function 'tps65910_gpio_probe':
drivers/gpio/gpio-tps65910.c:152:26: error: 'struct gpio_chip' has no member named 'of_node'



-- 

~Randy
