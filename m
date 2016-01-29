From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160129 build: 0 failures 10 warnings (next-20160129)
Date: Fri, 29 Jan 2016 11:39:26 +0000
Message-ID: <E1aP7Of-0006IT-KD@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52142 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755538AbcA2Ljf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jan 2016 06:39:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160129
Git describe: next-20160129
Commit: 735cfa5115 Add linux-next specific files for 20160129

Build Time: 137 min 33 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 10
Section Mismatches: 4

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
     13 warnings    0 mismatches  : arm-multi_v7_defconfig
      8 warnings    0 mismatches  : x86_64-defconfig
      7 warnings    4 mismatches  : arm-allmodconfig
      5 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 10
	 20 ../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	  4 ../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	  4 ../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  2 ../fs/ocfs2/file.c:2198:1: warning: label 'relock' defined but not used [-Wunused-label]
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.text+0xcb7b40): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/sunxi/built-in.o(.text+0x3d64): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.text+0x529e0): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.text+0x47736c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)



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
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 13 warnings, 0 section mismatches

Warnings:
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/usb/host/xhci.c:2440:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]
	../drivers/usb/host/xhci.c:2499:2: warning: enumeration value 'USB_SPEED_SUPER_PLUS' not handled in switch [-Wswitch]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]

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
	WARNING: drivers/built-in.o(.text+0x47736c): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.text+0xcb7b40): Section mismatch in reference from the function sun6i_a31_ar100_clk_probe() to the (unknown reference) .init.rodata:(unknown)

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
