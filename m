From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161224 build: 3 failures 0 warnings (next-20161224)
Date: Sat, 24 Dec 2016 07:40:55 +0000
Message-ID: <E1cKgwp-00087U-Aw@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33930 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750867AbcLXHlE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Dec 2016 02:41:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161224
Git describe: next-20161224
Commit: 84ede50b62 Add linux-next specific files for 20161224

Build Time: 84 min 8 sec

Passed:    7 / 10   ( 70.00 %)
Failed:    3 / 10   ( 30.00 %)

Errors: 1
Warnings: 0
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
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

-------------------------------------------------------------------------------

Errors summary: 1
	 24 ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'



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
arm64-allmodconfig : FAIL, 12 errors, 0 warnings, 0 section mismatches

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
arm-allmodconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
