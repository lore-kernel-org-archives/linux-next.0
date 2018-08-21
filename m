From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the mfd tree with Linus' tree
Date: Tue, 21 Aug 2018 10:08:54 +0200
Message-ID: <CAMuHMdUQcoMxb=0_i1PYyymUpQ1VBOub+EgDbRJWmrq8_xJ-uQ@mail.gmail.com>
References: <20180817103913.52544928@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180817103913.52544928@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, rf@opensource.cirrus.com
List-Id: linux-next.vger.kernel.org

On Fri, Aug 17, 2018 at 2:40 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the mfd tree got a conflict in:
>
>   MAINTAINERS
>
> between commit:
>
>   16b7db4c8150 ("MAINTAINERS: Add .clang-format entry")
>
> from Linus' tree and commit:
>
>   97c2b5cba204 ("mfd: madera: Add register definitions for Cirrus Logic Madera codecs")
>
> from the mfd tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc MAINTAINERS
> index 041b111596bc,2c1c6aef7d74..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -3557,11 -3513,23 +3557,27 @@@ M:   Christian Benvenuti <benve@cisco.com
>   S:    Supported
>   F:    drivers/infiniband/hw/usnic/
>
>  +CLANG-FORMAT FILE
>  +M:    Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>  +S:    Maintained
>  +F:    .clang-format
>  +
> + CIRRUS LOGIC MADERA CODEC DRIVERS

To obey sorting rules, the CIRRUS LOGIC entry should be before the CLANG
entry.
Upon closer look, it should be inserted before the CISCO entries, too (in
the mfd tree).

> + M:    Charles Keepax <ckeepax@opensource.cirrus.com>
> + M:    Richard Fitzgerald <rf@opensource.cirrus.com>
> + L:    alsa-devel@alsa-project.org (moderated for non-subscribers)
> + L:    patches@opensource.cirrus.com
> + T:    git https://github.com/CirrusLogic/linux-drivers.git
> + W:    https://github.com/CirrusLogic/linux-drivers/wiki
> + S:    Supported
> + F:    Documentation/devicetree/bindings/mfd/madera.txt
> + F:    Documentation/devicetree/bindings/pinctrl/cirrus,madera-pinctrl.txt
> + F:    include/linux/mfd/madera/*
> + F:    drivers/gpio/gpio-madera*
> + F:    drivers/mfd/madera*
> + F:    drivers/mfd/cs47l*
> + F:    drivers/pinctrl/cirrus/*
> +
>   CLEANCACHE API
>   M:    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>   L:    linux-kernel@vger.kernel.org


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
