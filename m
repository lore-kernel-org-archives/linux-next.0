From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160817 build: 2 failures 5 warnings (next-20160817)
Date: Wed, 17 Aug 2016 10:26:44 +0100
Message-ID: <20160817092644.GE9347@sirena.org.uk>
References: <E1bZvGr-0000Fe-Gg@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0796240596=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <E1bZvGr-0000Fe-Gg@optimist>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Xinliang Liu <xinliang.liu@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Cc: linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============0796240596==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4p/IC6kBmCKpHx3O"
Content-Disposition: inline


--4p/IC6kBmCKpHx3O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 17, 2016 at 08:28:17AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c:140:18: error: passing argument 1 of 'dc_ops->cleanup' from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:994:52: error: 'dev' undeclared (first use in this function)
> ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1055:52: error: 'dev' undeclared (first use in this function)
> ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1065:1: error: expected '}' before ';' token

caused by d25bcfb8c2 (drm/hisilicon: Don't set drm_device->platformdev)
which does a a partial conversion to new APIs.

--4p/IC6kBmCKpHx3O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXtC3TAAoJECTWi3JdVIfQbg8IAIWoS5HOHevEIKazbSm315Pi
dK0WckDbfrD2tBLEEkKqxb4nbsZ56QQ4MJIG1WE6Y/8q6JIWpRJcRhQ8YNAXH1DW
vgXOvmLlccE796yGbz4G3CqaPHEURbmwBc7i0DCCccbilVYJQ7/HV8RyeygnR4uH
Kgszu2OtpEO5uyblpSBNY5neVc83S9pJxgY+a51gfp51UHoBAIDLSYG5avYH0LMd
3rduDI1M5QMa7Af+tqJL+gEs9lYOQw/j5tAxD9MQ3y+gpmwLoZpnfqPVnYJ7PGv9
p+ci3EF3me9YBpFlc/OwWFdx5TQTkTWmdvfON6Kjnf4FeEEnFLZGQ/9MIul0jzc=
=PV9B
-----END PGP SIGNATURE-----

--4p/IC6kBmCKpHx3O--

--===============0796240596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0796240596==--
