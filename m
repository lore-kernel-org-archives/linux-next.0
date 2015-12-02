From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the tegra tree with the arm-soc tree
Date: Wed, 2 Dec 2015 11:46:42 +0000
Message-ID: <20151202114642.1eda69352e8d753d09e09a71@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__2_Dec_2015_11_46_42_+0000_/eMElVQUMT5jj0_W"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57552 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757229AbbLBLq7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 06:46:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

--Signature=_Wed__2_Dec_2015_11_46_42_+0000_/eMElVQUMT5jj0_W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in arch/arm64/con=
figs/defconfig between commit e324654294907a4 ("ARM: use "depends on" for S=
oC configs instead of "if" after prompt") from the arm-soc tree and commit =
099a6644f5be4 ("soc/tegra: Provide per-SoC Kconfig symbols") from the tegra=
 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

diff --cc arch/arm/mach-tegra/Kconfig
index a90f3556017f,6f7bec07cda6..000000000000
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@@ -1,6 -1,5 +1,6 @@@
- menuconfig ARCH_TEGRA
+ config ARCH_TEGRA
 -	bool "NVIDIA Tegra" if ARCH_MULTI_V7
 +	bool "NVIDIA Tegra"
 +	depends on ARCH_MULTI_V7
  	select ARCH_REQUIRE_GPIOLIB
  	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
  	select ARM_AMBA

--Signature=_Wed__2_Dec_2015_11_46_42_+0000_/eMElVQUMT5jj0_W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXtoiAAoJECTWi3JdVIfQZlcIAIazoIhLAdo9EEhBKNasl6Ut
oV/slPZtq1ead7OGiX1P7htL4WdUDWARBFr/YZGzcTf0jI0/3PuGZiieDAji1LMx
fP58qDZvsmwUVQABG2tpY6nFVAxfxe2wA3QvyJS+gNJLtCO/i7iJzatrxcZ5cubD
9bVVFagOdX0T9mN7j0ZbymF9j14Jg8ZJXcJ1XqRdD/O9qOKiaQBEIH1Q7unpZitD
5gnLwAV+MplUFvv3341L1dogGyz+YqW769za2iYW/W8+i+cqWBFzrkB6w5bFXg7M
v2IDKAaxfNPILvE0Iuq4Fzs4SsfiUCp5IO5/mj1mjoDmfmLwxikU4C2yKAgn9sk=
=7btq
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Dec_2015_11_46_42_+0000_/eMElVQUMT5jj0_W--
