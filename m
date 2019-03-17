From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Date: Sun, 17 Mar 2019 12:28:51 +1100
Message-ID: <20190317122851.2cf734bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TelkFK1v.XotP9Mogd4PFsc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-next.vger.kernel.org

--Sig_/TelkFK1v.XotP9Mogd4PFsc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2b13bee38849 ("ASoC: samsung: odroid: Fix clock configuration for 44100 s=
ample rate")

Fixes tag

  Fixes: fbeec965b8d1c ("ASoC: samsung: odroid: Fix 32000 sample rate handl=
ing")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

  1d22c337dc8f ("ASoC: samsung: odroid: Fix 32000 sample rate handling"

--=20
Cheers,
Stephen Rothwell

--Sig_/TelkFK1v.XotP9Mogd4PFsc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyNotMACgkQAVBC80lX
0Gxnugf/X28p2RcURStB9ykF5moKb4ErdogtMKHdm8I4QdhYUP+o+imuL8s3BVsC
Hc0m2sz4F7DHhAycGRp3CE/njCHz9mrjDzgGeiq8230/pqthn/Q/HxjJ1SlSn+Og
4VpwHhP1a4qR/EbNonWxul5kmd1ryRNVqwh7AtOs/Q7VYCxD1fCAGSxS3NaVV1ww
W77esQnjOstyeyE9XIQyLOXY0bArxXKIjoBrDlPoPqDLzrBN1y0mNoUmjgnzf+6X
ddTT1qNB5w8xvKgQSVrtjiXj7VUnTUuDKx/koOYRw+qnvoVGQQrXQyW2U4uc3aiC
Znp3Bl9OVy1+aXdY50e1a46S7xClYQ==
=j8eo
-----END PGP SIGNATURE-----

--Sig_/TelkFK1v.XotP9Mogd4PFsc--
