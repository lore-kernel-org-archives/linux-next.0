From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170105 build: 4 failures 3 warnings (next-20170105)
Date: Thu, 05 Jan 2017 12:07:08 +0000
Message-ID: <E1cP6p1-0007i0-IF@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46596 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751335AbdAEMHg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2017 07:07:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170105
Git describe: next-20170105
Commit: ed93c117c1 Add linux-next specific files for 20170105

Build Time: 241 min 43 sec

Passed:    6 / 10   ( 60.00 %)
Failed:    4 / 10   ( 40.00 %)

Errors: 2
Warnings: 3
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm-allmodconfig
	arm64-defconfig

Errors:

	arm64-allnoconfig
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'

	arm64-allmodconfig
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'

	arm-allmodconfig
../samples/vfio-mdev/mtty.c:1418:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

	arm64-defconfig
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 2
	 24 ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	  1 ../samples/vfio-mdev/mtty.c:1418:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 3
	  2 ../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/power/supply/axp20x_usb_power.c:297:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 5 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 12 errors, 3 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'

Warnings:
	../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/power/supply/axp20x_usb_power.c:297:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	../samples/vfio-mdev/mtty.c:1418:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
	../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 7 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
