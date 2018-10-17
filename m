From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the clk tree
Date: Thu, 18 Oct 2018 08:51:53 +1100
Message-ID: <20181018085142.0fc1d2f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BvsTfr6L6MiWm_CVDsoWvly"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Taniya Das <tdas@codeaurora.org>, Craig Tatlor <ctatlor97@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/BvsTfr6L6MiWm_CVDsoWvly
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/clk/qcom/gcc-sdm660.o
see include/linux/module.h for more information

Introduced by commit

  f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SD=
M660")

--=20
Cheers,
Stephen Rothwell

--Sig_/BvsTfr6L6MiWm_CVDsoWvly
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvHrvkACgkQAVBC80lX
0GxhUQf+MEvNeshiNgJ3D+Ophr89+y+HjrIF0ObtuEZejuef35PZpEvviwpcQiVH
CrRyxx6Dt+Hay/BmQMvnKHSpJAbuLEEG+KDJo2CtgrTfqyMDkdBlra4ajbs0dT4s
dQ9T/f8rNGPnHoIZpAVf+Mp56lli2E+OE0x4VlDgEdE36hGdy7u7m3rx8ivCiiMF
jlaBmZeSvTa+3GfeMwOT3WjwZ41T6ogJf+E+dXdOtm400lemmk360kHea9ZGR62S
IKaB9lM8q3N3lP+lqCltOMzGvQPK5tzUmZWJKNvEFddDUKfNTEysBk/+bwtvFKUG
JjyX9haw7gc4dWnrkZCyNZxh63A4CQ==
=21L9
-----END PGP SIGNATURE-----

--Sig_/BvsTfr6L6MiWm_CVDsoWvly--
