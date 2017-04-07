From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170407 build: 1 failures 3 warnings (next-20170407)
Date: Fri, 07 Apr 2017 13:06:21 +0100
Message-ID: <E1cwSej-0005Kc-MX@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:42176 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933029AbdDGMG3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Apr 2017 08:06:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170407
Git describe: next-20170407
Commit: 5efce14289 Add linux-next specific files for 20170407

Build Time: 114 min 57 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 3
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      2 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

Warnings Summary: 3
	  6 ../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast
	  2 ../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]
	  1 ../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]
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
arm-allmodconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

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
