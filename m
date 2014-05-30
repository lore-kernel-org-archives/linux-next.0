From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Fri, 30 May 2014 10:19:12 +0200
Message-ID: <CACRpkdaRFRwRHFUQ6oNLg0X5kJ-iigie+4t9Xu9ZcVpG9wMgww@mail.gmail.com>
References: <20140530160859.54642243@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:50402 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751665AbaE3ITN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 May 2014 04:19:13 -0400
Received: by mail-ob0-f172.google.com with SMTP id wp18so1480042obc.3
        for <linux-next@vger.kernel.org>; Fri, 30 May 2014 01:19:12 -0700 (PDT)
In-Reply-To: <20140530160859.54642243@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 30, 2014 at 8:08 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> After merging the pinctrl tree, today's linux-next build (arm multi_v7_defconfig)
> failed like this:
>
> drivers/pinctrl/sirf/pinctrl-sirf.c: In function 'sirfsoc_gpio_handle_irq':
> drivers/pinctrl/sirf/pinctrl-sirf.c:578:11: error: 'sgpio_chip' undeclared (first use in this function)
>
> Caused by commit 294d1351ff47 ("pinctrl: sirf: switch to using
> allocated state container").

Grr a bad cherry-pick from my side. I've fixed it up today.
Thanks a lot for this Stephen.

Yours,
Linus Walleij
