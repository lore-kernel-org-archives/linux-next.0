From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build warning after merge of the pinctrl tree
Date: Wed, 20 May 2015 09:14:55 +0200
Message-ID: <CACRpkdYrCf+FtNyGqBTFzYnL-S_fU09ZSp-VCZuXSH0RxGpsRA@mail.gmail.com>
References: <20150520164008.616458c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150520164008.616458c6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>
List-Id: linux-next.vger.kernel.org

On Wed, May 20, 2015 at 8:40 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> After merging the pinctrl tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> warning: (PINCTRL_MT6397) selects PINCTRL_MTK_COMMON which has unmet direct dependencies (PINCTRL && (ARCH_MEDIATEK || COMPILE_TEST) && OF)
>
> Introduced by commit fc59e66c4284 ("pinctrl: mediatek: Add Pinctrl/GPIO
> driver for mt6397").

Ah too bad I didn't see it before pushing, fixed it now, thanks!

Yours,
Linus Walleij
