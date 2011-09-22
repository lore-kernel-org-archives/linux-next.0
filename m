From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Subject: Re: [PATCH -next] seeq: fix compile breakage on s390
Date: Thu, 22 Sep 2011 00:29:42 -0700
Message-ID: <1316676583.2182.64.camel@jtkirshe-mobl>
References: <1316675875-5423-1-git-send-email-heiko.carstens@de.ibm.com>
Reply-To: jeffrey.t.kirsher@intel.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-/hV5UvIM83gzlsY1tM+s"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:9725 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752238Ab1IVH3n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Sep 2011 03:29:43 -0400
In-Reply-To: <1316675875-5423-1-git-send-email-heiko.carstens@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>


--=-/hV5UvIM83gzlsY1tM+s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-09-22 at 00:17 -0700, Heiko Carstens wrote:
>=20
> The SEEQ drivers should depend on HAS_IOMEM to prevent compile
> breakage
> on !HAS_IOMEM architectures:
>=20
> drivers/net/ethernet/seeq/seeq8005.c: In function 'seeq8005_probe1':
> drivers/net/ethernet/seeq/seeq8005.c:179:2: error:
>   implicit declaration of function
> 'inw' [-Werror=3Dimplicit-function-declaration]
>=20
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>=20

You need to send this to netdev@vger.kernel.org for David Miller to pick
this fix up.

--=-/hV5UvIM83gzlsY1tM+s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOeuPmAAoJECTsCADr/EWUMMYH/RGIFjCS+qFuur5JiPqB9auJ
oTB5CeayPXsA7APTpro8CRSCqfivdKdEzrAk14/BDxR5+kDDO3b9V8r8u+P3RhgJ
oSF+0n5I9uc7kUf4A2lB4/0T6A5V0AFYuytLfNmcDn+bYVx4tt9BIN7bbj5DxwnU
l8fmfK+H47e2XRwJRNZiAiqHQefaDIksCMFStJ7pNtzUAhbuJUV5/P/rxLgtrM7q
CO4+8K7nDle0PlN8hZFNngl3EvJKtpeY4WbnCF5u9MXVbn/mlUxT9W5e088dpAcD
Wm6BkaQkk3Fn3JDzgWrDJZNdLhUSLW8s3+JX4FLIJUKtdXMBBI5nch9YnNmv258=
=ZCCo
-----END PGP SIGNATURE-----

--=-/hV5UvIM83gzlsY1tM+s--
