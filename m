From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build warning after merge of the arm-soc tree
Date: Fri, 3 May 2019 07:49:33 +0100
Message-ID: <CACRpkdYBuBf7jA2nUitiZWRriXVTPWCyB93q2CzmP4tbVZXqHA@mail.gmail.com>
References: <20190430092839.767e5bf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430092839.767e5bf8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 30, 2019 at 12:28 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the arm-soc tree, today's linux-next build
> (x86_64 allmodconfig) produced this warning:
>
> drivers/clocksource/timer-ixp4xx.c:78:20: warning: 'ixp4xx_read_sched_clock' defined but not used [-Wunused-function]
>  static u64 notrace ixp4xx_read_sched_clock(void)
>                     ^~~~~~~~~~~~~~~~~~~~~~~

This is kind of normal for timer drivers, as the sched_clock() call is #ifdef:ed
for CONFIG_ARM, it is not uniformly available on all archs. This appears
as a side effect of COMPILE_TEST which I think is fair to produce
things like this.

Yours,
Linus Walleij
