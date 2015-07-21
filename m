From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] regulator: rk808: make better use of the gpiod API
Date: Tue, 21 Jul 2015 16:21:49 +0200
Message-ID: <20150721142149.GC9981@pengutronix.de>
References: <20150721132945.7ffc443b@canb.auug.org.au>
 <1437461993-14860-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkda5DrDx77514uBT+3-8svcRWQ9vONA6Dg39F5ZNPHz3rA@mail.gmail.com>
 <20150721110415.GS11162@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:45427 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932226AbbGUOV5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2015 10:21:57 -0400
Content-Disposition: inline
In-Reply-To: <20150721110415.GS11162@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, kernel@pengutronix.de, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Tue, Jul 21, 2015 at 12:04:15PM +0100, Mark Brown wrote:
> On Tue, Jul 21, 2015 at 11:56:49AM +0200, Linus Walleij wrote:
> > On Tue, Jul 21, 2015 at 8:59 AM, Uwe Kleine-K=F6nig
>=20
> > > The gpiod functions include variants for managed gpiod resources.=
 Use it
> > > to simplify the remove function.
>=20
> > > As the driver handles a device node without a specification of dv=
s gpios
> > > just fine, additionally use the variant of gpiod_get exactly for =
this
> > > use case. This makes error checking more strict.
>=20
> > > As a third benefit this patch makes the driver use the flags para=
meter
> > > of gpiod_get* which will not be optional any more after 4.2 and s=
o
> > > prevents a build failure when the respective gpiod commit is merg=
ed.
>=20
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >=20
> > Mark, please apply this.
>=20
> ...and reverted since it doesn't build as it's adding a use of a new =
API
> which doesn't actually exist in Linus' tree yet (hopefully it's in
> -next).  I need a tag to pull if I'm going to use this patch.
If you're refering to the build bot warning I got, too, then the proble=
m
is just a missing #include and the problem existed already before e.g.
for gpiod_get_value with the .config used by the build bot.

In reply to this mail I'll send a fixup patch for the missing include
and a reworked version of my patch that fixes the reference leak pointe=
d
out by Krzysztof Kozlowski.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
