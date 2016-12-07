From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Wed, 7 Dec 2016 15:22:32 +0100
Message-ID: <CACRpkdZdFBrKyzGRBbWLm1UB-ehsnR_vMSrhLvJK9aH+dDF1bQ@mail.gmail.com>
References: <20161205100038.30581ee1@canb.auug.org.au> <20161207083102.093fdf96@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:36831 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932203AbcLGOWe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2016 09:22:34 -0500
Received: by mail-qk0-f176.google.com with SMTP id n21so414875448qka.3
        for <linux-next@vger.kernel.org>; Wed, 07 Dec 2016 06:22:33 -0800 (PST)
In-Reply-To: <20161207083102.093fdf96@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Dec 6, 2016 at 10:31 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> On Mon, 5 Dec 2016 10:00:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the pinctrl tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> drivers/gpio/gpio-pl061.c: In function 'pl061_irq_set_wake':
>> drivers/gpio/gpio-pl061.c:280:28: error: 'struct gpio_chip' has no member named 'irq_parent'
>>   return irq_set_irq_wake(gc->irq_parent, state);
>>                             ^
>> drivers/gpio/gpio-pl061.c:281:1: warning: control reaches end of non-void function [-Wreturn-type]
>>  }
>>  ^
>>
>> Caused by commit
>>
>>   d245b3f9bd36 ("gpio: simplify adding threaded interrupts")
>>
>> I have used the pinctrl tree from next-20161202 for today.
>
> I am still getting this.

Sorry. My intention was of course to put the required pl061 patches on
an immutable branch and pull into pinctrl as well.

Oh well.

FIxing it up now, sorry for the mess.

Yours,
Linus Walleij
