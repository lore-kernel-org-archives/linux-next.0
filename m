From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tegra tree with the imx-mxs tree
Date: Thu, 7 Feb 2019 09:51:42 +1100
Message-ID: <20190207095142.5ccc4a8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WT+k+ePHoTcu=Rq6DTBR8a4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/WT+k+ePHoTcu=Rq6DTBR8a4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  9bd01e74c715 ("arm64: defconfig: Add i.MX8MQ boot necessary configs")

from the imx-mxs tree and commit:

  bc72bed682a9 ("arm64: defconfig: Enable Tegra TCU")

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
index e82bc8cf1253,ad8f3dea0a74..000000000000
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

--Sig_/WT+k+ePHoTcu=Rq6DTBR8a4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbZP4ACgkQAVBC80lX
0Gxg1gf/TVpU60x2w77NkepYpjEhutbNqhFgZkB8I4+txLylVckQ42g9LJe38j3Z
SBqeHI12IgZQPhWVPg7FHkm5i4cKQ52aL0KkxQeAmMSLefUl1mP4iwnVWJQ92PhJ
a7nEAqRyQ2HfOkJciG5hdYyRaj4Qn8ba9hLlFG+0MTkQ31Fk9YcQkipOzkyTr21p
iUB3jnsQQQeto+s/22buRY0unu+yB3V0koppc0ECMQ+XyM5W4A0LQaXh9cLaloRj
F4umJHcjYnU6FiRcem+ZEDEV2D1koU9FztSmo4q+h50FNgiYk2lQ1MXE24Ny2YC4
3/ir4oKjhHswah6coflg8YtxMIlzTw==
=gSE1
-----END PGP SIGNATURE-----

--Sig_/WT+k+ePHoTcu=Rq6DTBR8a4--
