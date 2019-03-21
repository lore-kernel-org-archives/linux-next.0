From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sunxi tree
Date: Fri, 22 Mar 2019 08:30:48 +1100
Message-ID: <20190322083048.31084cf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DERXhB.NTGdHDK+TBouCq2V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/DERXhB.NTGdHDK+TBouCq2V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sunxi tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
  Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
  Selected by [y]:
  - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
  - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]

WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
  Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
  Selected by [y]:
  - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
  - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]

WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
  Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
  Selected by [y]:
  - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
  - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]

Introduced by commit

  49c726d55c1b ("clk: sunxi: Add Kconfig options")

--=20
Cheers,
Stephen Rothwell

--Sig_/DERXhB.NTGdHDK+TBouCq2V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyUAogACgkQAVBC80lX
0GwB6wf6Ax+GSnIN08ERdKis6cyDDlZgEpfaqa4CFj5x3bcfJfIepB2gfODXMBOB
Ng5oSbo13hg5QwSsAzYlLv56cQrkpTvzF1oMa7UbbZI5cdZ/1UB1BKA10JPqJmLr
Vegz5stRTgDPybYR2U6xnw95LfR47vXuIEC1K2sDlbcg1IfxRxDiNHi3ThEiEPvy
0q/iu9XJn5AzSyDsLa7Cjb/QBjjE3XZH3lat+DryVf9CK+XQ/1l5akjdLSBxIEgE
oiakS0fW4W2rfPXxci7uep65Nzfe+B/y1vGvA9yoHJ6uaZYY9s8iMafUi5kzrNNm
rTcbD30pXSqSnElN2Ek+W5oluFvFKQ==
=CDNd
-----END PGP SIGNATURE-----

--Sig_/DERXhB.NTGdHDK+TBouCq2V--
