From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170627 build: 1 failures 0 warnings (next-20170627)
Date: Tue, 27 Jun 2017 08:06:46 +0100
Message-ID: <E1dPkaE-00024G-FY@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51394 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751557AbdF0HJD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Jun 2017 03:09:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170627
Git describe: next-20170627
Commit: 89a39f3c70 Add linux-next specific files for 20170627

Build Time: 0 min 14 sec

Passed:    6 / 7   ( 85.71 %)
Failed:    1 / 7   ( 14.29 %)

Errors: 1
Warnings: 0
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
drivers/i2c/Kconfig:7:error: recursive dependency detected!
drivers/i2c/Kconfig:7:error: recursive dependency detected!
drivers/i2c/Kconfig:7:error: recursive dependency detected!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):

-------------------------------------------------------------------------------

Errors summary: 1
	 15 drivers/i2c/Kconfig:7:error: recursive dependency detected!



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/i2c/Kconfig:7:error: recursive dependency detected!
	drivers/i2c/Kconfig:7:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/i2c/Kconfig:7:error: recursive dependency detected!
	drivers/i2c/Kconfig:7:error: recursive dependency detected!

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/i2c/Kconfig:7:error: recursive dependency detected!
	drivers/i2c/Kconfig:7:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 3 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/i2c/Kconfig:7:error: recursive dependency detected!
	drivers/i2c/Kconfig:7:error: recursive dependency detected!
	drivers/i2c/Kconfig:7:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/i2c/Kconfig:7:error: recursive dependency detected!
	drivers/i2c/Kconfig:7:error: recursive dependency detected!

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/i2c/Kconfig:7:error: recursive dependency detected!
	drivers/i2c/Kconfig:7:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/i2c/Kconfig:7:error: recursive dependency detected!
	drivers/i2c/Kconfig:7:error: recursive dependency detected!
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
