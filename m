From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sunxi tree with the imx-mxs tree
Date: Tue, 21 May 2019 09:18:30 +1000
Message-ID: <20190521091830.25a6cc27@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qOlJ1zMtDwGZkVziBHNfKg3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/qOlJ1zMtDwGZkVziBHNfKg3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sunxi tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  4aaa1c7a05db ("arm64: defconfig: NVMEM_IMX_OCOTP=3Dy for imx8m")

from the imx-mxs tree and commit:

  296bcfa05640 ("arm64: defconfig: add allwinner sid support")

from the sunxi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index 33fac4e62a16,f981a882c546..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -762,7 -741,7 +762,8 @@@ CONFIG_PHY_TEGRA_XUSB=3D
  CONFIG_HISI_PMU=3Dy
  CONFIG_QCOM_L2_PMU=3Dy
  CONFIG_QCOM_L3_PMU=3Dy
 +CONFIG_NVMEM_IMX_OCOTP=3Dy
+ CONFIG_NVMEM_SUNXI_SID=3Dy
  CONFIG_QCOM_QFPROM=3Dy
  CONFIG_ROCKCHIP_EFUSE=3Dy
  CONFIG_UNIPHIER_EFUSE=3Dy

--Sig_/qOlJ1zMtDwGZkVziBHNfKg3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzjNcYACgkQAVBC80lX
0Gz0Kwf9GQoooOHnEQBjKHSRnhPfmUaeVynYsAbKyrvfOZtRhDMf8lSGAdZxErpT
ULA4PyA+Dgs36+Px4/U+4tKk4mF7xXVpfwPm2oSmu4yVz+C89JkbP8W6Mkke5rgz
rUk4FvZyC3FcpbTaDenv8e/W27HAc7vOkjUvF2VDludd0AH/Z0dVtZ0gBXFf7W3g
B46zH/xdPwjrTTlsyH0zbE2p6fVizGY8ySIPyIwX2aADeKScJ6rFlt/9wTOiiFm2
Dr9i00HuEXVtZbgkikxfcku9GWcaVJgGX/xI7Im37Q/dOleyM9JqWvaSGl9qHL2X
aqLCaoNlBAXpk5XMKS7N08v+sKc0+Q==
=jz9e
-----END PGP SIGNATURE-----

--Sig_/qOlJ1zMtDwGZkVziBHNfKg3--
