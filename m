From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio-lw tree
Date: Fri, 18 Jan 2013 16:02:13 +0800
Message-ID: <20130118080211.GA8706@S2101-09.ap.freescale.net>
References: <20130118140346.3f9b182aa7daa175b4f136bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]:17268 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750898Ab3ARIBe (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jan 2013 03:01:34 -0500
Content-Disposition: inline
In-Reply-To: <20130118140346.3f9b182aa7daa175b4f136bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 18, 2013 at 02:03:46PM +1100, Stephen Rothwell wrote:
> Hi Linus,
> 
> After merging the gpio-lw tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
My bad, sorry for that.  I just sent a v2 in reply to this message
for fixing the error.  I spent some time trying to install a ppc64
toolchain for testing, but unfortunately with on luck.  So Stephen,
I have to rely on linux-next to give it a test again.  Thanks.

Shawn

> drivers/gpio/devres.c:51:5: error: redefinition of 'devm_gpio_request'
> include/linux/gpio.h:97:19: note: previous definition of 'devm_gpio_request' was here
> drivers/gpio/devres.c:80:5: error: redefinition of 'devm_gpio_request_one'
> include/linux/gpio.h:109:19: note: previous definition of 'devm_gpio_request_one' was here
> drivers/gpio/devres.c:113:6: error: redefinition of 'devm_gpio_free'
> include/linux/gpio.h:128:20: note: previous definition of 'devm_gpio_free' was here
> 
> Presumably caused by commit d39cd0301255 ("gpio: devm_gpio_* support
> should not depend on GPIOLIB").
