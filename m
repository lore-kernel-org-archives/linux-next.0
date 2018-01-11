From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build warning after merge of the gpio tree
Date: Thu, 11 Jan 2018 10:19:49 +0100
Message-ID: <CACRpkdYoJ6U6zYoqcLPHO=kN45AcE3YNDdHaOkZNts41XMSgwA@mail.gmail.com>
References: <20180111150614.2a1d0de0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:37935 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753673AbeAKJTu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jan 2018 04:19:50 -0500
Received: by mail-qt0-f178.google.com with SMTP id d4so983774qtj.5
        for <linux-next@vger.kernel.org>; Thu, 11 Jan 2018 01:19:50 -0800 (PST)
In-Reply-To: <20180111150614.2a1d0de0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>

On Thu, Jan 11, 2018 at 5:06 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> After merging the gpio tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> drivers/gpio/Kconfig:13:error: recursive dependency detected!
> drivers/gpio/Kconfig:13:        symbol GPIOLIB is selected by STX104
> drivers/iio/adc/Kconfig:699:    symbol STX104 depends on ISA_BUS_API
> arch/Kconfig:821:       symbol ISA_BUS_API is selected by GPIO_WINBOND
> drivers/gpio/Kconfig:701:       symbol GPIO_WINBOND depends on GPIOLIB
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
>
> Presumably introduced by commit
>
>   a0d65009411c ("gpio: winbond: Add driver")

Thanks, Arnd already patched it up quickly!

Yours,
Linus Walleij
