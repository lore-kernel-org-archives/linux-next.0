From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the ux500-core tree
Date: Thu, 28 Apr 2011 08:54:04 +0200
Message-ID: <BANLkTinJZSh5y3gAa9ZkY1giPwzA7Nni6w@mail.gmail.com>
References: <20110428105634.7a98c094.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:57332 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752575Ab1D1GyE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Apr 2011 02:54:04 -0400
In-Reply-To: <20110428105634.7a98c094.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2011/4/28 Stephen Rothwell <sfr@canb.auug.org.au>:

> After merging the ux500-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/video/via/via-gpio.c:148: error: 'gpio_config' redeclared as different kind of symbol
> include/asm-generic/gpio.h:164: note: previous declaration of 'gpio_config' was here
>
> Caused by commit cf451708d300 ("gpio: add a custom configuration
> mechanism to gpiolib").

Hm! How typical. I will push a patch that renames gpio_config in the
via driver to via_gpio_config so we don't get this namespace clash.

Yours,
Linus Walleij
