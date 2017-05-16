From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170516 build: 0 failures 1 warnings (next-20170516)
Date: Tue, 16 May 2017 07:37:44 +0100
Message-ID: <E1dAW76-0008AO-1Z@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55400 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751027AbdEPGhw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 May 2017 02:37:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170516
Git describe: next-20170516
Commit: 7f492466e6 Add linux-next specific files for 20170516

Build Time: 119 min 49 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : x86_64-allnoconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  1 ../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allmodconfig
arm-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
