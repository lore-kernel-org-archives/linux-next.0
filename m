From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170119 build: 0 failures 1 warnings (next-20170119)
Date: Thu, 19 Jan 2017 09:15:28 +0000
Message-ID: <E1cU8oa-0006Lk-0s@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40186 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751230AbdASJPu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Jan 2017 04:15:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170119
Git describe: next-20170119
Commit: fb6271277d Add linux-next specific files for 20170119

Build Time: 104 min 32 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  2 ../drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:546:6: warning: unused variable 'ncv' [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:546:6: warning: unused variable 'ncv' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:546:6: warning: unused variable 'ncv' [-Wunused-variable]
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
