From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the tty tree with the slave-dma tree
Date: Tue, 7 Apr 2015 14:27:30 +0200
Message-ID: <CAMuHMdX7JuC1CaRi3_QfGW73Pf4SyuWZs0idQ9inKLj8h8HU3Q@mail.gmail.com>
References: <20150407192808.375a5d91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:36235 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752838AbbDGM1b (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2015 08:27:31 -0400
In-Reply-To: <20150407192808.375a5d91@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Vinod Koul <vinod.koul@intel.com>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Xuelin Shi <xuelin.shi@freescale.com>

On Tue, Apr 7, 2015 at 11:28 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@@ -112,17 -125,8 +112,19 @@@ config FSL_DM
>           EloPlus is on mpc85xx and mpc86xx and Pxxx parts, and the Elo3 is on
>           some Txxx and Bxxx parts.
>
>  +config FSL_RAID
>  +        tristate "Freescale RAID engine Support"
>  +        depends on FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH
>  +        select DMA_ENGINE
>  +        select DMA_ENGINE_RAID
>  +        ---help---
>  +          Enable support for Freescale RAID Engine. RAID Engine is
>  +          available on some QorIQ SoCs (like P5020/P5040). It has
>  +          the capability to offload memcpy, xor and pq computation
>  +        for raid5/6.
>  +
> + source "drivers/dma/hsu/Kconfig"
> +
>   config MPC512X_DMA
>         tristate "Freescale MPC512x built-in DMA engine support"
>         depends on PPC_MPC512x || PPC_MPC831x

Does anyone care about sort order?
The hsu entry ended up in the middle of the Freescale section.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
