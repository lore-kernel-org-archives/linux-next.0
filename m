From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160128 build: 4 failures 9 warnings (next-20160128)
Date: Thu, 28 Jan 2016 10:16:02 +0000
Message-ID: <E1aOjcQ-0007JT-Fl@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50235 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932479AbcA1KQK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Jan 2016 05:16:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160128
Git describe: next-20160128
Commit: 888c837513 Add linux-next specific files for 20160128

Build Time: 67 min 15 sec

Passed:    5 / 9   ( 55.56 %)
Failed:    4 / 9   ( 44.44 %)

Errors: 2
Warnings: 9
Section Mismatches: 4

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm-allnoconfig
	arm64-defconfig

Errors:

	arm64-allnoconfig
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)

	arm64-allmodconfig
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)

	arm-allnoconfig
../include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory

	arm64-defconfig
../include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
      7 warnings    4 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 2
	114 ../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	  2 ../include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory

Warnings Summary: 9
	  4 ../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	  4 ../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	  3 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  2 ../fs/ocfs2/file.c:2198:1: warning: label 'relock' defined but not used [-Wunused-label]
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.text+0xcb8920): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/sunxi/built-in.o(.text+0x3d64): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.text+0x529e0): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.text+0x47812c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 48 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 66 errors, 4 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)
	../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)

Warnings:
	../fs/ocfs2/file.c:2198:1: warning: label 'relock' defined but not used [-Wunused-label]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 7 warnings, 4 section mismatches

Warnings:
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../fs/ocfs2/file.c:2198:1: warning: label 'relock' defined but not used [-Wunused-label]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

Section Mismatches:
	WARNING: drivers/clk/sunxi/built-in.o(.text+0x3d64): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.text+0x529e0): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.text+0x47812c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.text+0xcb8920): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
