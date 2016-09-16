From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160916 build: 2 failures 15 warnings (next-20160916)
Date: Fri, 16 Sep 2016 08:46:37 +0100
Message-ID: <E1bknr2-0004OP-SZ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57570 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754082AbcIPHqq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Sep 2016 03:46:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160916
Git describe: next-20160916
Commit: ddf9d15aed Add linux-next specific files for 20160916

Build Time: 84 min 18 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 2
Warnings: 15
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

	arm-allmodconfig
ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      6 warnings    0 mismatches  : arm-multi_v5_defconfig
      7 warnings    0 mismatches  : arm-multi_v7_defconfig
     15 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm-allnoconfig
      3 warnings    0 mismatches  : arm-multi_v4t_defconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  2 ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
	  2 ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings Summary: 15
	  7 <stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	  7 <stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	  7 <stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	  3 ../drivers/mmc/host/meson-gxbb.c:411:22: warning: unused variable 'cmd' [-Wunused-variable]
	  2 ../drivers/dma/imx-sdma.c:673:13: warning: 'sdma_handle_channel_loop' defined but not used [-Wunused-function]
	  1 ../drivers/clk/zte/clk-zx296718.c:876:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clk/zte/clk-zx296718.c:863:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clk/zte/clk-zx296718.c:850:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clk/zte/clk-zx296718.c:771:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clk/zte/clk-zx296718.c:758:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clk/zte/clk-zx296718.c:745:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clk/zte/clk-zx296718.c:605:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clk/zte/clk-zx296718.c:592:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clk/zte/clk-zx296718.c:579:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clk/zte/clk-zx296718.c:554:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
	ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings:
	../drivers/mmc/host/meson-gxbb.c:411:22: warning: unused variable 'cmd' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	../drivers/dma/imx-sdma.c:673:13: warning: 'sdma_handle_channel_loop' defined but not used [-Wunused-function]
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 15 warnings, 0 section mismatches

Errors:
	ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
	ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	../drivers/clk/zte/clk-zx296718.c:554:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/clk/zte/clk-zx296718.c:579:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/clk/zte/clk-zx296718.c:592:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/clk/zte/clk-zx296718.c:605:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/clk/zte/clk-zx296718.c:745:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/clk/zte/clk-zx296718.c:758:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/clk/zte/clk-zx296718.c:771:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/clk/zte/clk-zx296718.c:850:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/clk/zte/clk-zx296718.c:863:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/clk/zte/clk-zx296718.c:876:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/dma/imx-sdma.c:673:13: warning: 'sdma_handle_channel_loop' defined but not used [-Wunused-function]
	../drivers/mmc/host/meson-gxbb.c:411:22: warning: unused variable 'cmd' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/mmc/host/meson-gxbb.c:411:22: warning: unused variable 'cmd' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
