From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20180911 build: 1 failures 15 warnings (next-20180911)
Date: Tue, 11 Sep 2018 21:10:27 +0100
Message-ID: <20180911201027.GI10123@sirena.org.uk>
References: <E1fzodE-000398-4K@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1282694697=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <E1fzodE-000398-4K@optimist>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jonathan Liu <net147@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============1282694697==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6lCXDTVICvIQMz0h"
Content-Disposition: inline


--6lCXDTVICvIQMz0h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 11, 2018 at 08:47:28PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 defconfig due to:

> 	arm64-defconfig
> ERROR: "sun8i_tcon_top_de_config" [drivers/gpu/drm/sun4i/sun4i-tcon.ko] undefined!
> ERROR: "sun8i_tcon_top_set_hdmi_src" [drivers/gpu/drm/sun4i/sun4i-tcon.ko] undefined!
> ERROR: "sun8i_tcon_top_of_table" [drivers/gpu/drm/sun4i/sun4i-tcon.ko] undefined!

DRM_SUN4I unconditionally uses these symbols which are only defined when
DRM_SUN8I_TOP is enabled, not sure what the exact cause is but there's a
few recent patches to that driver from Jonathan and Chen-Yu so CCing for
that.  I've been missing arm64 builds for a little while so this
could've been there before today.

--6lCXDTVICvIQMz0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluYITMACgkQJNaLcl1U
h9DTiwf6AvdgOYWTkjlU36OPFQVXO68sfEKo+g0EoNmXxLpG7KcdTaGDx+MkZfUB
2D80alaYzjkmUN8U4CX+kqX/NIi7z6i2/gSUDJch1GPGbaE7X+TbUTF+90tef5VT
iu+dLdRNvz+RZDsq3WzkT5CXy+SdMWt82P0Mu6Hf8H5WCJUnIfjwmMxwZ1sjzFlG
jVOevU9XvPZmT3Ix+f/2QopDW0JCDiokzWGU7yATfS563bN5Hj3CM5CXRH3TqRJ6
JnJHs0vTxrqE+iKjnlc4gaUJCAMWciehiC1c5e2wYpyJaggqgfkYj+bC+dm5OpZM
YevqpAO0DWJjjkjdMKMOWBL4vZ0gRw==
=q1/u
-----END PGP SIGNATURE-----

--6lCXDTVICvIQMz0h--

--===============1282694697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1282694697==--
