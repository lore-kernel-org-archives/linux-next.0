From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: linux-next: Fixes tag needs some work in the sunxi tree
Date: Thu, 7 Feb 2019 16:55:49 +0100
Message-ID: <20190207155549.pdxy36rl4bomoyp7@flea>
References: <20190208005042.6b353e17@canb.auug.org.au>
 <CAGb2v650UCEXbEnNPTiPPSn_5Tznso4gg5W23P9K8Y7f_pAqxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k7mwlffbqscvi2cl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v650UCEXbEnNPTiPPSn_5Tznso4gg5W23P9K8Y7f_pAqxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--k7mwlffbqscvi2cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 09:53:22PM +0800, Chen-Yu Tsai wrote:
> On Thu, Feb 7, 2019 at 9:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > Hi all,
> >
> > In commit
> >
> >   df0aeb208b24 ("ARM: dts: sun9i: a80-optimus: Add node for AXP809's un=
used dc1sw regulator")
> >
> > Fixes tag
> >
> >   Fixes: aa4a27bc819e ("ARM: dts: sun9i: a80-optimus: Add AXP809 PMIC
> >
> > has these problem(s):
> >
> >   - Subject has leading but no trailing parentheses
> >   - Subject has leading but no trailing quotes
> >
> > Please don't wrap the Fixes tag over more than one line.
>=20
> Right. I forgot to update the messages from these I made in the past.
>=20
> Maxime, can you fix it up?

It should be done now, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--k7mwlffbqscvi2cl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXFxVBQAKCRDj7w1vZxhR
xemuAP9co9fA5IJGgwimfLW+JN9WBOab4glj5YCJND/gfhycAQD/ZhpBDHgqxG0H
T4NUk5xDp3haclYWDNGEboBPIRZ0kAo=
=kQoO
-----END PGP SIGNATURE-----

--k7mwlffbqscvi2cl--
