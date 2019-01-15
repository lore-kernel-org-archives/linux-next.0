From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the clk tree
Date: Wed, 16 Jan 2019 08:34:40 +1100
Message-ID: <20190116083440.11b6839c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LUD=LGqnB_f5UgHKR.0CxKt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

--Sig_/LUD=LGqnB_f5UgHKR.0CxKt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[I am experimenting with checking the Fixes tags in commits in linux-next.
Please let me know if you think I am being too strict.]

Hi all,

Commit

  b488517b28a4 ("clk: socfpga: stratix10: fix naming convention for the fix=
ed-clocks")

has a malformed Fixes tag:

  Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for
  Stratix10 platform")

It should not be split over 2 lines.

--=20
Cheers,
Stephen Rothwell

--Sig_/LUD=LGqnB_f5UgHKR.0CxKt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+UfAACgkQAVBC80lX
0Gx63gf/dAKugoyaKtZoTxvkBM7rUSXFDmIMyek1ikXkkAVEGAG6FCsMDOoL7wwZ
aSy4gIHouoSfiMPp2bvNtyWe98ztjYul6qQlR2TOURsMNF8cy1vzulDpteDITaPY
w+VGAVmmd5M+HmM8FO1g+56w3wwoZT0mexO+eqbeaoAcsaKEYhathKlksUPoQ9EW
l3DO1cc0BQ4bEIKcmtEvAjvi5+sOnjFYBBeaZ/e5oq3vRjfyDv8JDayI9UeZ3+SS
s8V4cYlcDnVJ0HS0nj+xbdnQj0qFXeLI/SYG3iIIpxyAv/qIHO9OpnVfb6MH2jcE
RCI69JqkqswyNSN3Ymxz0KKXlb5tmQ==
=FQSz
-----END PGP SIGNATURE-----

--Sig_/LUD=LGqnB_f5UgHKR.0CxKt--
