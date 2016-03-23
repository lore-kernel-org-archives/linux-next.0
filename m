From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160323 build: 1 failures 9 warnings (next-20160323)
Date: Wed, 23 Mar 2016 16:56:57 +0000
Message-ID: <E1aim5Y-0006dx-W2@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59898 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756015AbcCWQ5I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Mar 2016 12:57:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160323
Git describe: next-20160323
Commit: 288a3fcc13 Add linux-next specific files for 20160323

Build Time: 151 min 11 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 5
Warnings: 9
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/staging/fsl-mc/bus/mc-bus.c:263:11: error: passing argument 1 of 'dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/staging/fsl-mc/bus/mc-bus.c:270:11: error: passing argument 1 of 'dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/staging/fsl-mc/bus/mc-sys.c:331:12: error: passing argument 2 of '__dynamic_dev_dbg' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/staging/fsl-mc/bus/mc-sys.c:373:12: error: passing argument 2 of '__dynamic_dev_dbg' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/staging/fsl-mc/bus/mc-sys.c:429:11: error: passing argument 2 of '__dynamic_dev_dbg' from incompatible pointer type [-Werror=incompatible-pointer-types]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
      4 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v5_defconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
     10 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig
      5 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 5
	  1 ../drivers/staging/fsl-mc/bus/mc-sys.c:429:11: error: passing argument 2 of '__dynamic_dev_dbg' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/staging/fsl-mc/bus/mc-sys.c:373:12: error: passing argument 2 of '__dynamic_dev_dbg' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/staging/fsl-mc/bus/mc-sys.c:331:12: error: passing argument 2 of '__dynamic_dev_dbg' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/staging/fsl-mc/bus/mc-bus.c:270:11: error: passing argument 1 of 'dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/staging/fsl-mc/bus/mc-bus.c:263:11: error: passing argument 1 of 'dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 9
	 11 <stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	 11 <stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	  2 ../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  2 ../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 arch/arm64/configs/defconfig:218:warning: override: reassigning to symbol MMC_BLOCK_MINORS
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 5 errors, 4 warnings, 0 section mismatches

Errors:
	../drivers/staging/fsl-mc/bus/mc-bus.c:263:11: error: passing argument 1 of 'dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/staging/fsl-mc/bus/mc-bus.c:270:11: error: passing argument 1 of 'dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/staging/fsl-mc/bus/mc-sys.c:331:12: error: passing argument 2 of '__dynamic_dev_dbg' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/staging/fsl-mc/bus/mc-sys.c:373:12: error: passing argument 2 of '__dynamic_dev_dbg' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/staging/fsl-mc/bus/mc-sys.c:429:11: error: passing argument 2 of '__dynamic_dev_dbg' from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	arch/arm64/configs/defconfig:218:warning: override: reassigning to symbol MMC_BLOCK_MINORS
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
