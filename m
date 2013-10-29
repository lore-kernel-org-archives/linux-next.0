From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree (gpio
 tree related)
Date: Tue, 29 Oct 2013 14:25:12 +0100
Message-ID: <CACRpkdZ444P-zWx99T2+=nEO13Gbub2rYpE91eW0UoRFc4kdSg@mail.gmail.com>
References: <20131029201013.cc93b7f5eca956bf6ff04e68@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131029201013.cc93b7f5eca956bf6ff04e68@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 29, 2013 at 10:10 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I have applied the following patch for today (it should go into the gpio
> tree if it is considered correct):
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 29 Oct 2013 20:05:12 +1100
> Subject: [PATCH] gpiolib: include gpio/consumer.h in of_gpio.h for
>  desc_to_gpio()
>
> Fixes this build error on sparc:
>
> In file included from drivers/spi/spi.c:33:0:
> include/linux/of_gpio.h: In function 'of_get_named_gpio_flags':
> include/linux/of_gpio.h:93:3: error: implicit declaration of function 'desc_to_gpio' [-Werror=implicit-function-declaration]
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Patch applied, unless Alexandre has any considerations.

Yours,
Linus Walleij
