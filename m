From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160624 build: 2 failures 4 warnings (next-20160624)
Date: Fri, 24 Jun 2016 12:49:52 +0100
Message-ID: <E1bGPcN-0002My-2x@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36858 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751241AbcFXLuA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Jun 2016 07:50:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160624
Git describe: next-20160624
Commit: 2cf991dfda Add linux-next specific files for 20160624

Build Time: 119 min 23 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 1
Warnings: 4
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
      3 warnings    0 mismatches  : arm64-allmodconfig
     68 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  3 ../include/linux/compiler-gcc.h:248:38: error: impossible constraint in 'asm'

Warnings Summary: 4
	 66 ../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	  2 ../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]

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
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
