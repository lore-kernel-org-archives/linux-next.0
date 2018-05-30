From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the regulator tree with the arm-soc tree
Date: Wed, 30 May 2018 09:29:24 +0200
Message-ID: <CACRpkdaotBXbA4pPFHRH0S1SF7-XX_T6yAOwZcbsR3RBcj+-=Q@mail.gmail.com>
References: <20180530150711.2c7c1fe9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530150711.2c7c1fe9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

On Wed, May 30, 2018 at 7:07 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
>
> Today's linux-next merge of the regulator tree got a conflict in:
>
>   arch/arm/mach-omap1/board-ams-delta.c
>
> between commit:
>
>   0486738928bf ("ARM: OMAP1: ams-delta: add GPIO lookup tables")
>
> from the arm-soc tree and commit:
>
>   6059577cb28d ("regulator: fixed: Convert to use GPIO descriptor only")
>
> from the regulator tree.
>
> I fixed it up (see below - it may be better done) and can carry the fix
> as necessary.


OMG that patch on a patch makes my head spin.

I think I just have to look at the eventual result in linux-next and see if
it makes proper sense, and rely on Janusz to test the result and help
to fix it up.

I was unaware of this concurrent gpiod conversion inside OMAP1 but
I'm happy to see that it happens. We might have some fallout, but I'm
sure Janusz is on top of things.

Yours,
Linus Walleij
