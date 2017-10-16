From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171016 build: 3 failures 6 warnings (next-20171016)
Date: Tue, 17 Oct 2017 00:57:44 +0100
Message-ID: <E1e4FGS-00073C-6P@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53852 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754769AbdJPX5s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Oct 2017 19:57:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171016
Git describe: next-20171016
Commit: babb43f85f Add linux-next specific files for 20171016

Build Time: 121 min 32 sec

Passed:    7 / 10   ( 70.00 %)
Failed:    3 / 10   ( 30.00 %)

Errors: 1
Warnings: 6
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      5 warnings    0 mismatches  : arm64-allmodconfig
      6 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

Warnings Summary: 6
	  2 ../fs/f2fs/node.c:1654:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/node.c:1556:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/node.c:1443:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/node.c:1289:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  2 ../fs/f2fs/checkpoint.c:322:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	  1 ../fs/btrfs/tree-checker.c:186:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../fs/f2fs/checkpoint.c:322:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1289:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1443:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1556:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1654:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 6 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

Warnings:
	../fs/btrfs/tree-checker.c:186:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
	../fs/f2fs/checkpoint.c:322:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1289:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1443:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1556:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
	../fs/f2fs/node.c:1654:5: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
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
