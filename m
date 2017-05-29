From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Mon, 29 May 2017 10:11:11 +0200
Message-ID: <CACRpkdZU-=woez67rErz58GZFLqOn_Y0phKwZysZhu1R5Z=TyQ@mail.gmail.com>
References: <20170529153947.458e2297@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170529153947.458e2297@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 29, 2017 at 7:39 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (arm
> orion5x_defconfig) failed like this:
>
> drivers/gpio/gpio-mvebu.c:1062: undefined reference to `__devm_regmap_init_mmio_clk'
> drivers/gpio/gpio-mvebu.c:1078: undefined reference to `__devm_regmap_init_mmio_clk'
>
> Caused by commit
>
>   2233bf7a92e7 ("gpio: mvebu: switch to regmap for register access")
>
> Presumably a missing Kconfig dependency.  Yeah, CONFIG_REGMAP_MMIO is
> not set for this build.

Yup Gregory sent a patch for this, I applied it, will be there tomorrow.

Yours,
Linus Walleij
