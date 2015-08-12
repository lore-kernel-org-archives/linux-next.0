From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Thu, 13 Aug 2015 09:02:48 +1000
Message-ID: <20150813090248.5fa3441f@canb.auug.org.au>
References: <20150812181045.0d290caa@canb.auug.org.au>
	<20150812201642.GW9999@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60721 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750811AbbHLXCu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 19:02:50 -0400
In-Reply-To: <20150812201642.GW9999@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>

Hi Uwe,

On Wed, 12 Aug 2015 22:16:42 +0200 Uwe Kleine-K=C3=B6nig <u.kleine-koen=
ig@pengutronix.de> wrote:
>
> On Wed, Aug 12, 2015 at 06:10:45PM +1000, Stephen Rothwell wrote:
> > After merging the gpio tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >=20
> > drivers/extcon/extcon-palmas.c:211:25: error: too few arguments to =
function 'devm_gpiod_get_optional'
> >   palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "id"=
);
> >                          ^
> > In file included from /home/sfr/next/next/include/asm-generic/gpio.=
h:13:0,
> >                  from /home/sfr/next/next/include/linux/gpio.h:51,
> >                  from /home/sfr/next/next/include/linux/of_gpio.h:2=
0,
> >                  from /home/sfr/next/next/include/linux/mfd/palmas.=
h:24,
> >                  from /home/sfr/next/next/drivers/extcon/extcon-pal=
mas.c:28:
> > /home/sfr/next/next/include/linux/gpio/consumer.h:80:32: note: decl=
ared here
> >  struct gpio_desc *__must_check devm_gpiod_get_optional(struct devi=
ce *dev,
> >                                 ^
> >=20
> > Caused by commit
> >=20
> >   b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functions=
")
> >=20
> > interacting with commit
> >=20
> >   92b7cb5dc885 ("extcon: palmas: Support GPIO based USB ID detectio=
n")
> that commit is not correct. After
>=20
> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "id");
>=20
> it does
>=20
> 	palmas_usb->gpio_id_irq =3D gpiod_to_irq(palmas_usb->id_gpiod);
>=20
> without setting the gpio to input. So the right fix is not to add
> GPIOD_ASIS but GPIOD_IN.

OK, I have fixed my merge fix patch, but can you submit a correct patch
to the extcon tree maintainer, please?  I assume it can be fixed in
that tree right now, right?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
