From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Fri, 20 Jul 2018 22:31:56 +0200
Message-ID: <CACRpkdZffsC0RsX9Q72+AwWZynjBfTZ4=RE+o=HVd3H0yCdAgA@mail.gmail.com>
References: <20180719114027.2722d075@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719114027.2722d075@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 19, 2018 at 3:40 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/net/dsa/realtek.o
> see include/linux/module.h for more information
>
> Introduced by commit
>
>   d8652956cf37 ("net: dsa: realtek-smi: Add Realtek SMI driver")

Thanks, there is already a patch for it.

I'm pretty grateful that this was the worst the integration testing
could find :) new drivers always make me nervous.

Yours,
Linus Walleij
