From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151202 build: 3 failures 19 warnings (next-20151202)
Date: Thu, 03 Dec 2015 04:24:57 +0000
Message-ID: <E1a4LRx-0000se-Bh@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58531 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757388AbbLCEZD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 23:25:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151202
Git describe: next-20151202
Commit: 9e3f658a54 Add linux-next specific files for 20151202

Build Time: 64 min 38 sec

Passed:    6 / 9   ( 66.67 %)
Failed:    3 / 9   ( 33.33 %)

Errors: 1
Warnings: 19
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allnoconfig
../arch/arm64/mm/mmap.c:55:49: error: 'mmap_rnd_compat_bits' undeclared (first use in this function)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      8 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      8 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      5 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../arch/arm64/mm/mmap.c:55:49: error: 'mmap_rnd_compat_bits' undeclared (first use in this function)

Warnings Summary: 19
	  6 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  3 ../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../drivers/staging/iio/adc/mxs-lradc.c:322:42: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../sound/soc/sh/rcar/mix.c:127:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/dvc.c:315:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/codecs/da7218.c:2261:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../mm/page_alloc.c:4185:16: warning: comparison between 'enum zone_type' and 'enum <anonymous>' [-Wenum-compare]
	  1 ../drivers/staging/iio/adc/mxs-lradc.c:325:5: warning: large integer implicitly truncated to unsigned type [-Woverflow]
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
arm64-allmodconfig : FAIL, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	../sound/soc/codecs/da7218.c:2261:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/freescale/fsl_pq_mdio.c:468:6: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long int' [-Wformat=]
	../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/iio/adc/mxs-lradc.c:325:5: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/iio/adc/mxs-lradc.c:322:42: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/iio/adc/mxs-lradc.c:322:42: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/mix.c:127:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/dvc.c:315:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
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
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
