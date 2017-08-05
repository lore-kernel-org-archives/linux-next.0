From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170731 build: 2 failures 3 warnings (next-20170731)
Date: Sat, 05 Aug 2017 16:30:50 +0100
Message-ID: <E1de12Q-0006l0-Fr@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37256 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751226AbdHEQBX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 5 Aug 2017 12:01:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170731
Git describe: next-20170731
Commit: 742f220ee6 Add linux-next specific files for 20170731

Build Time: 2883 min 29 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig

Errors:

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iommu/exynos-iommu.c:58:2: warning: #warning "revisit driver if we can enable big-endian ptes" [-Wcpp]
	  1 ../drivers/crypto/ccp/ccp-ops.c:1856:3: warning: 'sb_count' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/crypto/ccp/ccp-ops.c:1856:3: warning: 'sb_count' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/iommu/exynos-iommu.c:58:2: warning: #warning "revisit driver if we can enable big-endian ptes" [-Wcpp]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
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
