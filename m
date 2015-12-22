From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151222 build: 3 failures 13 warnings (next-20151222)
Date: Tue, 22 Dec 2015 08:57:20 +0000
Message-ID: <E1aBIky-0007nI-7t@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45766 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753684AbbLVI52 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Dec 2015 03:57:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151222
Git describe: next-20151222
Commit: 3248efff60 Add linux-next specific files for 20151222

Build Time: 65 min 34 sec

Passed:    6 / 9   ( 66.67 %)
Failed:    3 / 9   ( 33.33 %)

Errors: 5
Warnings: 13
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!
ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-mpp.ko] undefined!
ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-gpio.ko] undefined!

	arm-allmodconfig
/tmp/ccFxa9VJ.s:67: Error: selected processor does not support ARM mode `isb'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      5 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v5_defconfig
      8 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 5
	  1 ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
	  1 ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!
	  1 ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-mpp.ko] undefined!
	  1 ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-gpio.ko] undefined!
	  1 /tmp/ccFxa9VJ.s:67: Error: selected processor does not support ARM mode `isb'

Warnings Summary: 13
	  6 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  3 ../kernel/printk/nmi.c:143:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' [-Wformat]
	  2 ../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 arch/arm/configs/multi_v7_defconfig:433:warning: symbol value 'm' invalid for MFD_DA9063
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpio/gpiolib.c:193:20: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 4 errors, 5 warnings, 0 section mismatches

Errors:
	ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
	ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!
	ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-mpp.ko] undefined!
	ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-gpio.ko] undefined!

Warnings:
	../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../kernel/printk/nmi.c:143:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' [-Wformat]
	../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:433:warning: symbol value 'm' invalid for MFD_DA9063
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../kernel/printk/nmi.c:143:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' [-Wformat]
	../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 4 warnings, 0 section mismatches

Errors:
	/tmp/ccFxa9VJ.s:67: Error: selected processor does not support ARM mode `isb'

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../kernel/printk/nmi.c:143:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' [-Wformat]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpio/gpiolib.c:193:20: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
