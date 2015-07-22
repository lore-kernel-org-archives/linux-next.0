From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] regulator: rk808: make better use of the gpiod API
Date: Wed, 22 Jul 2015 11:21:39 +0900
Message-ID: <CAJKOXPeREmAhrdxJAR4_Pn6ZzYEk8uR_dMCvxLXbBn+bfVQVPQ@mail.gmail.com>
References: <20150721142149.GC9981@pengutronix.de>
	<1437489985-1362-1-git-send-email-uwe@kleine-koenig.org>
	<1437489985-1362-2-git-send-email-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:34766 "EHLO
	mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754965AbbGVCVj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2015 22:21:39 -0400
In-Reply-To: <1437489985-1362-2-git-send-email-uwe@kleine-koenig.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Chris Zhong <zyw@rock-chips.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de

2015-07-21 23:46 GMT+09:00 Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org=
>:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
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
> note the above mentioned gpiod change is already in next, so the driv=
er
> fails to build there.
>
> Changes since (implicit) v1, sent with
> Message-Id: 1437461993-14860-1-git-send-email-u.kleine-koenig@pengutr=
onix.de:
>
>  - Assert that of_node_put is called in error path to not leak a refe=
rence
>    and drop now empty remove callback.
>    Thanks to Krzysztof Kozlowski for catching.
>
>
> Best regards
> Uwe
>  drivers/regulator/rk808-regulator.c | 32 ++++++++++++---------------=
-----
>  1 file changed, 12 insertions(+), 20 deletions(-)

Looks good now:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
