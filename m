From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170926 build: 2 failures 1 warnings (next-20170926)
Date: Tue, 26 Sep 2017 11:29:06 +0100
Message-ID: <E1dwn6w-0002eY-VE@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42156 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752067AbdIZK3J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2017 06:29:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170926
Git describe: next-20170926
Commit: d35adcbe86 Add linux-next specific files for 20170926

Build Time: 98 min 43 sec

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
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

Warnings Summary: 1
	  3 ../drivers/scsi/hisi_sas/hisi_sas_main.c:1049:24: warning: unused variable 'sas_ha' [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

Warnings:
	../drivers/scsi/hisi_sas/hisi_sas_main.c:1049:24: warning: unused variable 'sas_ha' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

Warnings:
	../drivers/scsi/hisi_sas/hisi_sas_main.c:1049:24: warning: unused variable 'sas_ha' [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/scsi/hisi_sas/hisi_sas_main.c:1049:24: warning: unused variable 'sas_ha' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
