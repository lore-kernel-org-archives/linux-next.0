From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mmc-uh tree with the sunxi tree
Date: Tue, 20 Jan 2015 14:17:50 +1100
Message-ID: <20150120141750.3dcade27@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ogXgF2AF7Wc.iP.BmPC2nzu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David =?UTF-8?B?TGFuemVuZMO2cmZlcg==?= <david.lanzendoerfer@o2s.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/ogXgF2AF7Wc.iP.BmPC2nzu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

Today's linux-next merge of the mmc-uh tree got a conflict in
drivers/mmc/host/sunxi-mmc.c between commit 6c09bb851e57 ("mmc: sunxi:
Convert MMC driver to the standard clock phase API") from the sunxi
tree and commit 776e24c502da ("mmc: sunxi: Removing unused code") from
the mmc-uh tree.

I fixed it up (the former includes the latter change) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/ogXgF2AF7Wc.iP.BmPC2nzu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUvcjjAAoJEMDTa8Ir7ZwVsGgP/jcnftu0MQNJYHQaKo3GcfwQ
Jgd0Y6Qc9UoBtf6dG0pc3PyxGNB2X4NVXCuz868zbH8SBzbi4N66tipwZ+D4h2Ax
QB0rOebdFQB7dz5Nsjkzlt07I5wcs6/qrt6ceZmf1hYzn3dCE2OAA6hltw7r6q8l
edGqSe6CPA6nXQWxMyH4twU2x6YDWGT6kKzez/mibd2gqoXLwrS1x4rn7mdQVr2/
0fFczeFdD40/vIVuyUD7n9Rzz/fZKx1is9iLTHxJ212kWVffzeff3TkjUwhNtzfZ
Lt993X4CLsABtRFkt3dU8MC0GiqcMUTtHeanF0WhTjXPrKryBH0AfGysy9a3gIbW
3UtTL2igi5CTzJ8wAh/V7/QdUqVQtT/6eClOzsemZT1SMpwaXjSaUyj+CPzC5VyG
jSWg7yi3pOKmgfxCbFCsCGGPEGPlAYLAOBJsOLiN7++Myp6xmW0C5mGyTa8E21Tg
iOEy+u4WlKlHdOdZhNw5yh8BpUAEUuDwJraJNEDSuiChBsYUGo6OgXOctQ1VwbkG
MrS3OPjlWCbdv/UToLE/CgEo29l33DGZLel+HldmVPU8kAKs+ixsEkQbAl5kzN7b
PbSy8Z4Zu2T/jv13m2gC1nO8USngN29or954Tr7c5osqzwVZr+pKcCNEmSsZyjgL
x1UimOphHZGQB2eYyKSE
=pPty
-----END PGP SIGNATURE-----

--Sig_/ogXgF2AF7Wc.iP.BmPC2nzu--
