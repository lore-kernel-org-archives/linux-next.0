From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160617 build: 1 failures 8 warnings (next-20160617)
Date: Fri, 17 Jun 2016 10:23:10 +0100
Message-ID: <E1bDpzY-00082r-Qh@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45102 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbcFQJ2X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Jun 2016 05:28:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160617
Git describe: next-20160617
Commit: ce24ed9ec7 Add linux-next specific files for 20160617

Build Time: 138 min 55 sec

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
      7 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
     70 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  3 ../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'

Warnings Summary: 8
	 66 ../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	  4 ../drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:82:6: warning: unused variable 'num_parents' [-Wunused-variable]
	  2 ../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/kfifo.h:403:39: warning: 'ge.id' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/staging/ks7010/ks7010_config.c:263:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	../drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:82:6: warning: unused variable 'num_parents' [-Wunused-variable]
	../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	../include/linux/kfifo.h:403:39: warning: 'ge.id' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/ks7010/ks7010_config.c:263:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:82:6: warning: unused variable 'num_parents' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 3 errors, 70 warnings, 0 section mismatches

Errors:
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'

Warnings:
	../drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:82:6: warning: unused variable 'num_parents' [-Wunused-variable]
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
	../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/ks7010/ks7010_config.c:263:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:82:6: warning: unused variable 'num_parents' [-Wunused-variable]
	../include/linux/kfifo.h:403:39: warning: 'ge.id' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
