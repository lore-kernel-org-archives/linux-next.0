From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160609 build: 1 failures 16 warnings (next-20160609)
Date: Thu, 09 Jun 2016 12:03:37 +0100
Message-ID: <E1bAxkP-0002O5-Dp@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53146 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750909AbcFILIu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2016 07:08:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160609
Git describe: next-20160609
Commit: 8f6027f7e8 Add linux-next specific files for 20160609

Build Time: 84 min 53 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 1
Warnings: 16
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
     80 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  3 ../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'

Warnings Summary: 16
	 66 ../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	  3 ../drivers/dma/xilinx/xilinx_vdma.c:1808:23: warning: 'segment' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../arch/arm/include/asm/pgtable.h:263:15: warning: 'entry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list
	  2 ../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want
	  2 ../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list
	  2 ../drivers/staging/ks7010/ks7010_config.c:263:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../include/linux/of.h:1002:20: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/infiniband/hw/rxe/rxe_dma.c:99:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/hw/rxe/rxe_dma.c:73:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/hw/rxe/rxe_dma.c:49:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/hw/rxe/rxe_dma.c:143:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi5.c:123:6: warning: unused variable 'r' [-Wunused-variable]
	  1 ../drivers/gpu/drm/omapdrm/dss/dsi.c:1170:6: warning: unused variable 'r' [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../drivers/dma/xilinx/xilinx_vdma.c:1808:23: warning: 'segment' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/ks7010/ks7010_config.c:263:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../arch/arm/include/asm/pgtable.h:263:15: warning: 'entry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/dma/xilinx/xilinx_vdma.c:1808:23: warning: 'segment' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 3 errors, 80 warnings, 0 section mismatches

Errors:
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'

Warnings:
	../arch/arm/include/asm/pgtable.h:263:15: warning: 'entry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list
	../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want
	../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list
	../include/linux/of.h:1002:20: warning: comparison of distinct pointer types lacks a cast
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
	../drivers/dma/xilinx/xilinx_vdma.c:1808:23: warning: 'segment' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/omapdrm/dss/dsi.c:1170:6: warning: unused variable 'r' [-Wunused-variable]
	../drivers/gpu/drm/omapdrm/dss/hdmi5.c:123:6: warning: unused variable 'r' [-Wunused-variable]
	../drivers/infiniband/hw/rxe/rxe_dma.c:49:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/infiniband/hw/rxe/rxe_dma.c:73:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/infiniband/hw/rxe/rxe_dma.c:99:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/infiniband/hw/rxe/rxe_dma.c:143:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/ks7010/ks7010_config.c:263:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/arm/include/asm/pgtable.h:263:15: warning: 'entry' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list
	../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want
	../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
x86_64-defconfig
