From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170510 build: 0 failures 1 warnings (next-20170510)
Date: Wed, 10 May 2017 12:49:10 +0100
Message-ID: <E1d8Q7A-0001Nr-U6@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50208 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751123AbdEJLtR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 May 2017 07:49:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170510
Git describe: next-20170510
Commit: 5cbfaeb840 Add linux-next specific files for 20170510

Build Time: 214 min 45 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      1 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  7 ../block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
