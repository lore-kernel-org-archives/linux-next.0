From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160907 build: 1 failures 0 warnings (next-20160907)
Date: Wed, 07 Sep 2016 14:13:16 +0100
Message-ID: <E1bhcfD-000291-8Z@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59332 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757512AbcIGNNZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Sep 2016 09:13:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160907
Git describe: next-20160907
Commit: 322db72ea4 Add linux-next specific files for 20160907

Build Time: 147 min 16 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 0
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allmodconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
