From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170928 build: 2 failures 1 warnings (next-20170928)
Date: Thu, 28 Sep 2017 11:03:40 +0100
Message-ID: <E1dxVfQ-0006X5-K8@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58874 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752564AbdI1KDn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Sep 2017 06:03:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170928
Git describe: next-20170928
Commit: 00d47fc93a Add linux-next specific files for 20170928

Build Time: 100 min 5 sec

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
ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

	arm-allmodconfig
ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : x86_64-allnoconfig
      1 warnings    0 mismatches  : arm64-allnoconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

Warnings Summary: 1
	  3 ../kernel/printk/printk.c:1983:12: warning: 'printk_time' defined but not used [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../kernel/printk/printk.c:1983:12: warning: 'printk_time' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../kernel/printk/printk.c:1983:12: warning: 'printk_time' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../kernel/printk/printk.c:1983:12: warning: 'printk_time' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v4t_defconfig
x86_64-defconfig
arm-multi_v7_defconfig
arm-multi_v5_defconfig
arm64-defconfig
