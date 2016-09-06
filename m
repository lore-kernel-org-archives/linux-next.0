From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160906 build: 2 failures 0 warnings (next-20160906)
Date: Tue, 06 Sep 2016 09:45:43 +0100
Message-ID: <E1bhC0l-0003y3-Ls@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:32962 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932977AbcIFIpw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Sep 2016 04:45:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160906
Git describe: next-20160906
Commit: eb94d148a8 Add linux-next specific files for 20160906

Build Time: 83 min 57 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 1
Warnings: 0
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'

	arm-allmodconfig
../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'
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
