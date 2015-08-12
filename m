From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Thu, 13 Aug 2015 01:03:05 +1000
Message-ID: <20150813010305.4e94b55b@canb.auug.org.au>
References: <20150812181045.0d290caa@canb.auug.org.au>
	<20150812082107.GT9999@pengutronix.de>
	<20150812222758.7d4e62f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44057 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753893AbbHLPDH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 11:03:07 -0400
In-Reply-To: <20150812222758.7d4e62f2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>

Hi Uwe,

On Wed, 12 Aug 2015 22:27:58 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> On Wed, 12 Aug 2015 10:21:07 +0200 Uwe Kleine-K=C3=B6nig <u.kleine-ko=
enig@pengutronix.de> wrote:
> >
> > On Wed, Aug 12, 2015 at 06:10:45PM +1000, Stephen Rothwell wrote:
> > > After merging the gpio tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > >=20
> > > drivers/extcon/extcon-palmas.c:211:25: error: too few arguments t=
o function 'devm_gpiod_get_optional'
> > >   palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "i=
d");
> > >                          ^
> > > In file included from /home/sfr/next/next/include/asm-generic/gpi=
o.h:13:0,
> > >                  from /home/sfr/next/next/include/linux/gpio.h:51=
,
> > >                  from /home/sfr/next/next/include/linux/of_gpio.h=
:20,
> > >                  from /home/sfr/next/next/include/linux/mfd/palma=
s.h:24,
> > >                  from /home/sfr/next/next/drivers/extcon/extcon-p=
almas.c:28:
> > > /home/sfr/next/next/include/linux/gpio/consumer.h:80:32: note: de=
clared here
> > >  struct gpio_desc *__must_check devm_gpiod_get_optional(struct de=
vice *dev,
> > >                                 ^
> > >=20
> > > Caused by commit
> > >=20
> > >   b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functio=
ns")
> > >=20
> > > interacting with commit
> > >=20
> > >   92b7cb5dc885 ("extcon: palmas: Support GPIO based USB ID detect=
ion")
> >
> > I don't find this commit, can you tell me though which tree this co=
mes
> > into next?
>=20
> Umm, the next line of that email said:
>=20
> "from the extcon tree."
>=20
> :-)
>=20
> That would be
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git#ex=
tcon-next
>=20
> run by Chanwoo Choi.

Sorry about that, but I hadn't pushed the linux-tree out yet ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
