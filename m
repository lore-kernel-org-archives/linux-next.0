From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160608 build: 1 failures 8 warnings (next-20160608)
Date: Wed, 08 Jun 2016 12:28:26 +0100
Message-ID: <E1bAber-0007JW-5P@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50214 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752893AbcFHLdg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jun 2016 07:33:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160608
Git describe: next-20160608
Commit: df091b3313 Add linux-next specific files for 20160608

Build Time: 158 min 40 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 1
Warnings: 8
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
      2 warnings    0 mismatches  : arm64-allmodconfig
     72 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  3 ../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'

Warnings Summary: 8
	 66 ../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
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
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
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
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../include/linux/compaction.h:237:51: warning: 'struct node' declared inside parameter list
	../include/linux/compaction.h:237:51: warning: its scope is only this definition or declaration, which is probably not what you want
	../include/linux/compaction.h:242:54: warning: 'struct node' declared inside parameter list
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
