From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161222 build: 3 failures 0 warnings (next-20161222)
Date: Thu, 22 Dec 2016 05:30:09 +0000
Message-ID: <E1cJvxB-0003tv-HM@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40936 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933708AbcLVFaS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Dec 2016 00:30:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161222
Git describe: next-20161222
Commit: 49358776a0 Add linux-next specific files for 20161222

Build Time: 83 min 57 sec

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
