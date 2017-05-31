From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170531 build: 0 failures 1 warnings (next-20170531)
Date: Wed, 31 May 2017 10:21:55 +0100
Message-ID: <E1dFzpD-0005zl-EU@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44128 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbdEaJWD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 May 2017 05:22:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170531
Git describe: next-20170531
Commit: f2882f46b6 Add linux-next specific files for 20170531

Build Time: 118 min 56 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  6 ../drivers/gpio/gpiolib.c:1474:6: warning: unused variable 'i' [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpio/gpiolib.c:1474:6: warning: unused variable 'i' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpio/gpiolib.c:1474:6: warning: unused variable 'i' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpio/gpiolib.c:1474:6: warning: unused variable 'i' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpio/gpiolib.c:1474:6: warning: unused variable 'i' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpio/gpiolib.c:1474:6: warning: unused variable 'i' [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpio/gpiolib.c:1474:6: warning: unused variable 'i' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
x86_64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
