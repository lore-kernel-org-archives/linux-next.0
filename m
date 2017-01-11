From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170111 build: 1 failures 4 warnings (next-20170111)
Date: Wed, 11 Jan 2017 06:47:00 +0000
Message-ID: <E1cRCgW-0004am-BS@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46724 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750784AbdAKGrI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Jan 2017 01:47:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170111
Git describe: next-20170111
Commit: 4301f6c335 Add linux-next specific files for 20170111

Build Time: 102 min 4 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/net/ethernet/ti/netcp_core.c:1951:28: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../drivers/net/ethernet/ti/netcp_core.c:1951:28: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 4
	  2 ../drivers/rtc/rtc-armada38x.c:131:25: warning: 'index_max' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/power/supply/axp20x_usb_power.c:297:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../drivers/power/supply/axp20x_usb_power.c:297:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/rtc/rtc-armada38x.c:131:25: warning: 'index_max' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 3 warnings, 0 section mismatches

Errors:
	../drivers/net/ethernet/ti/netcp_core.c:1951:28: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
	../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/rtc/rtc-armada38x.c:131:25: warning: 'index_max' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
