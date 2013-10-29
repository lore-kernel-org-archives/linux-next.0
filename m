From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Tue, 29 Oct 2013 14:11:40 +0100
Message-ID: <CACRpkdY_xywUJ4CzCjDndZpcembaMfgcVxXi_Xti9F=_LemdEg@mail.gmail.com>
References: <20131029201622.c8cb7bea9b360a98a2c66f74@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131029201622.c8cb7bea9b360a98a2c66f74@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 29, 2013 at 10:16 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> drivers/built-in.o: In function `mmc_gpio_request_cd':
> clkdev.c:(.text+0x75c3c): undefined reference to `devm_gpio_request_one'
>
> CONFIG_GPIO_DEVRES is not defined for this build.  I am not sure what
> made the above error show up, and I have left it broken for today.

Hm and I thought I had put proper stubs in place for this.
Oh well, better take a look again.

Yours,
Linus Walleij
