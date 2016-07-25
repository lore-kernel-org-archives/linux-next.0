From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: manual merge of the pwm tree with the regulator tree
Date: Mon, 25 Jul 2016 10:29:06 +0200
Message-ID: <20160725082906.GA4667@ulmo.ba.sec>
References: <20160711165648.029cb6f7@canb.auug.org.au>
 <CAD=FV=UBidDK2XN=uchV=Rr9LtYQ7m6Y6uRxe8xKhFLva6f5+w@mail.gmail.com>
 <20160711213059.GA12816@ulmo.ba.sec>
 <20160711213900.GA12942@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34570 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752433AbcGYI3M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2016 04:29:12 -0400
Content-Disposition: inline
In-Reply-To: <20160711213900.GA12942@ulmo.ba.sec>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Courbot <acourbot@nvidia.com>


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 11:39:00PM +0200, Thierry Reding wrote:
> On Mon, Jul 11, 2016 at 11:30:59PM +0200, Thierry Reding wrote:
> > On Mon, Jul 11, 2016 at 09:47:34AM -0700, Doug Anderson wrote:
> > > Hi,
> > >=20
> > > On Sun, Jul 10, 2016 at 11:56 PM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
> > > > Hi Thierry,
> > > >
> > > > Today's linux-next merge of the pwm tree got a conflict in:
> > > >
> > > >   drivers/regulator/pwm-regulator.c
> > > >
> > > > between commit:
> > > >
> > > >   830583004e61 ("regulator: pwm: Drop unneeded pwm_enable() call")
> > > >   27bfa8893b15 ("regulator: pwm: Support for enable GPIO")
> > > >   c2588393e631 ("regulator: pwm: Fix regulator ramp delay for conti=
nuous mode")
> > > >
> > > > from the regulator tree and commit:
> > > >
> > > >   b0303deaa480 ("regulator: pwm: Adjust PWM config at probe time")
> > > >   8bd57ca236d0 ("regulator: pwm: Switch to the atomic PWM API")
> > > >   25d16595935b ("regulator: pwm: Retrieve correct voltage")
> > > >   53f239af4c14 ("regulator: pwm: Support extra continuous mode case=
s")
> > > >
> > > > from the pwm tree.
> > > >
> > > > I fixed it up (I think, please check - see below) and can carry the=
 fix
> > > > as necessary. This is now fixed as far as linux-next is concerned, =
but
> > > > any non trivial conflicts should be mentioned to your upstream main=
tainer
> > > > when your tree is submitted for merging.  You may also want to cons=
ider
> > > > cooperating with the maintainer of the conflicting tree to minimise=
 any
> > > > particularly complex conflicts.
> > > >
> > > > --
> > > > Cheers,
> > > > Stephen Rothwell
> > >=20
> > > [ cut ]
> > >=20
> > > >  -      /* Delay required by PWM regulator to settle to the new vol=
tage */
> > > >  -      usleep_range(ramp_delay, ramp_delay + 1000);
> > > >  +      /* Ramp delay is in uV/uS. Adjust to uS and delay */
> > > >  +      ramp_delay =3D DIV_ROUND_UP(abs(min_uV - old_uV), ramp_dela=
y);
> > >=20
> > > This was what I was worried about and why I originally sent my patch
> > > based upon Boris's series.  The above should be:
> > >=20
> > > ramp_delay =3D DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
> > >=20
> > > Specifically note the use of "req_min_uV" and not "min_uV".
> >=20
> > Okay, so this is something that needs to be fixed up in one of Boris'
> > patches? Can you help point out where exactly? The conflict should be
> > gone as of tomorrow's linux-next.
>=20
> Looks like the below should be squashed into commit:
>=20
> 	4585082afab4 regulator: pwm: Support extra continuous mode cases
>=20
> Can you confirm?
>=20
> Thierry
>=20
> --- >8 ---
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-re=
gulator.c
> index 263a2d16d909..c24524242da2 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -237,7 +237,7 @@ static int pwm_regulator_set_voltage(struct regulator=
_dev *rdev,
>  		return 0;
> =20
>  	/* Ramp delay is in uV/uS. Adjust to uS and delay */
> -	ramp_delay =3D DIV_ROUND_UP(abs(min_uV - old_uV), ramp_delay);
> +	ramp_delay =3D DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
>  	usleep_range(ramp_delay, ramp_delay + DIV_ROUND_UP(ramp_delay, 10));
> =20
>  	return 0;

Doug? Can you confirm?

Thierry

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlc3PAAoJEN0jrNd/PrOhsGIP/AsRzDnQB4+1FeCP/+HnyW/i
v9gyxNpTX4omPd/O6eUjqKhT2fIHeUxdHaolGsR5ZTexdgPFByYwaHjHy/1/HfuK
7VPvuIzLrr4MutIC8C0/U+dK89zUNz5dJIUAHIMBd0i7UtlTciD8csb1XGAcIG+A
Cj1gWEnD/JLAzf78I5+h66FoeYrjWgQB0UVrOKGkZbc2T4e1lO06+EEBeADm/z6u
HBRB8WJ8licQjXgUCHyMI5JODfRexm2ScfB/NEz4ENnU88hnkVd2BVQRVAmQ3K/R
LMiXYiUFozHhYWDqCMqbNcYubtGMUR5e2eqHbk70nT7K8OqZS/+N3uPPWKioP6o/
o3C3fpFb5H3XAR1Eg87aP95sYIJOIW9YcoXLVnmCNJwxApKuaKCcz2BqUC9fsom3
lKJfvuFZXmOcL29Kd03HVm+IJhlMl9EvqEA/HTPL6IeMSUgmmkhiBjm9mPuxJP/p
SnBjBT69zefKZpC+O9hHqevxdWt+p1nC9x/0ub5t68YGQGLcwZkrF7SJKD6LaX/y
PykYsLL+HUn56A4SqARmg6PwbNKhCf+7RrgixY57bx6WvH5Wd70EElrVU6/z97CQ
ZW2Dzhdy6jWHzZUbnyNGTa+DiCi9cAzjukVYq8s4uEDeZhRwG582RHNZ3apxNqjS
hVSs7dMHqPreITAis0Vb
=ZKPo
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
