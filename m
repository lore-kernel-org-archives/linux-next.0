From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170613 build: 0 failures 2 warnings (next-20170613)
Date: Tue, 13 Jun 2017 11:43:38 +0100
Message-ID: <E1dKjIQ-0007Yz-GQ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45974 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751895AbdFMKnp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jun 2017 06:43:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170613
Git describe: next-20170613
Commit: bc4c75f41a Add linux-next specific files for 20170613

Build Time: 0 min 11 sec

Passed:    7 / 7   (100.00 %)
Failed:    0 / 7   (  0.00 %)

Errors: 0
Warnings: 2
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Warnings Summary: 2
	  1 ../net/core/dev.c:8330:2: warning: 'remsd' is used uninitialized in this function [-Wuninitialized]
	  1 ../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../net/core/dev.c:8330:2: warning: 'remsd' is used uninitialized in this function [-Wuninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-multi_v7_defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
x86_64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
