From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170725 build: 0 failures 2 warnings (next-20170725)
Date: Tue, 25 Jul 2017 08:00:51 +0100
Message-ID: <E1dZtpr-0008OX-5O@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36484 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750835AbdGYHDJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jul 2017 03:03:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170725
Git describe: next-20170725
Commit: dce9071ab6 Add linux-next specific files for 20170725

Build Time: 0 min 16 sec

Passed:    7 / 7   (100.00 %)
Failed:    0 / 7   (  0.00 %)

Errors: 0
Warnings: 2
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 2
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/mtd/mtdswap.c:1317:17: warning: unused variable 'dev' [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/mtd/mtdswap.c:1317:17: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
