From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rockchip tree with the amlogic tree
Date: Wed, 24 Apr 2019 09:31:37 +1000
Message-ID: <20190424093137.241407fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/atGx+6m8WlmrfbYda2zvk7q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
List-Id: linux-next.vger.kernel.org

--Sig_/atGx+6m8WlmrfbYda2zvk7q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rockchip tree got a conflict in:

  arch/arm/configs/multi_v7_defconfig

between commit:

  029da5e5266c ("ARM: multi_v7_defconfig: enable the Amlogic Meson ADC and =
eFuse drivers")

from the amlogic tree and commit:

  366391f04177 ("ARM: multi_v7_defconfig: Enable missing drivers for suppor=
ted Chromebooks")

from the rockchip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/configs/multi_v7_defconfig
index 1fd4b8fcce2e,d160ac4bad21..000000000000
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@@ -984,7 -989,7 +994,8 @@@ CONFIG_PHY_UNIPHIER_USB2=3D
  CONFIG_OMAP_USB2=3Dy
  CONFIG_TI_PIPE3=3Dy
  CONFIG_TWL4030_USB=3Dm
 +CONFIG_MESON_MX_EFUSE=3Dm
+ CONFIG_ROCKCHIP_EFUSE=3Dm
  CONFIG_NVMEM_IMX_OCOTP=3Dy
  CONFIG_NVMEM_SUNXI_SID=3Dy
  CONFIG_NVMEM_VF610_OCOTP=3Dy

--Sig_/atGx+6m8WlmrfbYda2zvk7q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/oFkACgkQAVBC80lX
0GyW5gf8D0GjQLjDCeC/nhESyvTmBIJ/wHVMtSbyCOlXWeIw4lmBKm8G5V7W89aM
+qbuiWPBIIJlvzaQSAmJxAbWvsoTJaeQ8fS7+O6wUa5FaW4lOOLqx1cDArquFxBf
5suwz1g/gKRJdcCGiFx1P6blwiK4NcgBCAjd1V5+RF01xBSINJew3Z+MY09aJKWY
9F4CUMG0lFjJ3CpRcPnDwIKHPmHyVN/KX/eXzGSRUBTARWcIQ8zUnx95B7mUffL+
8GZp2wcswn/9i5bpW4zw/Z6mH0j9ISA0qg/w4hO19hsAkthcs3SgG4+WKZDSbOLb
yLR+gcTy+5UwwDBFrSMyYIuf6PFOuA==
=W1vu
-----END PGP SIGNATURE-----

--Sig_/atGx+6m8WlmrfbYda2zvk7q--
