From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Fri, 16 May 2014 17:54:42 +0200
Message-ID: <CACRpkdYh+aFcEkOQ4Xti4JzprrcDK17JwNGfTp8ZN1hxcwfpHQ@mail.gmail.com>
References: <20140514171309.64b49a45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140514171309.64b49a45@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, May 14, 2014 at 9:13 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> After merging the gpio tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
>
> drivers/mfd/stmpe.c: In function 'stmpe_irq_init':
> drivers/mfd/stmpe.c:1000:15: error: 'struct stmpe' has no member named 'irq_base'
>    base = stmpe->irq_base;
>                ^
>
> Caused by commit 3ba1d516d5fe ("mfd: stmpe: root out static GPIO and
> IRQ assignments").
>
> I have reverted that commit for today (and e013a5148882 "gpio: stmpe:
> switch to use gpiolib irqchip helpers" that depends on it).
>
> Also, that commit has no Signed-off-by for its committer (Lee).

Hm I know has struggled with this series sorry if it's all my fault :-/

I've un-pulled that branch from the GPIO tree, let's get the immutable
branch in MFD right first then.

Yours,
Linus Walleij
