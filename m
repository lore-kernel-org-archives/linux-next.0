From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160330 build: 1 failures 7 warnings (next-20160330)
Date: Wed, 30 Mar 2016 09:35:45 -0700
Message-ID: <20160330163545.GF2350@sirena.org.uk>
References: <E1alA47-0002T1-O5@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1396930010=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <E1alA47-0002T1-O5@optimist>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexey Brodkin <abrodkin@synopsys.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============1396930010==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W0QGcccuECrPGiFB"
Content-Disposition: inline


--W0QGcccuECrPGiFB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2016 at 07:57:19AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c:618:2: error: implicit declaration of function 'drm_connector_unplug_all' [-Werror=implicit-function-declaration]

which appears to be triggered by a missed update in 6c87e5c3ec6db0 (drm:
Rename drm_connector_unplug_all() to drm_connector_unregister_all())
due to this driver being newly added in a different tree.

--W0QGcccuECrPGiFB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/ABgAAoJECTWi3JdVIfQmPUH/1QGpJ9obs4luky6Uceu1PaD
pcxShjSbN48kDJTRBCCWRCSVkRCGv8E89XSX4pQVhKXrY39b5SGlKTplNQ4SEFoD
azdXX5SO4bOOXzDO615MomMSpEL0NckJZ4a/7Ozf0RNjJpHlyz6jNeMpXUb6NJe+
vnbZjYLt+bt4mBN2ifC6U+WNTyFBCBUeOJ758I5JIMhBMacdeGZZta3VWNh9e6Z0
dnfoOAevgNDFHPEbOJB5CI/xx0ddFcc9ZgAUQYn8lC8mVxfBvTB2r3yQlgm/p6IO
g7X2t4tjGGNu1p6H5HAHC0SJdgOVk3DthEjQTwa0r5kTyDmYYL5DxDjZ8ruvgv0=
=5ts/
-----END PGP SIGNATURE-----

--W0QGcccuECrPGiFB--

--===============1396930010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1396930010==--
