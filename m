From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the mmc-fixes tree
Date: Fri, 12 Apr 2019 07:20:49 +1000
Message-ID: <20190412072049.08b5eeb6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rkIH=yXnYYacT/rKsFybRYs"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Faiz Abbas <faiz_abbas@ti.com>
List-Id: linux-next.vger.kernel.org

--Sig_/rkIH=yXnYYacT/rKsFybRYs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5c41ea6d5200 ("mmc: sdhci-omap: Don't finish_mrq() on a command error dur=
ing tuning")

Fixes tag

  Fixes: 5b0d62108b46 ("mmc: sdhci-omap: Add platform specific reset

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/rkIH=yXnYYacT/rKsFybRYs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyvr7EACgkQAVBC80lX
0GyELgf/UHblpwwqE1ZuCeiPBFhG8c1q868YBFpJzBv766hUCaa97L5mWu0Jc/7q
Gv19k8lNyNEBGNC+C9YyjyapARB9MuMGVHq3/FHUsLqa0gJ+7NR7tGo+SgDB97sO
z+b90XAukclD8q+AQlIEuVQ3F5a9M4sUq2yC8NNlCyoyt1AWEl/IIV+J80yA2+zu
wogKm2ur6xI/T1iUBgEDwzaZCEgWwh3dXsChZGE2X8XIUTqSD6hRjXcJF+jMqypl
9TbWJ97t9r7s40WpqvtKZGBVPnXfmhVxDvUBPKYd7J9tvQ5lxGJUFQaWUI1sPpR2
2RCI5Xm3QPXk+wi6dLWBCVUcozRGRQ==
=71oc
-----END PGP SIGNATURE-----

--Sig_/rkIH=yXnYYacT/rKsFybRYs--
