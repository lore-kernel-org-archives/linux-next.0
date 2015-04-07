From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with the arm-soc tree
Date: Tue, 7 Apr 2015 11:46:00 +1000
Message-ID: <20150407114600.14a3ecc8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//NmtmfFdJf4OlCu_NQSIbV+"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48263 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752825AbbDGBqG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Apr 2015 21:46:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Abhimanyu Kapur <abhimany@codeaurora.org>, Kumar Gala <galak@codeaurora.org>

--Sig_//NmtmfFdJf4OlCu_NQSIbV+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in
arch/arm64/configs/defconfig between commit d7f64a44356c ("arm64: qcom:
Add support for Qualcomm MSM8916 SoC") from the arm-soc tree and commit
475bfd3d67fa ("arm64: defconfig: updates for 4.1") from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/configs/defconfig
index 96bba367f80c,e07896c819ef..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -31,10 -31,12 +31,14 @@@ CONFIG_MODULES=3D
  CONFIG_MODULE_UNLOAD=3Dy
  # CONFIG_BLK_DEV_BSG is not set
  # CONFIG_IOSCHED_DEADLINE is not set
+ CONFIG_ARCH_EXYNOS7=3Dy
  CONFIG_ARCH_FSL_LS2085A=3Dy
  CONFIG_ARCH_MEDIATEK=3Dy
 +CONFIG_ARCH_QCOM=3Dy
 +CONFIG_ARCH_SPRD=3Dy
+ CONFIG_ARCH_SEATTLE=3Dy
+ CONFIG_ARCH_TEGRA=3Dy
+ CONFIG_ARCH_TEGRA_132_SOC=3Dy
  CONFIG_ARCH_THUNDER=3Dy
  CONFIG_ARCH_VEXPRESS=3Dy
  CONFIG_ARCH_XGENE=3Dy
@@@ -105,9 -104,10 +111,11 @@@ CONFIG_VIRTIO_CONSOLE=3D
  # CONFIG_HW_RANDOM is not set
  CONFIG_SPI=3Dy
  CONFIG_SPI_PL022=3Dy
 +CONFIG_PINCTRL_MSM8916=3Dy
  CONFIG_GPIO_PL061=3Dy
  CONFIG_GPIO_XGENE=3Dy
+ CONFIG_POWER_RESET_XGENE=3Dy
+ CONFIG_POWER_RESET_SYSCON=3Dy
  # CONFIG_HWMON is not set
  CONFIG_REGULATOR=3Dy
  CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
@@@ -133,10 -133,9 +141,11 @@@ CONFIG_MMC_SPI=3D
  CONFIG_RTC_CLASS=3Dy
  CONFIG_RTC_DRV_EFI=3Dy
  CONFIG_RTC_DRV_XGENE=3Dy
+ CONFIG_VIRTIO_PCI=3Dy
  CONFIG_VIRTIO_BALLOON=3Dy
  CONFIG_VIRTIO_MMIO=3Dy
 +CONFIG_COMMON_CLK_QCOM=3Dy
 +CONFIG_MSM_GCC_8916=3Dy
  # CONFIG_IOMMU_SUPPORT is not set
  CONFIG_PHY_XGENE=3Dy
  CONFIG_EXT2_FS=3Dy

--Sig_//NmtmfFdJf4OlCu_NQSIbV+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVIzbcAAoJEMDTa8Ir7ZwVTU4P/3vYm3DeDSwishurUl85s3DK
rxNZVvF55DuWKR9nRor/qGj/XwGajyS/GOEsHZukQJGvJlEqFdkcatvjfNBFZpN5
bXFnAu0S1uJbIcQ8ZD0qaSeoRHb8I4qsQ6hiiHkvN3v31qk7neI1dlCyAobjyJI/
W61TC+k13b2YmajOyVMxH2VQJcj3/nIBhOKcYSKMZzzDD/tzruwqxIkwBEa8OyiD
6gX4lcdHPeTma2dlG2tguWPUGWbwSaU2YthI5brmbx1iafSW/FG07BB1DJhNkYy+
WHIAmcJqShtaqggRHDFNvmRWby5Sv7Kiwn+AFuVihrYooLMoGKZgAOPA4unI/Spw
f1J3wmlYUGtgQP17MOk0ye+PKKhfUbQOcmWI7CA7MciSAUtd3bUHM2U0ufFtZnGA
KqFF9vz0KxlWIThuNnn7us9lF8I9rB2ilkiEUIKGNCuUTa46/VUvz+EKEjOObK8o
+JPlnwPP11yyU3OWsEhs+oh8ssTmdKdVl8wY79gGbDStEQVx8psf0koy5Q6a0OIM
tiJKTf2bZFQQZMFoG4/XO/Y6YADD8EGqCPzaPNytY3wlHsIyVbaOHD+9AfvEN+MR
m7vp0HvULAouCxmtIlTWCPqhbZKcBoQl2xoQQ0aRSgYB96RnWpF4s3+evaBAzFwT
OUvBw70YkA/eLCazhN7f
=TStE
-----END PGP SIGNATURE-----

--Sig_//NmtmfFdJf4OlCu_NQSIbV+--
