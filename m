From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170116 build: 0 failures 4 warnings (next-20170116)
Date: Mon, 16 Jan 2017 10:48:57 +0000
Message-ID: <E1cT4qO-0002vU-Su@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39208 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750956AbdAPKtG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Jan 2017 05:49:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170116
Git describe: next-20170116
Commit: 38e4a8f0d6 Add linux-next specific files for 20170116

Build Time: 182 min 44 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 4
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 4
	  1 ../drivers/rtc/rtc-stm32.c:673:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/rtc/rtc-stm32.c:651:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/net/wireless/marvell/mwifiex/pcie.c:303:5: warning: 'fw_status' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/mellanox/mlx5/en/tc.c:716:40: warning: 'out_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/rtc/rtc-stm32.c:651:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/rtc/rtc-stm32.c:673:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/net/ethernet/mellanox/mlx5/en/tc.c:716:40: warning: 'out_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/net/wireless/marvell/mwifiex/pcie.c:303:5: warning: 'fw_status' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
