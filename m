From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160301 build: 4 failures 11 warnings (next-20160301)
Date: Tue, 01 Mar 2016 07:22:51 +0000
Message-ID: <E1aaedu-0005ky-TR@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48208 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbcCAHXA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2016 02:23:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160301
Git describe: next-20160301
Commit: 6fa6381cb5 Add linux-next specific files for 20160301

Build Time: 0 min 30 sec

Passed:    5 / 9   ( 55.56 %)
Failed:    4 / 9   ( 44.44 %)

Errors: 2
Warnings: 11
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm-allmodconfig
	arm64-defconfig

Errors:

	arm64-allnoconfig
../arch/arm64/include/asm/kvm_host.h:375:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

	arm64-allmodconfig
../arch/arm64/include/asm/kvm_host.h:375:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

	arm-allmodconfig
../drivers/rtc/rtc-generic.c:12:21: fatal error: asm/rtc.h: No such file or directory

	arm64-defconfig
../arch/arm64/include/asm/kvm_host.h:375:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
     11 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  3 ../arch/arm64/include/asm/kvm_host.h:375:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]
	  1 ../drivers/rtc/rtc-generic.c:12:21: fatal error: asm/rtc.h: No such file or directory

Warnings Summary: 11
	  6 <stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  1 ../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/rtc/rtc-vr41xx.c:228:12: warning: 'vr41xx_rtc_alarm_irq_enable' defined but not used [-Wunused-function]
	  1 ../drivers/platform/goldfish/goldfish_pipe.c:312:3: warning: 'get_user_pages8' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/kvm_host.h:375:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/kvm_host.h:375:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 11 warnings, 0 section mismatches

Errors:
	../drivers/rtc/rtc-generic.c:12:21: fatal error: asm/rtc.h: No such file or directory

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/platform/goldfish/goldfish_pipe.c:312:3: warning: 'get_user_pages8' is deprecated [-Wdeprecated-declarations]
	../drivers/rtc/rtc-vr41xx.c:228:12: warning: 'vr41xx_rtc_alarm_irq_enable' defined but not used [-Wunused-function]
	../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/kvm_host.h:375:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
