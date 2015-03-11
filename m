From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: linux-next: Tree for Mar 11 (arm:multi_v5_defconfig build
 failure)
Date: Wed, 11 Mar 2015 17:21:41 +0100
Message-ID: <20150311162140.GR1509@kw.sim.vm.gnt>
References: <20150311163558.6a09cfcc@canb.auug.org.au>
 <20150311155548.GB22446@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p5IZK5YeVHbHpQuL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150311155548.GB22446@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>
List-Id: linux-next.vger.kernel.org


--p5IZK5YeVHbHpQuL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2015 at 08:55:48AM -0700, Guenter Roeck wrote:
> On Wed, Mar 11, 2015 at 04:35:58PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20150310:
> >=20
> > New tree: drm-exynos
> >=20
> > The sound-asoc tree still had its build failure so I used the version f=
rom
> > next-20150306.
> >=20
> > The regulator tree lost its build failure.
> >=20
> > The tip tree gained a conflict against the usb-gadget-fixes tree.
> >=20
> > The staging tree lost its build failure.
> >=20
> > Non-merge commits (relative to Linus' tree): 3446
> >  3448 files changed, 138744 insertions(+), 73083 deletions(-)
> >=20
> > -----------------------------------------------------------------------=
-----
> >=20
> Building arm:multi_v5_defconfig ... failed
> --------------
> Error log:
> arch/arm/boot/dts/kirkwood-nas2big.dts:15:43: fatal error:
> 	dt-bindings/leds/leds-netxbig.h: No such file or directory
>  #include <dt-bindings/leds/leds-netxbig.h>
>=20
> Caused by commit a9e58557e99 ("ARM: Kirkwood: add DT description for nas2=
big").
> Yes, that file doesn't exist.

Hi,

This should be fixed quickly. I sent a patch this morning:
http://www.spinics.net/lists/arm-kernel/msg404676.html

I believe that Gregory will merge or squash this patch soon in the
mvebu/for-next branch.

I apologize for the inconvenience.

Simon

--p5IZK5YeVHbHpQuL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUAa5QACgkQgtp0PDeOcDo/8QCgksmYzWxMERM4IjjX0lmOXuLh
NNMAn2BK8R12uf8pjSnI7K9hFyKJrjoZ
=QPX7
-----END PGP SIGNATURE-----

--p5IZK5YeVHbHpQuL--
