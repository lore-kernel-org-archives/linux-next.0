From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] regulator: rk808: make better use of the gpiod API
Date: Tue, 21 Jul 2015 16:35:24 +0200
Message-ID: <20150721143524.GD9981@pengutronix.de>
References: <20150721132945.7ffc443b@canb.auug.org.au>
 <1437461993-14860-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CAJKOXPfY4zYtWKa6U4mzBjtS87HZepOV_hHodU2QJaJrLcr9qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:46026 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753327AbbGUOfc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2015 10:35:32 -0400
Content-Disposition: inline
In-Reply-To: <CAJKOXPfY4zYtWKa6U4mzBjtS87HZepOV_hHodU2QJaJrLcr9qQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, kernel@pengutronix.de

Hello,

On Tue, Jul 21, 2015 at 10:09:32PM +0900, Krzysztof Kozlowski wrote:
> 2015-07-21 15:59 GMT+09:00 Uwe Kleine-K=F6nig <u.kleine-koenig@pengut=
ronix.de>:
> > @@ -540,14 +540,19 @@ static int rk808_regulator_dt_parse_pdata(str=
uct device *dev,
> >                 goto dt_parse_end;
> >
> >         for (i =3D 0; i < ARRAY_SIZE(pdata->dvs_gpio); i++) {
> > -               pdata->dvs_gpio[i] =3D gpiod_get_index(client_dev, =
"dvs", i);
> > +               pdata->dvs_gpio[i] =3D
> > +                       devm_gpiod_get_index_optional(client_dev, "=
dvs", i,
> > +                                                     GPIOD_OUT_LOW=
);
> >                 if (IS_ERR(pdata->dvs_gpio[i])) {
> > +                       dev_err(dev, "failed to get dvs%d gpio\n", =
i);
>=20
> Missing of_node_put() from of_get_child_by_name() called before.
Good catch, thanks.

> > @@ -561,14 +566,6 @@ dt_parse_end:
> >
> >  static int rk808_regulator_remove(struct platform_device *pdev)
> >  {
> > -       struct rk808_regulator_data *pdata =3D platform_get_drvdata=
(pdev);
> > -       int i;
> > -
> > -       for (i =3D 0; i < ARRAY_SIZE(pdata->dvs_gpio); i++) {
> > -               if (!IS_ERR(pdata->dvs_gpio[i]))
> > -                       gpiod_put(pdata->dvs_gpio[i]);
> > -       }
> > -
> >         return 0;
> >  }
>=20
> The function looks empty so it can be removed entirely.
I assumed that not having a remove function makes the device not
detachable. Not sure about that.
Looking at the code I found that not having a remove function can yield
surprises, though. If your driver has a probe but no remove function th=
e
platform bus glue calls

	dev_pm_domain_attach(_dev, true);

at probe time, but not

	dev_pm_domain_detach(_dev, true);

at remove. I admit I don't know about that dev_pm_domain stuff, but it
looks wrong to only have one but not the other. Greg?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
