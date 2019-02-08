From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Date: Fri, 8 Feb 2019 10:29:34 +0100
Message-ID: <20190208092934.jgp7mqmi2wzbtmqg@flea>
References: <20190208123204.1be5d047@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ydb5uovmisukq5gg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190208123204.1be5d047@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--ydb5uovmisukq5gg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, Feb 08, 2019 at 12:32:04PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c: In function 'sun6i_dsi_probe':
> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:1053:9: warning: 'ret' may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
>   return ret;
>          ^~~
>=20
> Introduced by commit
>=20
>   bb3b6fcb6849 ("sun6i: dsi: Convert to generic phy handling")

I just pushed a fix for this, thanks!
Maxime


--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ydb5uovmisukq5gg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXF1L/gAKCRDj7w1vZxhR
xYJRAPwM9rJedUBSeZQW+uJxd0Y/SShCzQp8L+LVtVNGBUrJGQEAjjVVdRnfXd7j
zydunZPhRGvKbTD745OAJ/i6XQLnuwc=
=njD/
-----END PGP SIGNATURE-----

--ydb5uovmisukq5gg--
