From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171013 build: 1 failures 1 warnings (next-20171013)
Date: Sat, 14 Oct 2017 04:00:31 +0100
Message-ID: <E1e3Cgh-0001Dm-ED@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58358 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751572AbdJNDAe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Oct 2017 23:00:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171013
Git describe: next-20171013
Commit: 3fd49c0eda Add linux-next specific files for 20171013

Build Time: 120 min 41 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

Failed defconfigs:

Errors:

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  1 ../fs/btrfs/tree-checker.c:185:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/tree-checker.c:185:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
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
