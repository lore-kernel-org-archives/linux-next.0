From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170131 build: 2 failures 3 warnings (next-20170131)
Date: Tue, 31 Jan 2017 10:33:28 +0000
Message-ID: <E1cYVke-0001Pw-1e@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44250 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750941AbdAaKdg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Jan 2017 05:33:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170131
Git describe: next-20170131
Commit: 7c088bd91d Add linux-next specific files for 20170131

Build Time: 105 min 2 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

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
      1 warnings    0 mismatches  : x86_64-allnoconfig
      1 warnings    0 mismatches  : arm64-allnoconfig
      2 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 6
	  1 ../drivers/hsi/clients/cmt_speech.c:1114:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/omapdrm/omap_gem.c:531:5: error: conflicting types for 'omap_gem_fault'
	  1 ../drivers/gpu/drm/omapdrm/omap_drv.c:696:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/etnaviv/etnaviv_gem.c:178:5: error: conflicting types for 'etnaviv_gem_fault'
	  1 ../drivers/gpu/drm/etnaviv/etnaviv_drv.c:468:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/armada/armada_gem.c:38:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 3
	  3 ../drivers/char/random.c:318:12: warning: 'random_min_urandom_seed' defined but not used [-Wunused-variable]
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:815:40: warning: 'out_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/char/random.c:318:12: warning: 'random_min_urandom_seed' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/char/random.c:318:12: warning: 'random_min_urandom_seed' defined but not used [-Wunused-variable]

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
	../drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:815:40: warning: 'out_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/char/random.c:318:12: warning: 'random_min_urandom_seed' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allmodconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-multi_v4t_defconfig
arm64-defconfig
