From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Date: Mon, 6 May 2019 10:43:57 +1000
Message-ID: <20190506104357.18e10955@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4A5VfpcTk.9FVkm=94W1xPA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Fabio Estevam <festevam@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4A5VfpcTk.9FVkm=94W1xPA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the imx-mxs tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  7b0d021fbe41 ("arm64: defconfig: enable PCIE_ALTERA")

from the arm-soc tree and commit:

  a9aa2a812255 ("arm64: defconfig: Enable CONFIG_SPI_IMX")

from the imx-mxs tree.

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
index 5392c12ef3b7,979a95c915b6..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -357,7 -365,7 +358,8 @@@ CONFIG_SPI=3D
  CONFIG_SPI_ARMADA_3700=3Dy
  CONFIG_SPI_BCM2835=3Dm
  CONFIG_SPI_BCM2835AUX=3Dm
+ CONFIG_SPI_IMX=3Dm
 +CONFIG_SPI_NXP_FLEXSPI=3Dy
  CONFIG_SPI_MESON_SPICC=3Dm
  CONFIG_SPI_MESON_SPIFC=3Dm
  CONFIG_SPI_ORION=3Dy

--Sig_/4A5VfpcTk.9FVkm=94W1xPA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzPg00ACgkQAVBC80lX
0GzWQAf+IyIw7MKo75hxmAy5MsACq8sprZgHHDKKUik/Jdxj9t8Z/Ji47L8c6tEA
v4OyB5zWxmAUL6D03p19K/xTKSCoBtTCb/LOOl1w+Z0PP5FAuu/ySAdz9OuVp88V
mSfL9OJmTpsvoISDzXnY51TWGUGWe7yXQ0cvI2OSkocPQrRlwvPT2ppYIsx/TFtp
iQRUC7RzBFMLAbJbAok/tBQ8pYSsnty3bzKHeNLAibTi0BkKx89pkOz7DbHtl/ti
fOJqdZvtZJRVuA83ZkvInRrCdGbKyYu0wxepZhI4B2nxXl96ElQR0t89EZC0z1Rl
9Jyul/AKnX00dB9VOcuZxsTgvZW1TA==
=aEht
-----END PGP SIGNATURE-----

--Sig_/4A5VfpcTk.9FVkm=94W1xPA--
