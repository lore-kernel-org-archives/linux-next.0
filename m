From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171018 build: 3 failures 7 warnings (next-20171018)
Date: Thu, 19 Oct 2017 05:55:56 +0100
Message-ID: <E1e52s8-0007aR-CU@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50038 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750777AbdJSEz6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Oct 2017 00:55:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171018
Git describe: next-20171018
Commit: 36ef71cae3 Add linux-next specific files for 20171018

Build Time: 120 min 53 sec

Passed:    7 / 10   ( 70.00 %)
Failed:    3 / 10   ( 30.00 %)

Errors: 1
Warnings: 7
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      6 warnings    0 mismatches  : arm64-allmodconfig
      7 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

Warnings Summary: 7
	  2 ../fs/f2fs/node.c:1651:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/node.c:1553:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/node.c:1440:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/node.c:1285:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/checkpoint.c:322:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]
	  1 ../net/sched/cls_u32.c:338:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../fs/f2fs/checkpoint.c:322:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1285:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1440:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1553:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1651:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 7 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

Warnings:
	../fs/f2fs/checkpoint.c:322:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1285:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1440:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1553:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1651:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
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
