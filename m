From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the imx-mxs tree
Date: Thu, 17 Jan 2019 07:54:59 +1100
Message-ID: <20190117075459.50e6a22f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WPSaKkiaC0N+lZDb.IwvpAI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/WPSaKkiaC0N+lZDb.IwvpAI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Commit

  fde7ed930ca2 ("arm64: dts: imx8qxp: Fix MU4_INT number")

has a malformed Fixes tag.

The SHA1 should be at least 12 digits long.

--=20
Cheers,
Stephen Rothwell

--Sig_/WPSaKkiaC0N+lZDb.IwvpAI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw/miMACgkQAVBC80lX
0GybRQf/evqxS0ALcGxM8VXXFAQZhDPTAj+6rLi7TJ1sHKqDpWDm81zURJLR+Ru6
iqCHAOZdkD6VbgEWZQZxz681fPZQcR2E/N9nOOsrRpmLTIX7Mf1QDDe7B5BgiIcP
mU/fT4nTa3yWR19nLSpG8XDb9ZJe4owWmvAGrCaSxNS0r7ZquT+nzHrKUY81welE
aUfG7HWxp2rBb8ssCuK6GgLNkfHcRNYFEk2jzbRc3bmzXsoYvaDdz7kG7q9/rBmy
l0CHZMY86t1RWBNnsE2Synb+dDT7mglrinLdzStSPYKgXFBFS3TXTUOuPaZu94q+
Wogi88nkiES2efaaJYVAeXLiivJ7EA==
=sCtf
-----END PGP SIGNATURE-----

--Sig_/WPSaKkiaC0N+lZDb.IwvpAI--
