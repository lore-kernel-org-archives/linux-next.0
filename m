From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170412 build: 0 failures 2 warnings (next-20170412)
Date: Wed, 12 Apr 2017 17:00:36 +0100
Message-ID: <E1cyKh9-0004kZ-E7@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35992 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754538AbdDLQAo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2017 12:00:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170412
Git describe: next-20170412
Commit: 1267f8fa29 Add linux-next specific files for 20170412

Build Time: 280 min 43 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 2
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      2 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 2
	  6 ../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast
	  2 ../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v4t_defconfig
