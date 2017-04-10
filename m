From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170410 build: 2 failures 3 warnings (next-20170410)
Date: Mon, 10 Apr 2017 12:24:17 +0100
Message-ID: <E1cxXQe-0006cv-TG@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34400 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753436AbdDJLY2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Apr 2017 07:24:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170410
Git describe: next-20170410
Commit: f8c97bdb49 Add linux-next specific files for 20170410

Build Time: 102 min 50 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 2
Warnings: 3
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../mm/hmm.c:816:2: error: implicit declaration of function 'arch_remove_memory' [-Werror=implicit-function-declaration]

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

Errors summary: 2
	  1 ERROR: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!
	  1 ../mm/hmm.c:816:2: error: implicit declaration of function 'arch_remove_memory' [-Werror=implicit-function-declaration]

Warnings Summary: 3
	  6 ../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast
	  2 ../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]
	  1 ../mm/hmm.c:34:0: warning: "SECTION_SIZE" redefined



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 3 warnings, 0 section mismatches

Errors:
	../mm/hmm.c:816:2: error: implicit declaration of function 'arch_remove_memory' [-Werror=implicit-function-declaration]

Warnings:
	../mm/hmm.c:34:0: warning: "SECTION_SIZE" redefined
	../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]
	../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

Warnings:
	../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]
	../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v4t_defconfig
