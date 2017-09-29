From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170929 build: 2 failures 0 warnings (next-20170929)
Date: Fri, 29 Sep 2017 10:16:41 +0100
Message-ID: <E1dxrPV-0005oY-Vj@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:51914 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750709AbdI2JQo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Sep 2017 05:16:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170929
Git describe: next-20170929
Commit: 1418b85217 Add linux-next specific files for 20170929

Build Time: 100 min 26 sec

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
ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

	arm-allmodconfig
ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!
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
