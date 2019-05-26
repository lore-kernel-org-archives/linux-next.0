From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the clk tree
Date: Sun, 26 May 2019 20:35:03 +1000
Message-ID: <20190526203503.174d0d80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3oRiTfHo_l//pMeWmoC70a3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/3oRiTfHo_l//pMeWmoC70a3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b3fddd5b100e ("clk: imx: imx8mm: fix int pll clk gate")

Fixes tag

  Fixes: ba5625c3e27 ("clk: imx: Add clock driver support for imx8mm")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/3oRiTfHo_l//pMeWmoC70a3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzqa9cACgkQAVBC80lX
0Gy7Pgf/SpxBmyJz4pO5N5hIl98MKbG2oP+938MrCAv1b/I8vQNK7lmDUAA1A8Ue
XzPndx5l0USn1jpXs3AWJIsu2HgXIKuELexzrGwH2JstMmueoT6sMhBXuTiwPMd/
RDe1SEieyiV/5c0yLfbJeJqe8dSdSk2so+3pE6SvvXwXi62hcRyCdaqleanlcldS
1M8/rDIS2BEaXXGRSbN2n+6IsK/IhVaGjGXs6Xp3/XeehEt5jrcK9cfYip2XqlP/
ykvY3OC5T1/ZhatUt6h2pdxWEbuVX3jO6n0vavIlGCR2bf/W399yMqPZ2VkvA9uF
ZAJ7O+yqhNLsbgtXaP5IRlkJN9TYaA==
=1maZ
-----END PGP SIGNATURE-----

--Sig_/3oRiTfHo_l//pMeWmoC70a3--
