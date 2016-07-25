From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: manual merge of the pwm tree with the regulator tree
Date: Mon, 25 Jul 2016 16:26:11 +0200
Message-ID: <20160725142611.GQ21170@ulmo.ba.sec>
References: <20160711165648.029cb6f7@canb.auug.org.au>
 <CAD=FV=UBidDK2XN=uchV=Rr9LtYQ7m6Y6uRxe8xKhFLva6f5+w@mail.gmail.com>
 <20160711213059.GA12816@ulmo.ba.sec>
 <20160711213900.GA12942@ulmo.ba.sec>
 <20160725082906.GA4667@ulmo.ba.sec>
 <CAD=FV=Ufs+NBgSmMeJNUwGUnJZOC1Tvpt6PvSCQLAkxxLULhUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8HhMLSHvAouSipEr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=Ufs+NBgSmMeJNUwGUnJZOC1Tvpt6PvSCQLAkxxLULhUA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-next.vger.kernel.org


--8HhMLSHvAouSipEr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 06:29:00AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Mon, Jul 25, 2016 at 1:29 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Mon, Jul 11, 2016 at 11:39:00PM +0200, Thierry Reding wrote:
> >> On Mon, Jul 11, 2016 at 11:30:59PM +0200, Thierry Reding wrote:
> >> > On Mon, Jul 11, 2016 at 09:47:34AM -0700, Doug Anderson wrote:
> >> > > Hi,
> >> > >
> >> > > On Sun, Jul 10, 2016 at 11:56 PM, Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> >> > > > Hi Thierry,
> >> > > >
> >> > > > Today's linux-next merge of the pwm tree got a conflict in:
> >> > > >
> >> > > >   drivers/regulator/pwm-regulator.c
> >> > > >
> >> > > > between commit:
> >> > > >
> >> > > >   830583004e61 ("regulator: pwm: Drop unneeded pwm_enable() call=
")
> >> > > >   27bfa8893b15 ("regulator: pwm: Support for enable GPIO")
> >> > > >   c2588393e631 ("regulator: pwm: Fix regulator ramp delay for co=
ntinuous mode")
> >> > > >
> >> > > > from the regulator tree and commit:
> >> > > >
> >> > > >   b0303deaa480 ("regulator: pwm: Adjust PWM config at probe time=
")
> >> > > >   8bd57ca236d0 ("regulator: pwm: Switch to the atomic PWM API")
> >> > > >   25d16595935b ("regulator: pwm: Retrieve correct voltage")
> >> > > >   53f239af4c14 ("regulator: pwm: Support extra continuous mode c=
ases")
> >> > > >
> >> > > > from the pwm tree.
> >> > > >
> >> > > > I fixed it up (I think, please check - see below) and can carry =
the fix
> >> > > > as necessary. This is now fixed as far as linux-next is concerne=
d, but
> >> > > > any non trivial conflicts should be mentioned to your upstream m=
aintainer
> >> > > > when your tree is submitted for merging.  You may also want to c=
onsider
> >> > > > cooperating with the maintainer of the conflicting tree to minim=
ise any
> >> > > > particularly complex conflicts.
> >> > > >
> >> > > > --
> >> > > > Cheers,
> >> > > > Stephen Rothwell
> >> > >
> >> > > [ cut ]
> >> > >
> >> > > >  -      /* Delay required by PWM regulator to settle to the new =
voltage */
> >> > > >  -      usleep_range(ramp_delay, ramp_delay + 1000);
> >> > > >  +      /* Ramp delay is in uV/uS. Adjust to uS and delay */
> >> > > >  +      ramp_delay =3D DIV_ROUND_UP(abs(min_uV - old_uV), ramp_d=
elay);
> >> > >
> >> > > This was what I was worried about and why I originally sent my pat=
ch
> >> > > based upon Boris's series.  The above should be:
> >> > >
> >> > > ramp_delay =3D DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
> >> > >
> >> > > Specifically note the use of "req_min_uV" and not "min_uV".
> >> >
> >> > Okay, so this is something that needs to be fixed up in one of Boris'
> >> > patches? Can you help point out where exactly? The conflict should be
> >> > gone as of tomorrow's linux-next.
> >>
> >> Looks like the below should be squashed into commit:
> >>
> >>       4585082afab4 regulator: pwm: Support extra continuous mode cases
> >>
> >> Can you confirm?
> >>
> >> Thierry
> >>
> >> --- >8 ---
> >> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm=
-regulator.c
> >> index 263a2d16d909..c24524242da2 100644
> >> --- a/drivers/regulator/pwm-regulator.c
> >> +++ b/drivers/regulator/pwm-regulator.c
> >> @@ -237,7 +237,7 @@ static int pwm_regulator_set_voltage(struct regula=
tor_dev *rdev,
> >>               return 0;
> >>
> >>       /* Ramp delay is in uV/uS. Adjust to uS and delay */
> >> -     ramp_delay =3D DIV_ROUND_UP(abs(min_uV - old_uV), ramp_delay);
> >> +     ramp_delay =3D DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay=
);
> >>       usleep_range(ramp_delay, ramp_delay + DIV_ROUND_UP(ramp_delay, 1=
0));
> >>
> >>       return 0;
> >
> > Doug? Can you confirm?
>=20
> Yes, right.  Sorry, previous email got lost in the shuffle since I was
> on vacation.
>=20
> Right, commit 4585082afab4 ("regulator: pwm: Support extra continuous
> mode cases") is the one that renamed the parameters and so this use of
> one of the parameters needs to be part of that commit.

Squashed it into the above commit and pushed everything out.

Thanks,
Thierry

--8HhMLSHvAouSipEr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXliGDAAoJEN0jrNd/PrOhpZcQAJZzkoM00c1z8yTMUUQlbWpq
DyiWudzp7PQBFucasoP3HwHl7H5OmCFgnebEVrrT2f/5at5yGtmcYAoQQ5E9cq8m
0ffml0oH58iLtArgTCJzOoatJBAQfzYohOnKZa5GW/IUmyM1FsZvn/RWPWuC3fUn
jbDWkYHYWHwiT6VbHOL3gbWR+bAKNa47lEhcalb00Sfcb5dtTIljN2kx2sjvLmq0
g5MUzu3Bk/VLOqRoumEO6PYNmZ42rGlGVpMJ3o86SSI1Rx1VAOx52mnwNRbUhloa
3p4Ig2FKps3ETlZERqqEn03Ri/iS9qO3RMMl3O4M+zPWzWBXW1Ea8YNDO4/AikpP
xZAyza/+pqbuICqkhAkiJ5zSW174o4B5YuEzuYZxLNZrQa2iTIrppiSQIoqYv3Xz
uEnIsXdRGqG7PN7ICAXgMTABhuTcjinJL+i0MpxzxHw8Ybvtm6iXCjdOexlNiCFH
YO/L4mZ8GtxaH+KcPMO9FTHQFVQMmqBFvhvsdMHG9IJC6wRLrD1XKQN/GsF6ZNAZ
uNZzNwjPKqrmaLqU73xmYdCYppzxLmIXled2ndl+aaxng/o5Dh4L+DuEdSAYsGUf
kTplv0jesgHi6fXWT90B/dkikATkHZco8Jrq5byM4gs6yGajvIk+7aBt0g+iUh7V
pU9dF1grbx/ObQ7BsAey
=vGpM
-----END PGP SIGNATURE-----

--8HhMLSHvAouSipEr--
