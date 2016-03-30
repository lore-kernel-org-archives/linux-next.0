From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160330 build: 1 failures 7 warnings (next-20160330)
Date: Wed, 30 Mar 2016 07:57:19 +0100
Message-ID: <E1alA47-0002T1-O5@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54300 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754638AbcC3G51 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Mar 2016 02:57:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160330
Git describe: next-20160330
Commit: 67130d02fe Add linux-next specific files for 20160330

Build Time: 131 min 50 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 1
Warnings: 7
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c:618:2: error: implicit declaration of function 'drm_connector_unplug_all' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
      6 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v5_defconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
      6 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig
      5 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c:618:2: error: implicit declaration of function 'drm_connector_unplug_all' [-Werror=implicit-function-declaration]

Warnings Summary: 7
	 11 <stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	 11 <stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	  2 ../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  2 ../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 arch/arm64/configs/defconfig:218:warning: override: reassigning to symbol MMC_BLOCK_MINORS
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

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
arm-allmodconfig : FAIL, 1 errors, 6 warnings, 0 section mismatches

Errors:
	../drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c:618:2: error: implicit declaration of function 'drm_connector_unplug_all' [-Werror=implicit-function-declaration]

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

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
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
