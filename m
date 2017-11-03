From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Fri, 3 Nov 2017 08:50:31 +0100
Message-ID: <CACRpkdY0rOxacH=kymWanruEgUcSsfXhy3CrogVUqg9WT_bjTg@mail.gmail.com>
References: <20171102162038.339466ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:52953 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752465AbdKCHud (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Nov 2017 03:50:33 -0400
Received: by mail-io0-f195.google.com with SMTP id f20so4406510ioj.9
        for <linux-next@vger.kernel.org>; Fri, 03 Nov 2017 00:50:32 -0700 (PDT)
In-Reply-To: <20171102162038.339466ef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Thu, Nov 2, 2017 at 6:20 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> After merging the gpio tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/gpio/gpio-uniphier.c:324:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>   .activate = uniphier_gpio_irq_domain_activate,
>               ^
>
> Caused by commit
>
>   dbe776c2ca54 ("gpio: uniphier: add UniPhier GPIO controller driver")
>
> interacting with commit
>
>   72491643469a ("genirq/irqdomain: Update irq_domain_ops.activate() signature")
>
> from the tip tree
>
> I added the following merge fix patch:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 2 Nov 2017 16:10:46 +1100
> Subject: [PATCH] gpio: uniphier: merge fix for "Update
>  irq_domain_ops.activate() signature"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

I applied this patch to the GPIO tree, I guess it is the right thing
to do at this point.

I suspect the IRQ infrastructure will be pulled to Torvald's tree
first anyway.

Yours,
Linus Walleij
