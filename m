From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171009 build: 1 failures 1 warnings (next-20171009)
Date: Tue, 10 Oct 2017 03:30:46 +0100
Message-ID: <E1e1kJi-0008Uc-On@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:34840 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751184AbdJJCat (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Oct 2017 22:30:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171009
Git describe: next-20171009
Commit: 49827b977a Add linux-next specific files for 20171009

Build Time: 118 min 33 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 1
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__bad_cmpxchg" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__bad_cmpxchg" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

Warnings Summary: 1
	  5 ../sound/soc/soc-dapm.c:3940:2: warning: 'w_param_text' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../sound/soc/soc-dapm.c:3940:2: warning: 'w_param_text' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../sound/soc/soc-dapm.c:3940:2: warning: 'w_param_text' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "__bad_cmpxchg" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!

Warnings:
	../sound/soc/soc-dapm.c:3940:2: warning: 'w_param_text' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../sound/soc/soc-dapm.c:3940:2: warning: 'w_param_text' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../sound/soc/soc-dapm.c:3940:2: warning: 'w_param_text' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v4t_defconfig
x86_64-defconfig
