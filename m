From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171116 build: 0 failures 3 warnings (next-20171116)
Date: Thu, 16 Nov 2017 07:50:05 +0000
Message-ID: <E1eFEw1-00042I-AG@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33922 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756730AbdKPHuH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Nov 2017 02:50:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171116
Git describe: next-20171116
Commit: 785be731fb Add linux-next specific files for 20171116

Build Time: 100 min 48 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : x86_64-defconfig
      1 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  3 ../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	  3 ../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	  1 ../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
