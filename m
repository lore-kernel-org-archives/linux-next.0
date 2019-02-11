From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tegra tree with the imx-mxs tree
Date: Tue, 12 Feb 2019 09:01:29 +1100
Message-ID: <20190212090115.69bc5891@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4m3zFkKOm50f0EXg2j9mM.B"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Carlo Caione <ccaione@baylibre.com>, Joseph Lo <josephl@nvidia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4m3zFkKOm50f0EXg2j9mM.B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  28cfe2434529 ("arm64: defconfig: Enable PFUZE100 regulator")

from the imx-mxs tree and commit:

  2b5d2c92c29d ("arm64: defconfig: Enable MAX8973 regulator")

from the tegra tree.

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
index 3317d85fa8a3,ad8f3dea0a74..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -323,8 -319,7 +323,9 @@@ CONFIG_SERIAL_MESON_CONSOLE=3D
  CONFIG_SERIAL_SAMSUNG=3Dy
  CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
  CONFIG_SERIAL_TEGRA=3Dy
+ CONFIG_SERIAL_TEGRA_TCU=3Dy
 +CONFIG_SERIAL_IMX=3Dy
 +CONFIG_SERIAL_IMX_CONSOLE=3Dy
  CONFIG_SERIAL_SH_SCI=3Dy
  CONFIG_SERIAL_MSM=3Dy
  CONFIG_SERIAL_MSM_CONSOLE=3Dy
@@@ -451,7 -438,7 +452,8 @@@ CONFIG_REGULATOR_GPIO=3D
  CONFIG_REGULATOR_HI6421V530=3Dy
  CONFIG_REGULATOR_HI655X=3Dy
  CONFIG_REGULATOR_MAX77620=3Dy
+ CONFIG_REGULATOR_MAX8973=3Dy
 +CONFIG_REGULATOR_PFUZE100=3Dy
  CONFIG_REGULATOR_PWM=3Dy
  CONFIG_REGULATOR_QCOM_RPMH=3Dy
  CONFIG_REGULATOR_QCOM_SMD_RPM=3Dy

--Sig_/4m3zFkKOm50f0EXg2j9mM.B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxh8LkACgkQAVBC80lX
0Gzupgf/X8ZQhsCIII364APt7lOTefhR8gN/8NvjrJYMbcI6W8OkFCIFar7+6zqE
+gcdLkO8yTDUzf3I8VKifTJXhlJ+gYV011bSZx2WwdOEYhb0kiVzVLj3DcbmFZKm
bbbK88hgh92LOIax23Xa4TqfhXUD6GNUuHbQpXsosqCw0V2ChIXHn1rPjXmL+zh/
thZkHPSEF/UsmY3/IruU1bb7DAW6OzlsWkJmsc5q+TT6G4sP1W/S5EXM5ASbu+s/
cEgbuymnHeK0xTWATH/AfPGzsm5b4f74W78oAebqCAkPH2PinvLqLTCov2iONkTI
Kb9yrkAATN3SxYrnCczXQ47klza7Wg==
=MTyt
-----END PGP SIGNATURE-----

--Sig_/4m3zFkKOm50f0EXg2j9mM.B--
