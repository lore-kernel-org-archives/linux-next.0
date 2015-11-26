From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151126 build: 3 failures 15 warnings (next-20151126)
Date: Thu, 26 Nov 2015 09:06:25 +0000
Message-ID: <E1a1sVV-00079q-My@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49289 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753214AbbKZKE5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2015 05:04:57 -0500
Received: from cpc11-sgyl31-2-0-cust672.sgyl.cable.virginm.net ([94.175.94.161] helo=optimist)
	by mezzanine.sirena.org.uk with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <broonie@sirena.org.uk>)
	id 1a1tQ4-0005HZ-Tr
	for linux-next@vger.kernel.org; Thu, 26 Nov 2015 10:04:53 +0000
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151126
Git describe: next-20151126
Commit: 7dd2ecb6fa Add linux-next specific files for 20151126

Build Time: 64 min 1 sec

Passed:    6 / 9   ( 66.67 %)
Failed:    3 / 9   ( 33.33 %)

Errors: 7
Warnings: 15
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allnoconfig
../arch/arm64/mm/mmap.c:55:49: error: 'mmap_rnd_compat_bits' undeclared (first use in this function)

	arm64-allmodconfig
../drivers/net/ethernet/freescale/gianfar.c:650:33: error: 'NO_IRQ' undeclared (first use in this function)
../drivers/net/ethernet/freescale/gianfar_ptp.c:470:22: error: 'NO_IRQ' undeclared (first use in this function)
../drivers/net/wireless/ath/ath10k/thermal.c:119:6: error: redefinition of 'ath10k_thermal_event_temperature'
../drivers/net/wireless/ath/ath10k/thermal.c:136:6: error: redefinition of 'ath10k_thermal_set_throttling'
../drivers/net/wireless/ath/ath10k/thermal.c:162:5: error: redefinition of 'ath10k_thermal_register'
../drivers/net/wireless/ath/ath10k/thermal.c:216:6: error: redefinition of 'ath10k_thermal_unregister'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      7 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      5 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 7
	  1 ../drivers/net/wireless/ath/ath10k/thermal.c:216:6: error: redefinition of 'ath10k_thermal_unregister'
	  1 ../drivers/net/wireless/ath/ath10k/thermal.c:162:5: error: redefinition of 'ath10k_thermal_register'
	  1 ../drivers/net/wireless/ath/ath10k/thermal.c:136:6: error: redefinition of 'ath10k_thermal_set_throttling'
	  1 ../drivers/net/wireless/ath/ath10k/thermal.c:119:6: error: redefinition of 'ath10k_thermal_event_temperature'
	  1 ../drivers/net/ethernet/freescale/gianfar_ptp.c:470:22: error: 'NO_IRQ' undeclared (first use in this function)
	  1 ../drivers/net/ethernet/freescale/gianfar.c:650:33: error: 'NO_IRQ' undeclared (first use in this function)
	  1 ../arch/arm64/mm/mmap.c:55:49: error: 'mmap_rnd_compat_bits' undeclared (first use in this function)

Warnings Summary: 15
	  6 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  1 ../sound/soc/sh/rcar/mix.c:127:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/dvc.c:315:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5470:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5470:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../mm/page_alloc.c:4185:16: warning: comparison between 'enum zone_type' and 'enum <anonymous>' [-Wenum-compare]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/qlogic/qed/qed_dev.c:1676:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/net/ethernet/freescale/fsl_pq_mdio.c:468:6: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long int' [-Wformat=]
	  1 ../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:6: warning: unused variable 'i' [-Wunused-variable]
	  1 ../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:380:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/mm/mmap.c:55:49: error: 'mmap_rnd_compat_bits' undeclared (first use in this function)

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 6 errors, 4 warnings, 0 section mismatches

Errors:
	../drivers/net/ethernet/freescale/gianfar.c:650:33: error: 'NO_IRQ' undeclared (first use in this function)
	../drivers/net/ethernet/freescale/gianfar_ptp.c:470:22: error: 'NO_IRQ' undeclared (first use in this function)
	../drivers/net/wireless/ath/ath10k/thermal.c:119:6: error: redefinition of 'ath10k_thermal_event_temperature'
	../drivers/net/wireless/ath/ath10k/thermal.c:136:6: error: redefinition of 'ath10k_thermal_set_throttling'
	../drivers/net/wireless/ath/ath10k/thermal.c:162:5: error: redefinition of 'ath10k_thermal_register'
	../drivers/net/wireless/ath/ath10k/thermal.c:216:6: error: redefinition of 'ath10k_thermal_unregister'

Warnings:
	../drivers/net/ethernet/freescale/fsl_pq_mdio.c:468:6: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long int' [-Wformat=]
	../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:5470:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5470:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/mix.c:127:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/dvc.c:315:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:4185:16: warning: comparison between 'enum zone_type' and 'enum <anonymous>' [-Wenum-compare]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:380:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/net/ethernet/qlogic/qed/qed_dev.c:1676:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-defconfig
