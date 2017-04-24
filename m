From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170424 build: 1 failures 0 warnings (next-20170424)
Date: Mon, 24 Apr 2017 12:54:56 +0100
Message-ID: <E1d2ca0-0002cs-HH@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46178 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1169198AbdDXLzD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Apr 2017 07:55:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170424
Git describe: next-20170424
Commit: ee91aaf669 Add linux-next specific files for 20170424

Build Time: 116 min 41 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 0
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/gpu/drm/arm/mali-dp.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [drivers/gpu/drm/arm/mali-dp.ko] undefined!



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/gpu/drm/arm/mali-dp.ko] undefined!
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
