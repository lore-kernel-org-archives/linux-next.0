From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160701 build: 2 failures 5 warnings (next-20160701)
Date: Fri, 01 Jul 2016 10:00:09 +0100
Message-ID: <E1bIuIz-00085X-RP@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33036 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751900AbcGAJAS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Jul 2016 05:00:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160701
Git describe: next-20160701
Commit: d936b5e461 Add linux-next specific files for 20160701

Build Time: 75 min 3 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 2
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1300:2: error: implicit declaration of function 'mtk_handle_irq' [-Werror=implicit-function-declaration]
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1300:25: error: subscripted value is neither array nor pointer nor vector

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1300:2: error: implicit declaration of function 'mtk_handle_irq' [-Werror=implicit-function-declaration]
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1300:25: error: subscripted value is neither array nor pointer nor vector

Warnings Summary: 5
	  5 ../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 4 warnings, 0 section mismatches

Errors:
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1300:2: error: implicit declaration of function 'mtk_handle_irq' [-Werror=implicit-function-declaration]
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1300:25: error: subscripted value is neither array nor pointer nor vector

Warnings:
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
x86_64-defconfig
