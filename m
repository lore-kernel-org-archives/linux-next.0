From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Mon, 04 Mar 2013 10:32:31 +0800
Message-ID: <20130304023231.9DB013E14C0@localhost>
References: <20130304124513.cf97f6249b0759a1ea1cb34d@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:58336 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754503Ab3CDCdF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 Mar 2013 21:33:05 -0500
Received: by mail-pa0-f52.google.com with SMTP id fb1so2865999pad.39
        for <linux-next@vger.kernel.org>; Sun, 03 Mar 2013 18:33:04 -0800 (PST)
In-Reply-To: <20130304124513.cf97f6249b0759a1ea1cb34d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@stericsson.com>, Linus Walleij <linus.walleij@linaro.org>

On Mon, 4 Mar 2013 12:45:13 +1100, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
> 
> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpio/gpio-stmpe.c: In function 'stmpe_gpio_irq_init':
> drivers/gpio/gpio-stmpe.c:313:23: error: 'struct gpio_chip' has no member named 'of_node'
> drivers/gpio/gpio-stmpe.c:316:61: error: 'struct gpio_chip' has no member named 'of_node'
> drivers/gpio/gpio-stmpe.c: In function 'stmpe_gpio_probe':
> drivers/gpio/gpio-stmpe.c:351:18: error: 'struct gpio_chip' has no member named 'of_node'
> 
> Caused by commit f7719903b7c7 ("").
> 
> I have used the gpio tree from next-20130301 for today.

Yup, I messed that one up. I've now pushed out a fixed branch.

g.

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
