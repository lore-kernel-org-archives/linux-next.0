From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: manual merge of the pwm tree with the regulator tree
Date: Mon, 11 Jul 2016 23:30:59 +0200
Message-ID: <20160711213059.GA12816@ulmo.ba.sec>
References: <20160711165648.029cb6f7@canb.auug.org.au>
 <CAD=FV=UBidDK2XN=uchV=Rr9LtYQ7m6Y6uRxe8xKhFLva6f5+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=UBidDK2XN=uchV=Rr9LtYQ7m6Y6uRxe8xKhFLva6f5+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-next.vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 09:47:34AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Sun, Jul 10, 2016 at 11:56 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> > Hi Thierry,
> >
> > Today's linux-next merge of the pwm tree got a conflict in:
> >
> >   drivers/regulator/pwm-regulator.c
> >
> > between commit:
> >
> >   830583004e61 ("regulator: pwm: Drop unneeded pwm_enable() call")
> >   27bfa8893b15 ("regulator: pwm: Support for enable GPIO")
> >   c2588393e631 ("regulator: pwm: Fix regulator ramp delay for continuou=
s mode")
> >
> > from the regulator tree and commit:
> >
> >   b0303deaa480 ("regulator: pwm: Adjust PWM config at probe time")
> >   8bd57ca236d0 ("regulator: pwm: Switch to the atomic PWM API")
> >   25d16595935b ("regulator: pwm: Retrieve correct voltage")
> >   53f239af4c14 ("regulator: pwm: Support extra continuous mode cases")
> >
> > from the pwm tree.
> >
> > I fixed it up (I think, please check - see below) and can carry the fix
> > as necessary. This is now fixed as far as linux-next is concerned, but
> > any non trivial conflicts should be mentioned to your upstream maintain=
er
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
>=20
> [ cut ]
>=20
> >  -      /* Delay required by PWM regulator to settle to the new voltage=
 */
> >  -      usleep_range(ramp_delay, ramp_delay + 1000);
> >  +      /* Ramp delay is in uV/uS. Adjust to uS and delay */
> >  +      ramp_delay =3D DIV_ROUND_UP(abs(min_uV - old_uV), ramp_delay);
>=20
> This was what I was worried about and why I originally sent my patch
> based upon Boris's series.  The above should be:
>=20
> ramp_delay =3D DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
>=20
> Specifically note the use of "req_min_uV" and not "min_uV".

Okay, so this is something that needs to be fixed up in one of Boris'
patches? Can you help point out where exactly? The conflict should be
gone as of tomorrow's linux-next.

Thierry

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXhBAQAAoJEN0jrNd/PrOh6fwP/31ZNOPLuEVfSNvgmuJa/14B
LnezJKQZpMmaSEVsxy7n+FS9wV2m9m/ciPBY/Y9Oc6cTMN7EFkA+9E3SRLtk70GA
ryGhnfpem56yWWWMoNAMBpCw57rZ/B02bpzV4Qdyx+bxmveaTCI4hO8LiYFISCdC
XDGoJx356GujEPkC+KijujRYvLIUMrFIlHuj6jM9mXSFzgkWBn2RxnNhKd3EQiz1
fK55jgXV+OvmP8KpQSqI3sUZ2E3DiJlzrKGlcq2SCbfKutg9GlGWPXRZyJTow6iP
w9/go+Qe0VXknj9NXQkxrUJP7cUCEp9sReLXyrq9DozHo65ySfh8mu61dulxCr3k
PjUxjGRxZG+3FHLNbhIf0iwv8O17lauJ4zNZDJRpgZCmHVICEGz7qQdBpu0ggO2r
Gk3DE4N1blmjz/vwgJS1GgsNW9bDBpas/ik8ac0qWCi8s0USJxokJa47X6qwW4RW
4BTcsIqedIa39GtekvNdAVd0I5GKRNRBFG8pwJB+3V9B5rDkl8pDt1fucs2UBKIp
Y3E7xLEbSrFzzEAWr2CEONTm/3TFEpXD0bgyo56oaGxYfryB/XKiQXqVv5zXQ1IB
2/6kjG11gyOT+Liy4RF/Rf20AmRRTgj4ADTAXnZsjqz3++IfqdrfBkoH8SuvglRJ
ux7ox7SwIJaTgvQIiVJh
=j7S/
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
