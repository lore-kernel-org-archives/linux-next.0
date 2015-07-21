From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] regulator: rk808: make better use of the gpiod API
Date: Tue, 21 Jul 2015 22:09:32 +0900
Message-ID: <CAJKOXPfY4zYtWKa6U4mzBjtS87HZepOV_hHodU2QJaJrLcr9qQ@mail.gmail.com>
References: <20150721132945.7ffc443b@canb.auug.org.au>
	<1437461993-14860-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:33498 "EHLO
	mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754645AbbGUNJd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2015 09:09:33 -0400
In-Reply-To: <1437461993-14860-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, kernel@pengutronix.de

2015-07-21 15:59 GMT+09:00 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengu=
tronix.de>:
> The gpiod functions include variants for managed gpiod resources. Use=
 it
> to simplify the remove function.
>
> As the driver handles a device node without a specification of dvs gp=
ios
> just fine, additionally use the variant of gpiod_get exactly for this
> use case. This makes error checking more strict.
>
> As a third benefit this patch makes the driver use the flags paramete=
r
> of gpiod_get* which will not be optional any more after 4.2 and so
> prevents a build failure when the respective gpiod commit is merged.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> this is the more complete fix of the issue that Stephen found while c=
reating
> next-20150721 (see commit f51ec04cf8be9f7ef795f1f39ada17c19f725650).
>
> Best regards
> Uwe
>
>  drivers/regulator/rk808-regulator.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/=
rk808-regulator.c
> index ca913fd15598..3738e49beb75 100644
> --- a/drivers/regulator/rk808-regulator.c
> +++ b/drivers/regulator/rk808-regulator.c
> @@ -94,7 +94,7 @@ static int rk808_buck1_2_get_voltage_sel_regmap(str=
uct regulator_dev *rdev)
>         unsigned int val;
>         int ret;
>
> -       if (IS_ERR(gpio) || gpiod_get_value(gpio) =3D=3D 0)
> +       if (!gpio || gpiod_get_value(gpio) =3D=3D 0)
>                 return regulator_get_voltage_sel_regmap(rdev);
>
>         ret =3D regmap_read(rdev->regmap,
> @@ -168,7 +168,7 @@ static int rk808_buck1_2_set_voltage_sel(struct r=
egulator_dev *rdev,
>         unsigned old_sel;
>         int ret, gpio_level;
>
> -       if (IS_ERR(gpio))
> +       if (!gpio)
>                 return rk808_buck1_2_i2c_set_voltage_sel(rdev, sel);
>
>         gpio_level =3D gpiod_get_value(gpio);
> @@ -205,7 +205,7 @@ static int rk808_buck1_2_set_voltage_time_sel(str=
uct regulator_dev *rdev,
>         struct gpio_desc *gpio =3D pdata->dvs_gpio[id];
>
>         /* if there is no dvs1/2 pin, we don't need wait extra time h=
ere. */
> -       if (IS_ERR(gpio))
> +       if (!gpio)
>                 return 0;
>
>         return regulator_set_voltage_time_sel(rdev, old_selector, new=
_selector);
> @@ -540,14 +540,19 @@ static int rk808_regulator_dt_parse_pdata(struc=
t device *dev,
>                 goto dt_parse_end;
>
>         for (i =3D 0; i < ARRAY_SIZE(pdata->dvs_gpio); i++) {
> -               pdata->dvs_gpio[i] =3D gpiod_get_index(client_dev, "d=
vs", i);
> +               pdata->dvs_gpio[i] =3D
> +                       devm_gpiod_get_index_optional(client_dev, "dv=
s", i,
> +                                                     GPIOD_OUT_LOW);
>                 if (IS_ERR(pdata->dvs_gpio[i])) {
> +                       dev_err(dev, "failed to get dvs%d gpio\n", i)=
;

Missing of_node_put() from of_get_child_by_name() called before.

> +                       return PTR_ERR(pdata->dvs_gpio[i]);
> +               }
> +
> +               if (!pdata->dvs_gpio[i]) {
>                         dev_warn(dev, "there is no dvs%d gpio\n", i);
>                         continue;
>                 }
>
> -               gpiod_direction_output(pdata->dvs_gpio[i], 0);
> -
>                 tmp =3D i ? RK808_DVS2_POL : RK808_DVS1_POL;
>                 ret =3D regmap_update_bits(map, RK808_IO_POL_REG, tmp=
,
>                                 gpiod_is_active_low(pdata->dvs_gpio[i=
]) ?
> @@ -561,14 +566,6 @@ dt_parse_end:
>
>  static int rk808_regulator_remove(struct platform_device *pdev)
>  {
> -       struct rk808_regulator_data *pdata =3D platform_get_drvdata(p=
dev);
> -       int i;
> -
> -       for (i =3D 0; i < ARRAY_SIZE(pdata->dvs_gpio); i++) {
> -               if (!IS_ERR(pdata->dvs_gpio[i]))
> -                       gpiod_put(pdata->dvs_gpio[i]);
> -       }
> -
>         return 0;
>  }

The function looks empty so it can be removed entirely.

Best regards,
Krzysztof
