From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171012 build: 0 failures 1 warnings (next-20171012)
Date: Fri, 13 Oct 2017 16:31:14 +0100
Message-ID: <E1e31ve-0002Hi-LR@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59322 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758234AbdJMPbQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Oct 2017 11:31:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171012
Git describe: next-20171012
Commit: dcc70ea857 Add linux-next specific files for 20171012

Build Time: 120 min 48 sec

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
	  1 ../fs/btrfs/tree-checker.c:189:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/tree-checker.c:189:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
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
