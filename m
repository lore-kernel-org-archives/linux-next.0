From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Tue, 22 Nov 2016 10:36:46 +0100
Message-ID: <CAMuHMdU5Df2kNT=ccr7Ts6=a1ELRJdiBbh1xxuqo+e_UeYw-tw@mail.gmail.com>
References: <20161122194130.4efdd019@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33326 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753324AbcKVJgs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Nov 2016 04:36:48 -0500
In-Reply-To: <20161122194130.4efdd019@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>

Hi Stephen,

On Tue, Nov 22, 2016 at 9:41 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the clk tree got conflicts in:
>
>   arch/arm/boot/dts/r8a7779.dtsi
>   arch/arm/boot/dts/r8a7790.dtsi
>   arch/arm/boot/dts/r8a7791.dtsi
>   arch/arm/boot/dts/r8a7792.dtsi
>   arch/arm/boot/dts/r8a7793.dtsi
>   arch/arm/boot/dts/r8a7794.dtsi
>   arch/arm/mach-shmobile/setup-rcar-gen2.c
>   arch/arm64/boot/dts/renesas/r8a7795.dtsi
>   arch/arm64/boot/dts/renesas/r8a7796.dtsi
>   drivers/soc/renesas/Makefile
>
> between various commits from the arm-soc tree and commits from the
> clk tree.
>
> It was just too much at this time of day, so please talk to each other
> and figure out how to fix these up.  I have used the clk tree from
> next-20161117 for today.

Most of these are of the "add both sides" type.
The only exception is the one in arch/arm/mach-shmobile/setup-rcar-gen2.c,
where you just want to keep the call to of_clk_init(NULL);

There's a resolution in
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=renesas-devel-20161117v2-v4.9-rc5%2brcar-rst

Sorry for the mess.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
