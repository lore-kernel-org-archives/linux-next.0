From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the gpio tree with the arm-soc tree
Date: Mon, 17 Dec 2018 11:40:29 -0800
Message-ID: <20181217194029.GZ6707@atomide.com>
References: <20181217191753.172ca200@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217191753.172ca200@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>
List-Id: linux-next.vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [181217 00:18]:
> Hi all,
> 
> Today's linux-next merge of the gpio tree got a conflict in:
> 
>   arch/arm/mach-omap1/board-ams-delta.c
> 
> between commit:
> 
>   19a2668a8ae3 ("ARM: OMAP1: ams-delta: Provide GPIO lookup table for LED device")
> 
> from the arm-soc tree and commit:
> 
>   21abf103818a ("gpio: Pass a flag to gpiochip_request_own_desc()")
> 
> from the gpio tree.
> 
> I fixed it up (the former removed the code updated by the latter, so
> I used that) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

OK thank you.

Regards,

Tony
