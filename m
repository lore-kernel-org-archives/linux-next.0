From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 12 Aug 2015 22:27:58 +1000
Message-ID: <20150812222758.7d4e62f2@canb.auug.org.au>
References: <20150812181045.0d290caa@canb.auug.org.au>
	<20150812082107.GT9999@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150812082107.GT9999@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: linux-next.vger.kernel.org

Hi Uwe,

On Wed, 12 Aug 2015 10:21:07 +0200 Uwe Kleine-K=C3=B6nig <u.kleine-koen=
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
>
> I don't find this commit, can you tell me though which tree this come=
s
> into next?

Umm, the next line of that email said:

"from the extcon tree."

:-)

That would be

  git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git#extc=
on-next

run by Chanwoo Choi.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
