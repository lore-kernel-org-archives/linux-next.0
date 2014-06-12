From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [next] ASoC fsl-ssi change breaks mpc85xx_defconfig build
Date: Thu, 12 Jun 2014 07:24:11 +0200
Message-ID: <20140612052411.GA24404@pengutronix.de>
References: <5398D045.3060906@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:41913 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089AbaFLFYU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jun 2014 01:24:20 -0400
Content-Disposition: inline
In-Reply-To: <5398D045.3060906@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Michael Grzeschik <mgr@pengutronix.de>, Mark Brown <broonie@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, Jun 11, 2014 at 05:55:17PM -0400, Paul Gortmaker wrote:
> Hi Markus,
>=20
> A bisection shows that this commit:
>=20
> 432481220101166a0b33dc6f951b38a8af3d281c is the first bad commit
> commit 432481220101166a0b33dc6f951b38a8af3d281c
> Author: Markus Pargmann <mpa@pengutronix.de>
> Date:   Tue May 27 10:24:25 2014 +0200
>=20
>     ASoC: fsl-ssi: Use regmap
>=20
> found in linux-next causes the 85xx powerpc build to fail with:
>=20
> sound/soc/fsl/fsl_dma.c: In function 'fsl_soc_dma_probe':
> sound/soc/fsl/fsl_dma.c:926:34: error: invalid use of undefined type 'str=
uct ccsr_ssi'
> sound/soc/fsl/fsl_dma.c:927:34: error: invalid use of undefined type 'str=
uct ccsr_ssi'

Guenter also noticed this build failure and sent a patch which was
applied by Mark yesterday. [1]

Thanks,

Markus

[1] http://thread.gmane.org/gmane.linux.ports.ppc.embedded/70977

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJTmTl7AAoJEEpcgKtcEGQQ5cIP/iJ4g066+wYxDe6izXjPh5Pb
Tqk/9xjiB/4eaVfO0vs7a/EXge4cHvYRrBqzzcOf9xHsN31cBYCUaRKpwbFvL0Ez
bLwAnVpQuGVOYpcwvtu/uq70HQk0Oxty/nf0KdFWTQupExNcTr4mxw3d9HtSKAmi
kkzsVBnOY1rSIxfsPYqs8dJcDm9LksBQAdHPoyjIcvVWcHvMTSLIc113VMgsNb7o
cI7+rdDBkPdtsGI92HTUOFTesgqI0ZMukbKxcn7ObcK/lu4spu2E/u6+JrmGwrVO
do4pInvG0MDCYgmuXNwaeLRwoVa+JJieWzdyuhI6305+oZ13ExYkcg52twIm83rR
asvyIsAO9NfTIyUGRuF+Bftsmx+u1E9Dr8qM1WBA/anNLtbeG5VX9R7ZqC1TfTxK
EH7h4k6D2apTPaXqXD012ZeQNmFJGKqFxmxxeAMDObT8mjGJtPOf9KQbEM2HUk+w
p92aLl7T8dOw+Ea+l3iqtd2+3EyvvBWCdmpF7BkRkrjuUCAc0lXq70d1p1K6thj/
KZ01DknkvCAuwRIwOSzi+e4kktaK/PtTycuF/1lUdHGkd2uk2ogfX4QaPNvW+CcS
FUInSBntVYsbz+7u9EVcKc+0sVV+X9SCaxhlFs6L7K6TYuoES7l7RkIBuJHg62ZY
+6dsfGE776PcCsn8fP0v
=Qgm0
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
