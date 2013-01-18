From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: devm_gpio_* support should not depend on GPIOLIB
Date: Fri, 18 Jan 2013 23:33:45 +0100
Message-ID: <CACRpkdZA9O6N7hmtU-6R1Ff6hW5vjD_ar9RLG1dbkd+MWyoKiw@mail.gmail.com>
References: <20130118140346.3f9b182aa7daa175b4f136bf@canb.auug.org.au>
	<1358495866-9329-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:32887 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753963Ab3ARWdq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jan 2013 17:33:46 -0500
Received: by mail-ie0-f174.google.com with SMTP id k11so1158618iea.5
        for <linux-next@vger.kernel.org>; Fri, 18 Jan 2013 14:33:46 -0800 (PST)
In-Reply-To: <1358495866-9329-1-git-send-email-shawn.guo@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 18, 2013 at 8:57 AM, Shawn Guo <shawn.guo@linaro.org> wrote:

> Some architectures (e.g. blackfin) provide gpio API without requiring
> GPIOLIB support (ARCH_WANT_OPTIONAL_GPIOLIB).  devm_gpio_* functions
> should also work for these architectures, since they do not really
> depend on GPIOLIB.
>
> Add a new option GPIO_DEVRES (enabled by default) to control the build
> of devres.c.  It also removes the empty version of devm_gpio_*
> functions for !GENERIC_GPIO build from linux/gpio.h, and moves the
> function declarations from asm-generic/gpio.h into linux/gpio.h.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

OK I removed the old version of the patch and pushed this instead.

Thanks!
Linus Walleij
