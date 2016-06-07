From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160607 build: 2 failures 9 warnings (next-20160607)
Date: Tue, 07 Jun 2016 08:35:02 +0100
Message-ID: <E1bABXS-0001YX-Cz@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46870 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893AbcFGHkN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2016 03:40:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160607
Git describe: next-20160607
Commit: 7b95734f90 Add linux-next specific files for 20160607

Build Time: 68 min 13 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 2
Warnings: 9
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h:19:27: fatal error: asm/dma-iommu.h: No such file or directory

	arm-allmodconfig
../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
     72 warnings    0 mismatches  : arm-allmodconfig
      4 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  3 ../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	  1 ../drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h:19:27: fatal error: asm/dma-iommu.h: No such file or directory

Warnings Summary: 9
	 66 ../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	  2 ../include/linux/err.h:21:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list
	  2 ../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want
	  2 ../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi5.c:123:6: warning: unused variable 'r' [-Wunused-variable]
	  1 ../drivers/gpu/drm/omapdrm/dss/dsi.c:1170:6: warning: unused variable 'r' [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 3 warnings, 0 section mismatches

Errors:
	../drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h:19:27: fatal error: asm/dma-iommu.h: No such file or directory

Warnings:
	../include/linux/err.h:21:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 3 errors, 72 warnings, 0 section mismatches

Errors:
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'

Warnings:
	../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list
	../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want
	../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../drivers/gpu/drm/omapdrm/dss/dsi.c:1170:6: warning: unused variable 'r' [-Wunused-variable]
	../drivers/gpu/drm/omapdrm/dss/hdmi5.c:123:6: warning: unused variable 'r' [-Wunused-variable]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list
	../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want
	../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list
	../include/linux/err.h:21:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
