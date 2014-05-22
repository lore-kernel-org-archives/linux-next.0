From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd-lj tree
Date: Fri, 23 May 2014 00:15:20 +0200
Message-ID: <CACRpkdY9taDGRKj_ivkcYaHu+Jz8LnVDt-QQSntkwrcBuLitHA@mail.gmail.com>
References: <20140520180159.3a70193c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140520180159.3a70193c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, May 20, 2014 at 10:01 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> drivers/mfd/stmpe.c: In function 'stmpe_irq_init':
> drivers/mfd/stmpe.c:1000:15: error: 'struct stmpe' has no member named 'irq_base'
>    base = stmpe->irq_base;
>                ^
>
> Caused by commit 3ba1d516d5fe ("mfd: stmpe: root out static GPIO and
> IRQ assignments").

Some mishap in merging these patches I think. I don't have that
line in my branch with the latest patches, I'll get the proper
versions to Lee somehow.

> This is exactly the same error and commit I reported against the gpio
> tree on Friday.  Why has it come back?

It is supposed to come through both trees but I took the branch
out of GPIO after the initial troubles, but it seems to remain in
MFD.

Yours,
Linus Walleij
