From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tegra tree with the rockchip tree
Date: Wed, 24 Apr 2019 09:43:23 +1000
Message-ID: <20190424094323.0ec123f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1H1Os2kHs_VtJEqpLXx0bwC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1H1Os2kHs_VtJEqpLXx0bwC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  arch/arm/configs/multi_v7_defconfig

between commit:

  366391f04177 ("ARM: multi_v7_defconfig: Enable missing drivers for suppor=
ted Chromebooks")

from the rockchip tree and commit:

  35f8e2e29e74 ("ARM: multi_v7_defconfig: Update for moved options")

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

diff --cc arch/arm/configs/multi_v7_defconfig
index 7a288d18e257,88d4da77ae9b..000000000000
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@@ -511,9 -501,6 +509,7 @@@ CONFIG_MFD_AC100=3D
  CONFIG_MFD_AXP20X_I2C=3Dy
  CONFIG_MFD_AXP20X_RSB=3Dy
  CONFIG_MFD_CROS_EC=3Dm
- CONFIG_CROS_EC_I2C=3Dm
- CONFIG_CROS_EC_SPI=3Dm
 +CONFIG_MFD_CROS_EC_CHARDEV=3Dm
  CONFIG_MFD_DA9063=3Dm
  CONFIG_MFD_MAX14577=3Dy
  CONFIG_MFD_MAX77686=3Dy

--Sig_/1H1Os2kHs_VtJEqpLXx0bwC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/oxsACgkQAVBC80lX
0Gyxvgf+NXaTqz9Kb7T6oNTeED+iHsRaE2EyKJ+L7XcENMrxt/Z42P/HPWvzPjQP
9NxEaH3DCRAM6nXonBg7AQZWnqWtkKikkmgZZypqifvq7G8cs8GDRH8nLaVkl9/I
GqyX0/UVWMQIL6y/yDgp+lFFevUKEIrooXtYkhFZPWbWOSob6lHXYB+m+85gnCqi
5Bed3/Eq7a6sxFqx00HN130UQ9CY5myPEbMDYbJj7stokzo+jx4MCzvAP5gNP4DC
Bf4UX/6flVjJrFOG2NjuTHlLvwru4muAGYjeqDGWTiRZG3hpUZm+N7+bFI084RDF
xED8JR7t2UIV3IYqDjtdLJoNiQu6gw==
=Flao
-----END PGP SIGNATURE-----

--Sig_/1H1Os2kHs_VtJEqpLXx0bwC--
