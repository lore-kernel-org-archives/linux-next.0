From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171120 build: 0 failures 1 warnings (next-20171120)
Date: Mon, 20 Nov 2017 11:20:03 +0000
Message-ID: <E1eGk7P-0005kU-Bs@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52638 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750952AbdKTLUF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Nov 2017 06:20:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171120
Git describe: next-20171120
Commit: e6016f9837 Add linux-next specific files for 20171120

Build Time: 122 min 38 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  1 ../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
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
