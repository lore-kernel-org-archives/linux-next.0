From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Tue, 16 Feb 2016 15:47:37 +0100
Message-ID: <CACRpkdZLEojqJTzcJOoZfW5fhPHrm1_aoTurazfW9_rV9PVLGA@mail.gmail.com>
References: <20160216144842.1db2a67b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160216144842.1db2a67b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 16, 2016 at 4:48 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpio/gpio-tps65218.c: In function 'tps65218_gpio_request':
> drivers/gpio/gpio-tps65218.c:74:26: error: 'struct gpio_chip' has no member named 'desc'
>   unsigned long flags = gc->desc[offset].flags;
>                           ^
>
> Caused by commit
>
>   c366c76a2c41 ("gpio: add tps65218 gpio")
>
> interacting with commit
>
>   1c3cdb186172 ("gpio: move descriptors into gpio_device")
>
> both from the gpio tree.

What a mess. I just sent a fixup patch. I blame my ability
to manage several things at the same time.

Yours,
Linus Walleij
