From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160622 build: 2 failures 5 warnings (next-20160622)
Date: Wed, 22 Jun 2016 09:28:52 +0100
Message-ID: <E1bFdWm-0001yi-4u@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58640 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbcFVI3Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jun 2016 04:29:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160622
Git describe: next-20160622
Commit: a37b237f49 Add linux-next specific files for 20160622

Build Time: 74 min 20 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 1
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm-allmodconfig
../include/linux/compiler-gcc.h:248:38: error: impossible constraint in 'asm'
../include/linux/compiler-gcc.h:248:38: error: impossible constraint in 'asm'
../include/linux/compiler-gcc.h:248:38: error: impossible constraint in 'asm'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
     68 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  3 ../include/linux/compiler-gcc.h:248:38: error: impossible constraint in 'asm'

Warnings Summary: 5
	 66 ../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	  2 ../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 3 errors, 68 warnings, 0 section mismatches

Errors:
	../include/linux/compiler-gcc.h:248:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:248:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:248:38: error: impossible constraint in 'asm'

Warnings:
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm64-defconfig
