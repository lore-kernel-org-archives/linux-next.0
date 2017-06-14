From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170614 build: 0 failures 1 warnings (next-20170614)
Date: Wed, 14 Jun 2017 09:05:33 +0100
Message-ID: <E1dL3Iz-00020U-3i@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58640 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754278AbdFNIFi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jun 2017 04:05:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170614
Git describe: next-20170614
Commit: b14746170b Add linux-next specific files for 20170614

Build Time: 0 min 13 sec

Passed:    7 / 7   (100.00 %)
Failed:    0 / 7   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  1 ../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
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
