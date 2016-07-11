From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: manual merge of the pwm tree with the regulator tree
Date: Mon, 11 Jul 2016 23:39:00 +0200
Message-ID: <20160711213900.GA12942@ulmo.ba.sec>
References: <20160711165648.029cb6f7@canb.auug.org.au>
 <CAD=FV=UBidDK2XN=uchV=Rr9LtYQ7m6Y6uRxe8xKhFLva6f5+w@mail.gmail.com>
 <20160711213059.GA12816@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36684 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153AbcGKVjF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jul 2016 17:39:05 -0400
Content-Disposition: inline
In-Reply-To: <20160711213059.GA12816@ulmo.ba.sec>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Courbot <acourbot@nvidia.com>


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 11:30:59PM +0200, Thierry Reding wrote:
> On Mon, Jul 11, 2016 at 09:47:34AM -0700, Doug Anderson wrote:
> > Hi,
> >=20
> > On Sun, Jul 10, 2016 at 11:56 PM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> > > Hi Thierry,
> > >
> > > Today's linux-next merge of the pwm tree got a conflict in:
> > >
> > >   drivers/regulator/pwm-regulator.c
> > >
> > > between commit:
> > >
> > >   830583004e61 ("regulator: pwm: Drop unneeded pwm_enable() call")
> > >   27bfa8893b15 ("regulator: pwm: Support for enable GPIO")
> > >   c2588393e631 ("regulator: pwm: Fix regulator ramp delay for continu=
ous mode")
> > >
> > > from the regulator tree and commit:
> > >
> > >   b0303deaa480 ("regulator: pwm: Adjust PWM config at probe time")
> > >   8bd57ca236d0 ("regulator: pwm: Switch to the atomic PWM API")
> > >   25d16595935b ("regulator: pwm: Retrieve correct voltage")
> > >   53f239af4c14 ("regulator: pwm: Support extra continuous mode cases")
> > >
> > > from the pwm tree.
> > >
> > > I fixed it up (I think, please check - see below) and can carry the f=
ix
> > > as necessary. This is now fixed as far as linux-next is concerned, but
> > > any non trivial conflicts should be mentioned to your upstream mainta=
iner
> > > when your tree is submitted for merging.  You may also want to consid=
er
> > > cooperating with the maintainer of the conflicting tree to minimise a=
ny
> > > particularly complex conflicts.
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> >=20
> > [ cut ]
> >=20
> > >  -      /* Delay required by PWM regulator to settle to the new volta=
ge */
> > >  -      usleep_range(ramp_delay, ramp_delay + 1000);
> > >  +      /* Ramp delay is in uV/uS. Adjust to uS and delay */
> > >  +      ramp_delay =3D DIV_ROUND_UP(abs(min_uV - old_uV), ramp_delay);
> >=20
> > This was what I was worried about and why I originally sent my patch
> > based upon Boris's series.  The above should be:
> >=20
> > ramp_delay =3D DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
> >=20
> > Specifically note the use of "req_min_uV" and not "min_uV".
>=20
> Okay, so this is something that needs to be fixed up in one of Boris'
> patches? Can you help point out where exactly? The conflict should be
> gone as of tomorrow's linux-next.

Looks like the below should be squashed into commit:

	4585082afab4 regulator: pwm: Support extra continuous mode cases

Can you confirm?

Thierry

--- >8 ---
diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regu=
lator.c
index 263a2d16d909..c24524242da2 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -237,7 +237,7 @@ static int pwm_regulator_set_voltage(struct regulator_d=
ev *rdev,
 		return 0;
=20
 	/* Ramp delay is in uV/uS. Adjust to uS and delay */
-	ramp_delay =3D DIV_ROUND_UP(abs(min_uV - old_uV), ramp_delay);
+	ramp_delay =3D DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
 	usleep_range(ramp_delay, ramp_delay + DIV_ROUND_UP(ramp_delay, 10));
=20
 	return 0;

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXhBH0AAoJEN0jrNd/PrOhWOUQAJNm/ZoDskPEHSXz5kqmVxSU
0JtCpzIHp66Zrv6+Slx05Q0ezQrVspsewGQ0BmuLGbO3XfsgyaYCGovY9Pvmt3gU
brwRpHjL9O9bSF2FMseWSLy47sHFNzvQZA1PvGKrPPu+mV4gP8Zt4N6jPAjMXK2p
HaqkprjnMU+4O+BcMdHz/LsYkEgESyDF/VarZzkcHj9CtMjbo1wp40nh8v3VjNVe
qEF3A4bA3Su6S87Wkkt2q2KXR9ip6ioOk5DOP8doYKlh5U7yrVYXbVUNoYpEfnFY
UkhxJ5Bq6DgnFY2V1/ltnJC59C27ZCFwW7Q0qlfWNVK/fkuu9ltmdk+aY51P0II0
vH7ku/jdBAx11YhuoHG2dVvhuS5O8RP+xYbamiOPSZubs1NunSIv8AWpNuixeP8y
l+7c6g2JkW7Q2RrjOlNXZqNaGfncDaK2eNv12vQS+m1FdKpvEMRBeavOyPoK2MnT
bGiFHOJKbFYPrkU4z54Xlq5HdHOuljgbaApL+FqTYQFkcYS/ewLrLJYNzguU1e/f
AsFz7IN1Si8I293ERZcmn1CdTQ5yHTYw2UShRnVEoh/xFAqpRQsz7VgNb9pIjjHM
n9wefUPJyC3/RyqF/GUQMZe63fKPwhFsobPhSZiLoSiTnAhwewi5rIGz308ygrND
fOmyvMXksirT2+lPDjFT
=X2hh
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
