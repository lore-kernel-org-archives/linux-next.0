From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build warnings after merge of the gpio tree
Date: Wed, 23 Jul 2014 10:46:49 +0200
Message-ID: <CACRpkdb=NgzC=1i96pbuHpUh+S9=6Jv+F1AQit+xf3CJf2q+tA@mail.gmail.com>
References: <20140723184507.30c4b211@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140723184507.30c4b211@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, abdoulaye berthe <berthe.ab@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 23, 2014 at 10:45 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (powerpc
> allyesconfig) produced these warnings:
>
> drivers/gpio/gpio-ucb1400.c: In function 'ucb1400_gpio_remove':
> drivers/gpio/gpio-ucb1400.c:92:2: warning: ignoring return value of 'gpiochip_remove', declared with attribute warn_unused_result [-Wunused-result]
>   gpiochip_remove(&ucb->gc);
>   ^
>
> And lots of similar ones.
>
> Introduced by commit 9f5132ae82fd ("gpio: remove all usage of
> gpio_remove retval in driver/gpio").

Yes we're planning to get rid of the retval in the next merge window after first
purging all drivers.

> Maybe the __must_check attribute should be removed from the declaration
> of the function before removing the retval checking ...

Hey, good idea. I'll do this.

Yours,
Linus Walleij
