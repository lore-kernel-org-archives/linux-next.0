From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Fri, 15 Jul 2016 21:32:54 +0900
Message-ID: <20160715123253.GB2620@tetsubishi>
References: <20160715121723.0f21f148@canb.auug.org.au>
 <20160715122853.2474113b@canb.auug.org.au>
 <2993186.kRkeiY7GfT@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2993186.kRkeiY7GfT@vostro.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-next.vger.kernel.org


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 02:19:28PM +0200, Rafael J. Wysocki wrote:
> On Friday, July 15, 2016 12:28:53 PM Stephen Rothwell wrote:
> > Hi all,
> >=20
> > On Fri, 15 Jul 2016 12:17:23 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >
> > > I fixed it up (I think, but it needs more work - see below) and can
> >=20
> > For a start, it generates this warning, now:
> >=20
> > drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined b=
ut not used [-Wunused-function]
> > static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
> >                    ^
>=20
> OK, thanks for the heads-up.

Yes, thanks!

>=20
> Wolfram, what about if I exposed my "acpi-tables" branch for you to pull?
>=20
> You could resolve this in your tree then.

I can pull it in, sure. For the fixup, I'd like a commitment from one of
the ACPI experts (Jarkko, Mika, Andy), though. Otherwise I'd need to
revert given that we are quite late in the cycle already.


--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXiNf1AAoJEBQN5MwUoCm2i58P/2dxl9bwL6qseyDio59ObSWo
NzX7FhmXWgKjd0NRGMhHy/TkXES/OM6QJTjKQBPIMRPTS6JoX1KzFGYyE3b+i4n4
OgewmqnPPpqad4h+7m/g5aAQRNHOhmiyMT1kWFVIjMmIBhgdxI3OT8mb67PAm/EG
pQkS8x46iwoaJC+aPfRI76C1cYPbvH7TGYpM4SjC9Rklf84lDm2Df8zCo+xGXU8T
6yk0an6/Dcqp5ms+5hjM04LIaz6L4cqBWC6BIpku5bR7Jguq9Dg7rljhVgOuJ9i/
pVEoVsVpgSMpkNJvT4H4nCOMXane15cebdcUxWKOB7SU5RV8cWgW8KhWus8hxeN0
nqDYkuUnR64p9J0o+cE7pUPP/UQS75in9lCx++5MAw+A04sXpmmsFW0k0+TeI4up
hCU/EZAgIpoUzi46NEfNE0I7euSCKrQPcIUpHEIDgixUj1z2XlaBAvwbhPbiDnac
iVYhKu6PGN9q1WaUNzmMv+uZh5aKHJUPrSPiMs6YsbkfsHOxX9nyedekg39UsNJV
Gyu6EZYyyNzH/YhF9870GYiXywjpFTBonHGc5VNgOiBQh+Tm10OED23C7gaz8qiV
Kb4OdVRYw8Erh3z2GRWU9rDkE5YDVPFXIaZRTfBCvzxt4rjp/IzoNn0V4rZqPkP7
n+Cgy2m8+sax2wbtbhoZ
=rJqU
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
