From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170517 build: 0 failures 3 warnings (next-20170517)
Date: Wed, 17 May 2017 09:03:58 +0100
Message-ID: <E1dAtw5-00055G-UX@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36958 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753891AbdEQIEG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2017 04:04:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170517
Git describe: next-20170517
Commit: 973d6301c6 Add linux-next specific files for 20170517

Build Time: 117 min 24 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  3 ../fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
