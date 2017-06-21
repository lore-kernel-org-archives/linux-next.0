From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 21 Jun 2017 09:41:47 +0200
Message-ID: <CACRpkdZZjVLY2LfR0+sjFT4b22y5=1G16yRgixOE6GGaoWHaGQ@mail.gmail.com>
References: <20170621160934.67c1f27e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170621160934.67c1f27e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xiaoguang Chen <xgchenshy@gmail.com>, Jisheng Zhang <jszhang@marvell.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 21, 2017 at 8:09 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> It looks like those '(' ')' chars are not what they seem ...

No the owls are not what they seem. I went in and fixed the
unicode weirdness, thanks!

Pretty hard to see this one since I can't see it.

Yours,
Linus Walleij
