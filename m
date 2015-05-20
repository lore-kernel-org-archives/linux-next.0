From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the at91 tree with the arm-soc tree
Date: Wed, 20 May 2015 10:08:51 +1000
Message-ID: <20150520100851.2e485c02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hPgwHTMh.bwzOdf7_tHXAWx"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41788 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751132AbbETAJC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 May 2015 20:09:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

--Sig_/hPgwHTMh.bwzOdf7_tHXAWx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Today's linux-next merge of the at91 tree got a conflict in
arch/arm/configs/multi_v7_defconfig between commit 7b57472fb6cb ("ARM:
multi_v7_defconfig: enable asm and NEON accelerated crypto modules")
from the arm-soc tree and commit 822cfdfb9511 ("ARM:
multi_v7_defconfig: Add Atmel SAMA5 family") from the at91 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/configs/multi_v7_defconfig
index 492f6289a29e,cf56d4072a90..000000000000
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@@ -272,9 -278,9 +283,10 @@@ CONFIG_I2C_DAVINCI=3D
  CONFIG_I2C_MUX=3Dy
  CONFIG_I2C_MUX_PCA954x=3Dy
  CONFIG_I2C_MUX_PINCTRL=3Dy
+ CONFIG_I2C_AT91=3Dm
  CONFIG_I2C_CADENCE=3Dy
  CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
 +CONFIG_I2C_DIGICOLOR=3Dm
  CONFIG_I2C_GPIO=3Dm
  CONFIG_I2C_EXYNOS5=3Dy
  CONFIG_I2C_MV64XXX=3Dy
@@@ -514,8 -523,9 +530,10 @@@ CONFIG_RTC_DRV_TPS6586X=3D
  CONFIG_RTC_DRV_TPS65910=3Dy
  CONFIG_RTC_DRV_S35390A=3Dm
  CONFIG_RTC_DRV_EM3027=3Dy
 +CONFIG_RTC_DRV_DIGICOLOR=3Dm
  CONFIG_RTC_DRV_PL031=3Dy
+ CONFIG_RTC_DRV_AT91RM9200=3Dm
+ CONFIG_RTC_DRV_AT91SAM9=3Dm
  CONFIG_RTC_DRV_VT8500=3Dy
  CONFIG_RTC_DRV_SUN6I=3Dy
  CONFIG_RTC_DRV_SUNXI=3Dy
@@@ -599,14 -613,6 +622,17 @@@ CONFIG_LOCKUP_DETECTOR=3D
  CONFIG_CRYPTO_DEV_TEGRA_AES=3Dy
  CONFIG_CPUFREQ_DT=3Dy
  CONFIG_KEYSTONE_IRQ=3Dy
 +CONFIG_ARM_CRYPTO=3Dy
 +CONFIG_CRYPTO_SHA1_ARM=3Dm
 +CONFIG_CRYPTO_SHA1_ARM_NEON=3Dm
 +CONFIG_CRYPTO_SHA1_ARM_CE=3Dm
 +CONFIG_CRYPTO_SHA2_ARM_CE=3Dm
 +CONFIG_CRYPTO_SHA256_ARM=3Dm
 +CONFIG_CRYPTO_SHA512_ARM=3Dm
 +CONFIG_CRYPTO_AES_ARM=3Dm
 +CONFIG_CRYPTO_AES_ARM_BS=3Dm
 +CONFIG_CRYPTO_AES_ARM_CE=3Dm
 +CONFIG_CRYPTO_GHASH_ARM_CE=3Dm
+ CONFIG_CRYPTO_DEV_ATMEL_AES=3Dm
+ CONFIG_CRYPTO_DEV_ATMEL_TDES=3Dm
+ CONFIG_CRYPTO_DEV_ATMEL_SHA=3Dm

--Sig_/hPgwHTMh.bwzOdf7_tHXAWx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVW9CbAAoJEMDTa8Ir7ZwVM9MP/0VlYuFAk9v2dwye0/nsWt4h
zramyx/7hi2ibM3F9D/EPLLbjvTLYqIHpcv2/UEh8zKwZ7FdnPkygWhd7fEKRk7a
+inKksUuk/0PDEvbfk3AUXwDZMcte3dyP0drY+gmm/KM2KoUwzJwiTLB3Qjlm5Ru
3v9oX9Hs/eFX4B6eX5CdgL4od/P5X13Orl++YFQu2eVNc0NxPuQ4pyO1Y/ym7LE6
5z8yJ2xkJE82tGigx/nnmMs9HIi7ClYVJhF2eeR52zqbNcXhwwmmx0ayUD7f2XwX
C/u8UppYkG7i7WU3PYLkP+Q91hiK3hmROmV9tD/3k029s3GQ3pxgoN3xahCyXep0
1faLifjNC4CQ9/XOJnZRDg/s/ZFuALcBCiy42PQXIxylVXWY8pVu58ueEF5WRgUr
P2x63Rt5u6qiJIl965qsaupXxxderHhVdXUZjkORNaYrmFRtIp0T7AQJkIsQFQPX
OaWBgJ66eCRBfxwK8cVUCeJUQp5/9YC9b4nWvIc0ac9cEGvp3tKXkgMjunkH9Tam
oWASpUSOAI6a6nsjApXcQVjbMR7oXLN2XXjR6Z9+U+VMuqprlT3mR7eVpM9kqTT3
JTVI+FlE1OPnkK6krhNjB1OTLx7c9DjScNj5emCa6mydW3Nte4KnJ0m0zqn7+6Kr
p9VryJ7j7LLI4ltyTN6D
=eKeR
-----END PGP SIGNATURE-----

--Sig_/hPgwHTMh.bwzOdf7_tHXAWx--
