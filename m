From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: next-20180911 build: 1 failures 15 warnings (next-20180911)
Date: Wed, 12 Sep 2018 16:02:22 +0200
Message-ID: <20180912140222.ycqbolkd7ebizy4b@flea>
References: <E1fzodE-000398-4K@optimist> <20180911201027.GI10123@sirena.org.uk>
 <CAKMK7uF-kF1pBQu-F2tG8vpzw=2nbzO0h1WqhG=WjK7nkdvZfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1972800495=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uF-kF1pBQu-F2tG8vpzw=2nbzO0h1WqhG=WjK7nkdvZfQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Liu <net147@gmail.com>, Linaro Kernel Mailman List <linaro-kernel@lists.linaro.org>, kernel-build-reports@lists.linaro.org, dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, linux-next <linux-next@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org


--===============1972800495==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mwwbarayjyikq64a"
Content-Disposition: inline


--mwwbarayjyikq64a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2018 at 10:18:01PM +0200, Daniel Vetter wrote:
> On Tue, Sep 11, 2018 at 10:10 PM, Mark Brown <broonie@kernel.org> wrote:
> > On Tue, Sep 11, 2018 at 08:47:28PM +0100, Build bot for Mark Brown wrot=
e:
> >
> > Today's -next fails to build an arm64 defconfig due to:
> >
> >>       arm64-defconfig
> >> ERROR: "sun8i_tcon_top_de_config" [drivers/gpu/drm/sun4i/sun4i-tcon.ko=
] undefined!
> >> ERROR: "sun8i_tcon_top_set_hdmi_src" [drivers/gpu/drm/sun4i/sun4i-tcon=
=2Eko] undefined!
> >> ERROR: "sun8i_tcon_top_of_table" [drivers/gpu/drm/sun4i/sun4i-tcon.ko]=
 undefined!
> >
> > DRM_SUN4I unconditionally uses these symbols which are only defined when
> > DRM_SUN8I_TOP is enabled, not sure what the exact cause is but there's a
> > few recent patches to that driver from Jonathan and Chen-Yu so CCing for
> > that.  I've been missing arm64 builds for a little while so this
> > could've been there before today.
>=20
> Patch seems to have been stuck on dri-devel. I smashed an r-b onto it
> so Maxime can apply.

It's done now.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mwwbarayjyikq64a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluZHG0ACgkQ0rTAlCFN
r3TLqw/7BZ/AZkqPPCXCEtAy9/EFoCGBCkWKaZ0QFtLZSdsY0QD56AjiJC6YIF+I
ELa2OzeJx4dBBs3f2ENHg5YhGLJ4d0lHZSOVO2E53Bk0m4vNQB1UI/1T7RLSy3hT
2ibWHuzATL0tdnu4He7BxHJ16lAVpbJqyg6aLalSrchHMjc4nBxajmJtpH9IonXS
TPpdKpWMeAsifHc4pvHWcZNOWQWI3nvyrI9Q/J8cvhHRWJreK4TZOKgk9CObY0FP
UB25Vnk4LbN3Afr8RHBvdl5LR0krKFO2Ml347bqueTjVjpX5zot2CG99lfERqNDb
B/8dZatEhrIYL73mUn05P4nU0eaNLyTS2jORxGvqwqKN4lx4vLiN+s7WhNT3CUJb
pWfp/I7kPFcipydQLg0ko+MdpK94eOBgM2IBRovPHHaiRVKm31b2bOHyi/KDre97
Z9hU0KTRn2Odrk9Th6P8RDfkebgdaGcMLPcEXExrkFHPIgWWTHIDGQUxXPTj4JHD
5jr68FV8M5av1KP1KjGhR5oXY8Z5ss0Sl/IS4pxydEAkBVK46H5IaskJgjIjY05n
rspDlrtb8bP5GqF/bU8flWoHJAKxKydVC00B/GMz7RRW/gKPuOMenqjesPYDwPSk
d2zzCdFelVwdyzWm07lRFjtt6+OeB3PnFgwp3Pv4lK3rq9kabn0=
=mteZ
-----END PGP SIGNATURE-----

--mwwbarayjyikq64a--

--===============1972800495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1972800495==--
