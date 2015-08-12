From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 12 Aug 2015 10:21:07 +0200
Message-ID: <20150812082107.GT9999@pengutronix.de>
References: <20150812181045.0d290caa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:56356 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933726AbbHLIVP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 04:21:15 -0400
Content-Disposition: inline
In-Reply-To: <20150812181045.0d290caa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>

Hello Stephen,

On Wed, Aug 12, 2015 at 06:10:45PM +1000, Stephen Rothwell wrote:
> After merging the gpio tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/extcon/extcon-palmas.c:211:25: error: too few arguments to fu=
nction 'devm_gpiod_get_optional'
>   palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "id");
>                          ^
> In file included from /home/sfr/next/next/include/asm-generic/gpio.h:=
13:0,
>                  from /home/sfr/next/next/include/linux/gpio.h:51,
>                  from /home/sfr/next/next/include/linux/of_gpio.h:20,
>                  from /home/sfr/next/next/include/linux/mfd/palmas.h:=
24,
>                  from /home/sfr/next/next/drivers/extcon/extcon-palma=
s.c:28:
> /home/sfr/next/next/include/linux/gpio/consumer.h:80:32: note: declar=
ed here
>  struct gpio_desc *__must_check devm_gpiod_get_optional(struct device=
 *dev,
>                                 ^
>=20
> Caused by commit
>=20
>   b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functions")
>=20
> interacting with commit
>=20
>   92b7cb5dc885 ("extcon: palmas: Support GPIO based USB ID detection"=
)
I don't find this commit, can you tell me though which tree this comes
into next?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
