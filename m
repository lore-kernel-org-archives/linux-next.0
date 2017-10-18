From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171017 build: 3 failures 8 warnings (next-20171017)
Date: Wed, 18 Oct 2017 05:17:03 +0100
Message-ID: <E1e4fmx-0007bA-F3@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53904 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753499AbdJRERG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Oct 2017 00:17:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171017
Git describe: next-20171017
Commit: a7dd40274d Add linux-next specific files for 20171017

Build Time: 122 min 21 sec

Passed:    7 / 10   ( 70.00 %)
Failed:    3 / 10   ( 30.00 %)

Errors: 1
Warnings: 8
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      6 warnings    0 mismatches  : arm64-allmodconfig
      8 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

Warnings Summary: 8
	  2 ../fs/f2fs/node.c:1654:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/node.c:1556:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/node.c:1443:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/node.c:1289:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/checkpoint.c:322:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]
	  1 ../net/sched/cls_u32.c:338:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../fs/btrfs/tree-checker.c:186:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../fs/f2fs/checkpoint.c:322:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1289:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1443:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1556:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1654:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 8 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

Warnings:
	../fs/btrfs/tree-checker.c:186:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
	../fs/f2fs/checkpoint.c:322:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1289:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1443:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1556:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1654:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../net/sched/cls_u32.c:338:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]
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
