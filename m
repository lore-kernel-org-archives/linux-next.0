From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the clk tree
Date: Tue, 30 Apr 2019 10:19:39 +1000
Message-ID: <20190430101939.76dc077c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/O_CCSv_ik.J=.msdHR8HWg8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/O_CCSv_ik.J=.msdHR8HWg8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/clk/imx/clk-pllv3.c:453:21: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
   pll->denom_offset =3D PLL_IMX7_DENOM_OFFSET;
                     ^
drivers/clk/imx/clk-pllv3.c:454:2: note: here
  case IMX_PLLV3_AV:
  ^~~~

Introduced by commit

  01d0a541ff4b ("clk: imx: correct i.MX7D AV PLL num/denom offset")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/O_CCSv_ik.J=.msdHR8HWg8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzHlJsACgkQAVBC80lX
0GwcmQf8DQm/+a+825CRo/z9YbTfzFrH7k1fA68yg/EKjTDMMsXeZcdPfpLEZQrT
/t+OF0ZCKTT/WEESDmmJHaViC7wGbqUzpKGKj9Z4JNC6mGBQbhGNXRt3aIUWUCBr
NpA8DebUbaUciq1iu+j3w1jrUYzmsqEB7tDfeetdPE75kCy6NZVHKNvSoINtOzE/
j/lpMl5Uv4UYQLgXmchiYgSO41iRz3xUSOZwRnuLvx0Be1i2PWBf/+SyMu9Qw9kw
WsqSKhqldIpG9EeHb4MrSYQYSeUlXqaOUvwb3HuXYyKir7qoqtAu33U1p2KUXRHn
rVOI5AteR8+bnJoo8sByoKStI6Ptsw==
=Dwx1
-----END PGP SIGNATURE-----

--Sig_/O_CCSv_ik.J=.msdHR8HWg8--
