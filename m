From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161212 build: 0 failures 1 warnings (next-20161212)
Date: Mon, 12 Dec 2016 10:00:01 +0000
Message-ID: <E1cGNOq-0005sP-SZ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45076 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753901AbcLLKAK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Dec 2016 05:00:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161212
Git describe: next-20161212
Commit: b11a0cf861 Add linux-next specific files for 20161212

Build Time: 98 min 40 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  4 ../drivers/clk/bcm/clk-bcm2835.c:1069:18: warning: 'best_rate' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/clk/bcm/clk-bcm2835.c:1069:18: warning: 'best_rate' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/clk/bcm/clk-bcm2835.c:1069:18: warning: 'best_rate' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/clk/bcm/clk-bcm2835.c:1069:18: warning: 'best_rate' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/clk/bcm/clk-bcm2835.c:1069:18: warning: 'best_rate' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
