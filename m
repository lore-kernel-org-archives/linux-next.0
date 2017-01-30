From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170130 build: 1 failures 3 warnings (next-20170130)
Date: Mon, 30 Jan 2017 10:02:21 +0000
Message-ID: <E1cY8mz-0002o1-BW@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39442 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752501AbdA3KDD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Jan 2017 05:03:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170130
Git describe: next-20170130
Commit: 14dcd7ee9f Add linux-next specific files for 20170130

Build Time: 104 min 18 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 6
Warnings: 3
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/hsi/clients/cmt_speech.c:1114:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/armada/armada_gem.c:38:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/etnaviv/etnaviv_drv.c:468:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/etnaviv/etnaviv_gem.c:178:5: error: conflicting types for 'etnaviv_gem_fault'
../drivers/gpu/drm/omapdrm/omap_drv.c:696:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/omapdrm/omap_gem.c:531:5: error: conflicting types for 'omap_gem_fault'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Errors summary: 6
	  1 ../drivers/hsi/clients/cmt_speech.c:1114:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/omapdrm/omap_gem.c:531:5: error: conflicting types for 'omap_gem_fault'
	  1 ../drivers/gpu/drm/omapdrm/omap_drv.c:696:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/etnaviv/etnaviv_gem.c:178:5: error: conflicting types for 'etnaviv_gem_fault'
	  1 ../drivers/gpu/drm/etnaviv/etnaviv_drv.c:468:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/armada/armada_gem.c:38:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 3
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/pinctrl/mvebu/pinctrl-kirkwood.c:460:19: warning: unused variable 'res' [-Wunused-variable]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:816:40: warning: 'out_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 6 errors, 2 warnings, 0 section mismatches

Errors:
	../drivers/hsi/clients/cmt_speech.c:1114:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/armada/armada_gem.c:38:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/etnaviv/etnaviv_drv.c:468:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/etnaviv/etnaviv_gem.c:178:5: error: conflicting types for 'etnaviv_gem_fault'
	../drivers/gpu/drm/omapdrm/omap_drv.c:696:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/omapdrm/omap_gem.c:531:5: error: conflicting types for 'omap_gem_fault'

Warnings:
	../drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:816:40: warning: 'out_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/pinctrl/mvebu/pinctrl-kirkwood.c:460:19: warning: unused variable 'res' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
