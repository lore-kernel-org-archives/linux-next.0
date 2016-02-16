From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the gpio tree with the pinctrl tree
Date: Tue, 16 Feb 2016 09:23:48 +0100
Message-ID: <CAMuHMdW2CVgzX0vvjdrLq4bFwcUvJto_a6JPfXP_NG=VGDoqjw@mail.gmail.com>
References: <20160216143728.61372efa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:33626 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752682AbcBPIXs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2016 03:23:48 -0500
In-Reply-To: <20160216143728.61372efa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Adamski <krzysztof.adamski@tieto.com>

Hi Stephen,

On Tue, Feb 16, 2016 at 4:37 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the gpio tree got a conflict in:
>
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c
>
> between commit:
>
>   be2d107f4433 ("pinctrl: sunxi: Use pin number when calling sunxi_pmx_set")
>
> from the pinctrl tree and commit:
>
>   6cee3821e4e4 ("gpio/pinctrl: sunxi: stop poking around in private vars")
>
> from the gpio tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 96f64a104a62,3e95bfe66a06..000000000000
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@@ -457,9 -457,8 +457,9 @@@ static int sunxi_pinctrl_gpio_get(struc
>         struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
>         u32 reg = sunxi_data_reg(offset);
>         u8 index = sunxi_data_offset(offset);
> -       u32 set_mux = pctl->desc->irq_read_needs_mux &&
> -                       test_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
> +       bool set_mux = pctl->desc->irq_read_needs_mux &&
> +               gpiochip_line_is_irq(chip, offset);
>  +      u32 pin = offset + chip->base;
>         u32 val;
>
>         if (set_mux)

That resolution looks correct to me, but doesn't match your end result
in next-20160216:

        u32 set_mux = pctl->desc->irq_read_needs_mux &&
                        test_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
        u32 pin = offset + chip->base;

I think the end result should be:

        bool set_mux = pctl->desc->irq_read_needs_mux &&
                gpiochip_line_is_irq(chip, offset);
        u32 pin = offset + chip->base;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
