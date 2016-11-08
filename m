From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161108 build: 2 failures 1 warnings (next-20161108)
Date: Tue, 08 Nov 2016 10:39:01 +0000
Message-ID: <E1c43nx-0006yU-De@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41626 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752395AbcKHKjK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2016 05:39:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161108
Git describe: next-20161108
Commit: fa0208c825 Add linux-next specific files for 20161108

Build Time: 80 min 11 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 1
Warnings: 1
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)

	arm-allmodconfig
../drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ../drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)

Warnings Summary: 1
	  1 ../drivers/tty/serial/pxa.c:944:1: warning: 'serial_pxa_init' is deprecated [-Wdeprecated-declarations]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 1 warnings, 0 section mismatches

Errors:
	../drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)

Warnings:
	../drivers/tty/serial/pxa.c:944:1: warning: 'serial_pxa_init' is deprecated [-Wdeprecated-declarations]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
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
