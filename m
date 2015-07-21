From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: rk808: make better use of the gpiod API
Date: Tue, 21 Jul 2015 15:41:00 +0100
Message-ID: <20150721144100.GU11162@sirena.org.uk>
References: <20150721132945.7ffc443b@canb.auug.org.au>
 <1437461993-14860-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CAJKOXPfY4zYtWKa6U4mzBjtS87HZepOV_hHodU2QJaJrLcr9qQ@mail.gmail.com>
 <20150721143524.GD9981@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cq6xAZHFTWWzDscG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33322 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755204AbbGUOlR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2015 10:41:17 -0400
Content-Disposition: inline
In-Reply-To: <20150721143524.GD9981@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, kernel@pengutronix.de


--cq6xAZHFTWWzDscG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2015 at 04:35:24PM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, Jul 21, 2015 at 10:09:32PM +0900, Krzysztof Kozlowski wrote:

> > The function looks empty so it can be removed entirely.

> I assumed that not having a remove function makes the device not
> detachable. Not sure about that.

No, of course not - the remove function is completely optional.

> Looking at the code I found that not having a remove function can yield
> surprises, though. If your driver has a probe but no remove function the
> platform bus glue calls

> 	dev_pm_domain_attach(_dev, true);

> at probe time, but not

> 	dev_pm_domain_detach(_dev, true);

> at remove. I admit I don't know about that dev_pm_domain stuff, but it
> looks wrong to only have one but not the other. Greg?

That looks like a bug, yes.

--cq6xAZHFTWWzDscG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVrln7AAoJECTWi3JdVIfQ+YUH/18diB1zh8nx1T9jbgo65NBH
PK8Ga9/9nEoCEw7WMzlITp0ean6sdc7rgqRLmKrT5OMf1xkRYUy0MtbYjzDVp9ca
tD9uK3QAEZRoNBzlvi2Tf9DXEhUyuZALo3Pi8xlJaw8XZvtmuGvJ9NRmMXzLNN94
uXhZHx5WNTOFv5m6f+NUEC75vI3Zg3yUUWjh3ItaxsmdSISdUyDhYkIQ2OULxZcJ
da6gyhvJh5F8wDf+3JUBE2gz1SS7B5xvM5FachYDsgGrrcEEam75iXEC9DMjIUCp
mDFTB3woIV5/JQNa725GkuGZVFpFYGtNKwogFz275Tc5YnaRWS9ZCIOwNvPSDZ0=
=yWLC
-----END PGP SIGNATURE-----

--cq6xAZHFTWWzDscG--
