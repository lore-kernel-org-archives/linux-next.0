From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Thu, 31 Mar 2016 09:52:49 +0200
Message-ID: <CACRpkdauTcc2aR9G2qS8vChcBT7TMq7rCLciNy=WowzPegXXvQ@mail.gmail.com>
References: <20160331132235.7f132973@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34780 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753531AbcCaHwu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Mar 2016 03:52:50 -0400
Received: by mail-oi0-f51.google.com with SMTP id o62so49735487oig.1
        for <linux-next@vger.kernel.org>; Thu, 31 Mar 2016 00:52:49 -0700 (PDT)
In-Reply-To: <20160331132235.7f132973@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 31, 2016 at 4:22 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
>
> arch/powerpc/sysdev/ppc4xx_gpio.c: In function 'ppc4xx_gpio_set':
> arch/powerpc/sysdev/ppc4xx_gpio.c:93:26: error: unused variable 'mm_gc' [-Werror=unused-variable]
>   struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>                           ^
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   0d36fe65f583 ("powerpc: ppc4xx: use gpiochip data pointer")
>
> I applied this patch for today:

Thanks Stephen, I indicentally merged an identical patch after
late results from the autobuilder.

Yours,
Linus Walleij
