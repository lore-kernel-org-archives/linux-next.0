From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170103 build: 4 failures 2 warnings (next-20170103)
Date: Tue, 03 Jan 2017 08:51:02 +0000
Message-ID: <E1cOKoA-0000sR-RL@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49156 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756904AbdACIvM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2017 03:51:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170103
Git describe: next-20170103
Commit: 533d7e3a9f Add linux-next specific files for 20170103

Build Time: 89 min 31 sec

Passed:    6 / 10   ( 60.00 %)
Failed:    4 / 10   ( 40.00 %)

Errors: 2
Warnings: 2
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
      2 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 2
	 24 ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
	  1 ../samples/vfio-mdev/mtty.c:1418:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 2
	  2 ../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]



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
arm64-allmodconfig : FAIL, 12 errors, 2 warnings, 0 section mismatches

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
