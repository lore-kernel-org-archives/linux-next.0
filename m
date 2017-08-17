From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170817 build: 0 failures 3 warnings (next-20170817)
Date: Thu, 17 Aug 2017 17:00:28 +0100
Message-ID: <E1diNDg-0006C5-4v@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43206 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750857AbdHQQAa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Aug 2017 12:00:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170817
Git describe: next-20170817
Commit: bb70832dd4 Add linux-next specific files for 20170817

Build Time: 94 min 14 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  1 ../drivers/mmc/core/mmc_test.c:883:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/x86/kernel/cpu/amd.c:305:13: warning: 'legacy_fixup_core_id' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/cpu/amd.c:305:13: warning: 'legacy_fixup_core_id' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/mmc/core/mmc_test.c:883:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
