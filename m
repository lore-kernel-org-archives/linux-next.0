From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk tree
Date: Fri, 30 Nov 2018 09:03:25 +1100
Message-ID: <20181130090325.7526140e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5w=Bnuv=9s_CopRFLzS.c2B"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5w=Bnuv=9s_CopRFLzS.c2B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arm-linux-gnueabi-ld: drivers/clk/imx/clk-frac-pll.o: in function `clk_pll_=
round_rate':
clk-frac-pll.c:(.text+0x50): undefined reference to `__aeabi_uldivmod'

Caused by commit

  9fd680d0fafd ("clk: imx: add fractional PLL output clock")

I have used the clk tree from next-20181129 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/5w=Bnuv=9s_CopRFLzS.c2B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwAYi0ACgkQAVBC80lX
0GzI8gf9HFn6FEGZpfjlEjDmk9VAO8pqSde850yQIoTNZYdOj0DPUgaGiAPHVccR
0uU7I5yWMiBfuCpp3OWesfMiDjhb98Wj8sxqbqHljjY8M7kWSn6BHwIYStQuyuyO
DUzHuxPtxRfGEFtcbj2ApZU/2Up8Hec1uEVNLs0JTo5I0Wm89QRG4v22Vm794oau
/rsZNfhGj+0W+mPGvBYZLTvq2V3kxrzxmV1POoTpqbH8MS/uxJoEUj1ZuVD7WjBL
/sFM4UusrMlausFGC0qU+nia1EFvfHIrETFqamzfCoHvDfJPPyKeLyNmmn2z8ciZ
lph8ZRTAwmm1tol495g2vOqZLgzEnw==
=5mU8
-----END PGP SIGNATURE-----

--Sig_/5w=Bnuv=9s_CopRFLzS.c2B--
