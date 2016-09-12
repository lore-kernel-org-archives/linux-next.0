From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Mon, 12 Sep 2016 15:27:07 +0200
Message-ID: <CACRpkdbOeSDEx0ms_VMPSdB=5qrfhNVPWs-neL+sVMydVy-E-A@mail.gmail.com>
References: <20160909143617.7106762e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33743 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758894AbcILN1I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Sep 2016 09:27:08 -0400
Received: by mail-oi0-f54.google.com with SMTP id y2so313059706oie.0
        for <linux-next@vger.kernel.org>; Mon, 12 Sep 2016 06:27:08 -0700 (PDT)
In-Reply-To: <20160909143617.7106762e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>

On Fri, Sep 9, 2016 at 6:36 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/gpio/gpiolib.c: In function '_gpiochip_irqchip_add':
> drivers/gpio/gpiolib.c:1622:62: error: macro "WARN_ON" passed 3 arguments, but takes just 1
>        "%s: Ignoring %d default trigger\n", of_node->full_name))
>                                                               ^
> drivers/gpio/gpiolib.c:1621:6: error: 'WARN_ON' undeclared (first use in this function)
>   if (WARN_ON(of_node && type != IRQ_TYPE_NONE,
>       ^
>
> Caused by commit
>
>   1ded8b1dafe6 ("gpio/gpiolib: Forbid irqchip default trigger if probed over DT")
>
> I used the version of the gpio tree from next-20160908 for today.

Sorry about this, fixed it up.

Yours,
Linus Walleij
