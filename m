From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171122 build: 0 failures 1 warnings (next-20171122)
Date: Wed, 22 Nov 2017 21:10:48 +0000
Message-ID: <E1eHcIC-0002uf-Ho@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60048 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751324AbdKVVKv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Nov 2017 16:10:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171122
Git describe: next-20171122
Commit: 1efc584c71 Add linux-next specific files for 20171122

Build Time: 122 min 42 sec

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
