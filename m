From: Dong Aisheng <dong.aisheng@linaro.org>
Subject: Re: linux-next: manual merge of the mfd tree with Linus' tree
Date: Tue, 18 Sep 2012 15:31:29 +0800
Message-ID: <CAP1dx+yTS5mSQKKMFzXUYeOdDB2D0FNUVJ2vaGxrnOK-ZP=o8g@mail.gmail.com>
References: <20120918131904.ded0551cb03d079dc08cecbb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:35775 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932111Ab2IRHb3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Sep 2012 03:31:29 -0400
Received: by ieak13 with SMTP id k13so1829959iea.19
        for <linux-next@vger.kernel.org>; Tue, 18 Sep 2012 00:31:29 -0700 (PDT)
In-Reply-To: <20120918131904.ded0551cb03d079dc08cecbb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Axel Lin <axel.lin@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hi Stephen,

On 18 September 2012 11:19, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Samuel,
>
> Today's linux-next merge of the mfd tree got a conflict in
> drivers/regulator/anatop-regulator.c between commit 3e2a928472da
> ("regulator: anatop: Fix wrong mask used in anatop_get_voltage_sel") from
> Linus' tree and commit baa64151aecc ("regulator: anatop-regulator:
> Convert to use syscon to access anatop register") from the mfd tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc drivers/regulator/anatop-regulator.c
> index ce0fe72,596535d..0000000
> --- a/drivers/regulator/anatop-regulator.c
> +++ b/drivers/regulator/anatop-regulator.c
> @@@ -61,18 -64,17 +64,18 @@@ static int anatop_regmap_set_voltage_se
>         return 0;
>   }
>
> - static int anatop_get_voltage_sel(struct regulator_dev *reg)
> + static int anatop_regmap_get_voltage_sel(struct regulator_dev *reg)
>   {
>         struct anatop_regulator *anatop_reg = rdev_get_drvdata(reg);
>  -      u32 val;
>  +      u32 val, mask;
>
>         if (!anatop_reg->control_reg)
>                 return -ENOTSUPP;
>
> -       val = anatop_read_reg(anatop_reg->mfd, anatop_reg->control_reg);
> +       regmap_read(anatop_reg->anatop, anatop_reg->control_reg, &val);
>  -      val = (val & ((1 << anatop_reg->vol_bit_width) - 1)) >>
>  +      mask = ((1 << anatop_reg->vol_bit_width) - 1) <<
>                 anatop_reg->vol_bit_shift;
>  +      val = (val & mask) >> anatop_reg->vol_bit_shift;
>
>         return val - anatop_reg->min_bit_val;
>   }

The fix looks ok to me.

Regards
Dong Aisheng
