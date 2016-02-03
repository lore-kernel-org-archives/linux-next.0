From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160203 build: 2 failures 8 warnings (next-20160203)
Date: Wed, 03 Feb 2016 08:19:07 +0000
Message-ID: <E1aQseY-0000bY-Sf@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60411 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754843AbcBCITP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2016 03:19:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160203
Git describe: next-20160203
Commit: 8babd99a86 Add linux-next specific files for 20160203

Build Time: 82 min 10 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 7
Warnings: 8
Section Mismatches: 4

Failed defconfigs:
	x86_64-defconfig
	arm-allnoconfig

Errors:

	x86_64-defconfig
../fs/proc/task_mmu.c:596:2: error: implicit declaration of function 'is_huge_zero_pud' [-Werror=implicit-function-declaration]
../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_599' declared with attribute error: BUILD_BUG failed
../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_602' declared with attribute error: BUILD_BUG failed
../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_604' declared with attribute error: BUILD_BUG failed
../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_607' declared with attribute error: BUILD_BUG failed
../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_609' declared with attribute error: BUILD_BUG failed

	arm-allnoconfig
../include/linux/pfn_t.h:108:7: error: 'pud_mkdevmap' declared as function returning an array

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      3 warnings    0 mismatches  : arm-multi_v7_defconfig
     14 warnings    4 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 7
	  1 ../include/linux/pfn_t.h:108:7: error: 'pud_mkdevmap' declared as function returning an array
	  1 ../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_609' declared with attribute error: BUILD_BUG failed
	  1 ../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_607' declared with attribute error: BUILD_BUG failed
	  1 ../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_604' declared with attribute error: BUILD_BUG failed
	  1 ../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_602' declared with attribute error: BUILD_BUG failed
	  1 ../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_599' declared with attribute error: BUILD_BUG failed
	  1 ../fs/proc/task_mmu.c:596:2: error: implicit declaration of function 'is_huge_zero_pud' [-Werror=implicit-function-declaration]

Warnings Summary: 8
	  7 ../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	  4 ../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	  4 ../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.text+0xbd74d4): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/sunxi/built-in.o(.text+0x3b8c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.text+0x4e4b4): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.text+0x424a9c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
x86_64-defconfig : FAIL, 6 errors, 0 warnings, 0 section mismatches

Errors:
	../fs/proc/task_mmu.c:596:2: error: implicit declaration of function 'is_huge_zero_pud' [-Werror=implicit-function-declaration]
	../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_599' declared with attribute error: BUILD_BUG failed
	../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_602' declared with attribute error: BUILD_BUG failed
	../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_604' declared with attribute error: BUILD_BUG failed
	../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_607' declared with attribute error: BUILD_BUG failed
	../include/linux/compiler.h:505:38: error: call to '__compiletime_assert_609' declared with attribute error: BUILD_BUG failed

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 14 warnings, 4 section mismatches

Warnings:
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

Section Mismatches:
	WARNING: drivers/clk/sunxi/built-in.o(.text+0x3b8c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.text+0x4e4b4): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.text+0x424a9c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.text+0xbd74d4): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../include/linux/pfn_t.h:108:7: error: 'pud_mkdevmap' declared as function returning an array

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
