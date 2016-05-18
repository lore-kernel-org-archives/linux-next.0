From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160518 build: 2 failures 20 warnings (next-20160518)
Date: Wed, 18 May 2016 08:05:26 +0100
Message-ID: <E1b2vXq-0003Ij-Ek@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40196 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752145AbcERHKk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 May 2016 03:10:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160518
Git describe: next-20160518
Commit: 621a2a0fb6 Add linux-next specific files for 20160518

Build Time: 68 min 57 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 4
Warnings: 20
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:8: error: too many arguments to function 'drm_gem_object_lookup'
../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:8: error: too many arguments to function 'drm_gem_object_lookup'

	arm-allmodconfig
../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:8: error: too many arguments to function 'drm_gem_object_lookup'
../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:8: error: too many arguments to function 'drm_gem_object_lookup'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
     18 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
      9 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : x86_64-allnoconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 4
	  2 ../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:8: error: too many arguments to function 'drm_gem_object_lookup'
	  2 ../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  2 ../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:8: error: too many arguments to function 'drm_gem_object_lookup'
	  2 ../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 20
	  6 ../fs/ext4/inode.c:3502:9: warning: unused variable 'offset' [-Wunused-variable]
	  6 ../fs/block_dev.c:1244:13: warning: 'blkdev_dax_capable' defined but not used [-Wunused-function]
	  3 ../mm/page_alloc.c:3658:5: warning: 'compact_result' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../drivers/gpu/drm/nouveau/nv50_display.c:1308:21: warning: unused variable 'dev' [-Wunused-variable]
	  3 ../drivers/gpu/drm/nouveau/nouveau_gem.c:371:21: warning: unused variable 'dev' [-Wunused-variable]
	  2 ../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]
	  2 ../drivers/pinctrl/stm32/pinctrl-stm32.c:797:17: warning: too many arguments for format [-Wformat-extra-args]
	  2 ../drivers/gpu/drm/radeon/radeon_cs.c:77:21: warning: unused variable 'ddev' [-Wunused-variable]
	  2 ../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:35: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
	  2 ../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:35: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
	  1 ../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/soc/mediatek/mtk-pmic-wrap.c:1086:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/soc/mediatek/mtk-pmic-wrap.c:1074:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/soc/mediatek/mtk-pmic-wrap.c:1062:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/gpu/drm/armada/armada_crtc.c:900:21: warning: unused variable 'dev' [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:3658:5: warning: 'compact_result' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 4 errors, 18 warnings, 0 section mismatches

Errors:
	../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:8: error: too many arguments to function 'drm_gem_object_lookup'
	../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:8: error: too many arguments to function 'drm_gem_object_lookup'

Warnings:
	../fs/block_dev.c:1244:13: warning: 'blkdev_dax_capable' defined but not used [-Wunused-function]
	../fs/ext4/inode.c:3502:9: warning: unused variable 'offset' [-Wunused-variable]
	../fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:35: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
	../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:35: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
	../drivers/gpu/drm/radeon/radeon_cs.c:77:21: warning: unused variable 'ddev' [-Wunused-variable]
	../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/nouveau/nouveau_gem.c:371:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/gpu/drm/nouveau/nv50_display.c:1308:21: warning: unused variable 'dev' [-Wunused-variable]
	../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/pinctrl/stm32/pinctrl-stm32.c:797:17: warning: too many arguments for format [-Wformat-extra-args]
	../drivers/soc/mediatek/mtk-pmic-wrap.c:1062:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/soc/mediatek/mtk-pmic-wrap.c:1074:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/soc/mediatek/mtk-pmic-wrap.c:1086:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/block_dev.c:1244:13: warning: 'blkdev_dax_capable' defined but not used [-Wunused-function]
	../fs/ext4/inode.c:3502:9: warning: unused variable 'offset' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../fs/block_dev.c:1244:13: warning: 'blkdev_dax_capable' defined but not used [-Wunused-function]
	../fs/ext4/inode.c:3502:9: warning: unused variable 'offset' [-Wunused-variable]
	../drivers/gpu/drm/nouveau/nouveau_gem.c:371:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/gpu/drm/nouveau/nv50_display.c:1308:21: warning: unused variable 'dev' [-Wunused-variable]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/block_dev.c:1244:13: warning: 'blkdev_dax_capable' defined but not used [-Wunused-function]
	../fs/ext4/inode.c:3502:9: warning: unused variable 'offset' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 4 errors, 9 warnings, 0 section mismatches

Errors:
	../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:8: error: too many arguments to function 'drm_gem_object_lookup'
	../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:30: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:8: error: too many arguments to function 'drm_gem_object_lookup'

Warnings:
	../fs/block_dev.c:1244:13: warning: 'blkdev_dax_capable' defined but not used [-Wunused-function]
	../fs/ext4/inode.c:3502:9: warning: unused variable 'offset' [-Wunused-variable]
	../drivers/gpu/drm/armada/armada_crtc.c:900:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:35: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
	../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:35: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
	../drivers/gpu/drm/radeon/radeon_cs.c:77:21: warning: unused variable 'ddev' [-Wunused-variable]
	../drivers/gpu/drm/nouveau/nouveau_gem.c:371:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/gpu/drm/nouveau/nv50_display.c:1308:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/pinctrl/stm32/pinctrl-stm32.c:797:17: warning: too many arguments for format [-Wformat-extra-args]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:3658:5: warning: 'compact_result' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:3658:5: warning: 'compact_result' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../fs/block_dev.c:1244:13: warning: 'blkdev_dax_capable' defined but not used [-Wunused-function]
	../fs/ext4/inode.c:3502:9: warning: unused variable 'offset' [-Wunused-variable]
	../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:
