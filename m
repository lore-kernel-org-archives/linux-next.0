From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build warning after merge of the pinctrl tree
Date: Thu, 11 Oct 2018 09:51:10 +0200
Message-ID: <CACRpkdYic+7AN9d-F1kzZbLtOa0hHdM02NP3hvyWkM9VAckcmg@mail.gmail.com>
References: <20181011141728.50b2d17c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011141728.50b2d17c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 11, 2018 at 5:17 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/pinctrl/bcm/pinctrl-ns.c: In function 'ns_pinctrl_probe':
> drivers/pinctrl/bcm/pinctrl-ns.c:288:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   ns_pinctrl->chipset_flag = (unsigned int)of_id->data;
>                              ^
> drivers/pinctrl/bcm/pinctrl-ns.c:310:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>    unsigned int chipsets = (unsigned int)src->drv_data;
>                            ^

I tried to fix it, stumbled, not I tried to fix it again.
Let's see if I got it right now!

Thanks,
Linus Walleij
