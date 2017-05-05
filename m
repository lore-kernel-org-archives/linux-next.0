From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170505 build: 0 failures 1 warnings (next-20170505)
Date: Fri, 05 May 2017 11:11:14 +0100
Message-ID: <E1d6aCg-00087s-Pk@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56232 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751456AbdEEKL1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 May 2017 06:11:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170505
Git describe: next-20170505
Commit: 9e597e815f Add linux-next specific files for 20170505

Build Time: 151 min 21 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  2 ../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]
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
