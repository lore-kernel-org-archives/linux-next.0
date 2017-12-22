From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: linux-next: build failure after merge of the spi tree
Date: Fri, 22 Dec 2017 08:39:36 +0100
Message-ID: <CAKwiHFjfNkVp3k7Z3sVjybKJ-XVJHce4A5BvHMpXwLe14UOnXg@mail.gmail.com>
References: <20171222131859.774260f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171222131859.774260f9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 22 December 2017 at 03:18, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Mark,
>
> After merging the spi tree, today's linux-next build (x86_64 allmodconfig
> build) failed like this:
>
> drivers/spi/spi-pxa2xx.c: In function 'setup_cs':
> drivers/spi/spi-pxa2xx.c:1240:3: error: implicit declaration of function 'gpiod_free' [-Werror=implicit-function-declaration]
>    gpiod_free(chip->gpiod_cs);
>    ^
>
> Caused by commit
>
>   221886646f75 ("spi: pxa2xx: avoid redundant gpio_to_desc(desc_to_gpio()) round-trip")
>
> Presumably a missing include file.

Gaah, sorry, not sure when I learn to compile-test every single patch
:( When I saw that gpiod_free wasn't static I didn't think to go look
for any public declaration, assuming that it would be declared the
same place as gpio_free, but apparently it's private to gpiolib.
There's no public declaration in include/, but there's a public
gpiod_put, which is nothing but a wrapper for gpiod_free. gpiod_put is
declared in linux/gpio/consumer.h, which is already #included, so
s/gpiod_free/gpiod_put/ should fix it.

Want a follow-up patch or a replacement?

Rasmus




> I have used the spi tree from next-20171221 for today.
>
> --
> Cheers,
> Stephen Rothwell
