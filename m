From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build warning after merge of the gpio tree
Date: Thu, 16 Jun 2016 12:02:24 +0200
Message-ID: <CACRpkdaJFO_PnXTFTsyCT4WxneRF7sYyu+1H5fKCr0ybYQB6OQ@mail.gmail.com>
References: <20160616143200.586e649d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160616143200.586e649d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 16, 2016 at 6:32 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> In file included from drivers/gpio/gpiolib.c:25:0:
> drivers/gpio/gpiolib.c: In function 'lineevent_irq_thread':
> include/linux/kfifo.h:403:39: warning: 'ge.id' may be used uninitialized in this function [-Wmaybe-uninitialized]
>     )[__kfifo->in & __tmp->kfifo.mask] = \
>                                        ^
> drivers/gpio/gpiolib.c:657:24: note: 'ge.id' was declared here
>   struct gpioevent_data ge;
>                         ^
>
> Introduced by commit
>
>   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
>
> This is in the kfifo_put() call.

Thanks Stephen, Arnd has already helpfully made a patch to fix it :)

Yours,
Linus Walleij
