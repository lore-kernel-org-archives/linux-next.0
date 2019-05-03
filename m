From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the arm-soc tree
Date: Fri, 3 May 2019 08:57:35 -0400
Message-ID: <CAK8P3a1dy92NYX=bo6LYUGkFmKjGq65HjomOq7cCYDgx6ceoaA@mail.gmail.com>
References: <20190430092839.767e5bf8@canb.auug.org.au> <CACRpkdYBuBf7jA2nUitiZWRriXVTPWCyB93q2CzmP4tbVZXqHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYBuBf7jA2nUitiZWRriXVTPWCyB93q2CzmP4tbVZXqHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 3, 2019 at 2:49 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Apr 30, 2019 at 12:28 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > After merging the arm-soc tree, today's linux-next build
> > (x86_64 allmodconfig) produced this warning:
> >
> > drivers/clocksource/timer-ixp4xx.c:78:20: warning: 'ixp4xx_read_sched_clock' defined but not used [-Wunused-function]
> >  static u64 notrace ixp4xx_read_sched_clock(void)
> >                     ^~~~~~~~~~~~~~~~~~~~~~~
>
> This is kind of normal for timer drivers, as the sched_clock() call is #ifdef:ed
> for CONFIG_ARM, it is not uniformly available on all archs. This appears
> as a side effect of COMPILE_TEST which I think is fair to produce
> things like this.

Could you send a fixup patch to mark the function __maybe_unused or
move it into the #ifdef?

         Arnd
