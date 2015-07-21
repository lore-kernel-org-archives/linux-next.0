From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] regulator: rk808: make better use of the gpiod API
Date: Tue, 21 Jul 2015 11:56:49 +0200
Message-ID: <CACRpkda5DrDx77514uBT+3-8svcRWQ9vONA6Dg39F5ZNPHz3rA@mail.gmail.com>
References: <20150721132945.7ffc443b@canb.auug.org.au>
	<1437461993-14860-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437461993-14860-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Zhong <zyw@rock-chips.com>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 21, 2015 at 8:59 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Mark, please apply this.

Yours,
Linus Walleij
