From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160202 build: 0 failures 18 warnings (next-20160202)
Date: Tue, 02 Feb 2016 08:31:23 +0000
Message-ID: <E1aQWMt-0001AC-Kh@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58749 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753981AbcBBIbc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2016 03:31:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160202
Git describe: next-20160202
Commit: 65df5e9388 Add linux-next specific files for 20160202

Build Time: 81 min 53 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 18
Section Mismatches: 4

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
     12 warnings    0 mismatches  : arm-multi_v7_defconfig
     15 warnings    4 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 18
	  7 ../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	  4 ../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	  4 ../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  2 ../fs/ocfs2/file.c:2198:1: warning: label 'relock' defined but not used [-Wunused-label]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/clk/clk-vt8500.c:539:12: warning: 'best_div2' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/clk/clk-vt8500.c:538:12: warning: 'best_div1' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/clk/clk-vt8500.c:537:14: warning: 'best_mul' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/clk/clk-vt8500.c:495:12: warning: 'best_div2' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/clk/clk-vt8500.c:493:14: warning: 'best_mul' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/clk/clk-vt8500.c:492:12: warning: 'best_div1' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/clk/clk-vt8500.c:423:12: warning: 'best_div2' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/clk/clk-vt8500.c:422:12: warning: 'best_div1' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/clk/clk-vt8500.c:421:14: warning: 'best_mul' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.text+0xbd5ca4): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/sunxi/built-in.o(.text+0x3b8c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.text+0x4e49c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.text+0x424a34): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../fs/ocfs2/file.c:2198:1: warning: label 'relock' defined but not used [-Wunused-label]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 12 warnings, 0 section mismatches

Warnings:
	../drivers/clk/clk-vt8500.c:423:12: warning: 'best_div2' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/clk/clk-vt8500.c:422:12: warning: 'best_div1' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/clk/clk-vt8500.c:421:14: warning: 'best_mul' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/clk/clk-vt8500.c:495:12: warning: 'best_div2' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/clk/clk-vt8500.c:492:12: warning: 'best_div1' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/clk/clk-vt8500.c:493:14: warning: 'best_mul' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/clk/clk-vt8500.c:539:12: warning: 'best_div2' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/clk/clk-vt8500.c:538:12: warning: 'best_div1' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/clk/clk-vt8500.c:537:14: warning: 'best_mul' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 15 warnings, 4 section mismatches

Warnings:
	../fs/ocfs2/file.c:2198:1: warning: label 'relock' defined but not used [-Wunused-label]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

Section Mismatches:
	WARNING: drivers/clk/sunxi/built-in.o(.text+0x3b8c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.text+0x4e49c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.text+0x424a34): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.text+0xbd5ca4): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
x86_64-defconfig
