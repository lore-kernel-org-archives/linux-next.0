From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161125 build: 0 failures 1 warnings (next-20161125)
Date: Fri, 25 Nov 2016 06:24:02 +0000
Message-ID: <E1cA9vW-0007mg-Ms@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33488 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750995AbcKYGZr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Nov 2016 01:25:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161125
Git describe: next-20161125
Commit: 09bfc750ec Add linux-next specific files for 20161125

Build Time: 91 min 50 sec

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
	  1 ../include/linux/kern_levels.h:4:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kern_levels.h:4:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
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
