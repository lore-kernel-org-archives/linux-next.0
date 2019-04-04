From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the mfd-fixes tree
Date: Fri, 5 Apr 2019 07:48:43 +1100
Message-ID: <20190405074843.7f0013db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Yv_EBHyDNOCLiHfipzYdhRa"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Kemnade <andreas@kemnade.info>
List-Id: linux-next.vger.kernel.org

--Sig_/Yv_EBHyDNOCLiHfipzYdhRa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

In commit

  20bb907f7dc8 ("mfd: twl-core: Disable IRQ while suspended")

Fixes tag

  Fixes: 6e2bd956936 ("i2c: omap: Use noirq system sleep pm ops to idle dev=
ice for suspend")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: c6e2bd956936 ("i2c: omap: Use noirq system sleep pm ops to idle devi=
ce for suspend")

--=20
Cheers,
Stephen Rothwell

--Sig_/Yv_EBHyDNOCLiHfipzYdhRa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlymbasACgkQAVBC80lX
0GzFBgf+JL+7RAKtMeJRxKzgELc6PmZ0JOyU10LGmWDEYOiALYxjQAQmap5MeW6Y
dMKZkpHRsKk3UsBC1dLuhCCsaWTCqOKtYMrfwe71ZSNB4b2umsgyZhaprQIUOAnf
8jp4XBLaaljS2LyY1Q1dv+L+y8pyq/sQcC6uqvyBl3K++9uQfM8kre9W05VIS1AX
GEwhi8d35rIEKMvLJZW3AFW/g038hQonqlBSVk6LbocXkH1Jyc8YRgtsvtWq+xuL
xoaqU5VWncfwjf4SvXEc0dHyjV0Wq/NXVSmXF23roWBBoad/ODfdHdmFbH3qDDhK
chBjJZCR5/GsWIbsgAdFrfU9B0Hf+g==
=PBKK
-----END PGP SIGNATURE-----

--Sig_/Yv_EBHyDNOCLiHfipzYdhRa--
