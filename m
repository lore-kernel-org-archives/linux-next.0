From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: linux-next: build failure after merge of the final tree (pwm
 tree related)
Date: Tue, 3 Jul 2012 13:14:26 +0200
Message-ID: <20120703111426.GA26468@avionic-0098.mockup.avionic-design.de>
References: <20120629174826.546cc991459b12833f2aaebd@canb.auug.org.au>
 <201207030859.11975.arnd.bergmann@linaro.org>
 <20120703100049.GA8455@avionic-0098.mockup.avionic-design.de>
 <201207031106.42915.arnd.bergmann@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:59288 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754256Ab2GCLPG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jul 2012 07:15:06 -0400
Content-Disposition: inline
In-Reply-To: <201207031106.42915.arnd.bergmann@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd.bergmann@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2012 at 11:06:42AM +0000, Arnd Bergmann wrote:
> On Tuesday 03 July 2012, Thierry Reding wrote:
> >   Show Details
> >   On Tue, Jul 03, 2012 at 08:59:11AM +0000, Arnd Bergmann wrote:
> > > On Tuesday 03 July 2012, Thierry Reding wrote:
> > > > I came up with the attached patch. What do you think? It fixes the
> > > > PowerPC allyesconfig issue for me.
> > >=20
> > > This one looks correct, but I would still do it the other way around,
> > > putting the depends statements into the locations of the other driver=
s.
> > > The main difference is that we can then independently convert the
> > > remaining drivers, without having merge conflicts in the same line
> > > every time we remove one of the dependencies.
> >=20
> > The downside of that approach, however, is to make PWM override other
> > settings. For instance if you have TWL6030_PWM selected and then decide
> > to also select PWM, then the former will be automatically deselected to
> > satisfy the dependency. I'm not sure if that's desired.
>=20
> It's true that this may be confusing, but I think it's the right
> approach for future multiplatform kernels. If we have e.g. a combined
> omap+ux500+imx kernel, we can only have one implementation of the
> PWM interfaces, and that should be the new one.

It will certainly be an incentive to port other PWM implementations to
the new framework.

> It's less clear for the other architectures. Maybe a mixed approach
> is better there, making CONFIG_PWM depend on !MACH_JZ4740 &&
> !PUV3_NB0916 && !BLACKFIN, but letting the remaining ARM versions
> of the PWM code depend on !PWM.

Yes, that would certainly be less confusing if somebody wants to build
with e.g. JZ4740 support because Kconfig will then disable the new PWM
instead of the other way around. Then again, maybe that's exactly the
opposite of what we want.

Also note that I already ported the blackfin PWM driver.

Thierry

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP8tQSAAoJEN0jrNd/PrOhGh8P/RUK2nTvwK7HOb1qr8q4gYKl
6+hPAKz9mMnvIH25J2Z7ALrCZjjCfsPPJd3EVTTs/8yhWWEMKAUxACgKKgxhmPL9
ZA6xVo5MtARyYQj6TFemW4aeRdIWFIMHtdz245AcxTO6xPnRxnsf5drUlrrhiL4/
RlDNI0Z7FV3HZrSkjRKd/MG0AfbvKVvCnN8QiDL0P3HfdPhAayixOJAFJKfikPed
7buUqXBZo4dQydyZrMPrGUjV1i6xUGnwZ4FZpZw/kYYVMeIQZ89iAeTtFnXsx57d
O5ln+p7ZIQ7jwbnhkJ5fUoXDEzFK4pOYyvMRaJXJQiRpc3bA2dYpENedgi4V90bo
g/hrnz250AnE+uOAdjlzuNSRHYlol4wgXDYdTppj8q6DFHAB7Lek7x64oGvKoytc
R6+HQuhHPh85Y68lNP2TmJcEw+dppafVJ76oGYVYhbS9uWg9sEyl7FFBRFVX0s5p
PuR7jKasgTNBoMWmFjD4ECMWK8xcfraYI633PUM7PzSDtfh89G0CQu1LiM1IN/Hz
owJFOsQNX2gmdeZIsIZMG8KCMGjNUSi6kJtld0N+zIqlpXAGHz2l4yKpHySLNIJD
D8GA3V09xm5jfOpBSgcr9rYWmxftNrlQXKIrq7SjRLo/H/GatsE8xYefN3L+eCu9
TDr4XYJxA3BI1kKSTi+K
=nCDs
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
