From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160623 build: 2 failures 12 warnings (next-20160623)
Date: Thu, 23 Jun 2016 12:34:54 +0100
Message-ID: <E1bG2uK-0006S4-UB@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34072 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752272AbcFWLkI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jun 2016 07:40:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160623
Git describe: next-20160623
Commit: 5c4d1ca9cf Add linux-next specific files for 20160623

Build Time: 135 min 20 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 1
Warnings: 12
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
      6 warnings    0 mismatches  : arm64-allmodconfig
     16 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
     68 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : x86_64-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  3 ../include/linux/compiler-gcc.h:248:38: error: impossible constraint in 'asm'

Warnings Summary: 12
	 66 ../include/linux/compiler-gcc.h:248:38: warning: asm operand 0 probably doesn't match constraints
	  8 ../include/linux/vmstat.h:117:34: warning: array subscript is above array bounds [-Warray-bounds]
	  8 ../include/linux/vmstat.h:116:35: warning: array subscript is above array bounds [-Warray-bounds]
	  2 ../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/prefetch.h:42:22: warning: array subscript is above array bounds [-Warray-bounds]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/misc/genwqe/card_base.c:1155:6: warning: unused variable 'bars' [-Wunused-variable]
	  1 ../drivers/misc/genwqe/card_base.c:1143:2: warning: 'bars' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/base/node.c:127:31: warning: passing argument 1 of 'node_page_state' makes pointer from integer without a cast [-Wint-conversion]
	  1 ../drivers/base/node.c:127:31: warning: passing argument 1 of 'node_page_state' makes pointer from integer without a cast
	  1 ../arch/x86/include/asm/atomic64_64.h:45:2: warning: array subscript is above array bounds [-Warray-bounds]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../drivers/base/node.c:127:31: warning: passing argument 1 of 'node_page_state' makes pointer from integer without a cast [-Wint-conversion]
	../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/misc/genwqe/card_base.c:1155:6: warning: unused variable 'bars' [-Wunused-variable]
	../drivers/misc/genwqe/card_base.c:1143:2: warning: 'bars' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 16 warnings, 0 section mismatches

Warnings:
	../include/linux/vmstat.h:116:35: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:116:35: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:117:34: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:117:34: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:116:35: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:116:35: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:117:34: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:117:34: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:116:35: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:116:35: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:117:34: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:117:34: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:116:35: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:116:35: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:117:34: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/vmstat.h:117:34: warning: array subscript is above array bounds [-Warray-bounds]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/base/node.c:127:31: warning: passing argument 1 of 'node_page_state' makes pointer from integer without a cast

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
arm-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/linux/prefetch.h:42:22: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/prefetch.h:42:22: warning: array subscript is above array bounds [-Warray-bounds]

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/x86/include/asm/atomic64_64.h:45:2: warning: array subscript is above array bounds [-Warray-bounds]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v7_defconfig
arm64-defconfig
