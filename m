From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161215 build: 0 failures 1 warnings (next-20161215)
Date: Thu, 15 Dec 2016 09:20:25 +0000
Message-ID: <E1cHSDB-0005rk-Ii@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:47658 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755107AbcLOJrV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Dec 2016 04:47:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161215
Git describe: next-20161215
Commit: df5462d601 Add linux-next specific files for 20161215

Build Time: 180 min 47 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  1 ../drivers/infiniband/sw/rdmavt/cq.c:542:2: warning: 'worker' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/infiniband/sw/rdmavt/cq.c:542:2: warning: 'worker' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allmodconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
