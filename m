From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170109 build: 1 failures 3 warnings (next-20170109)
Date: Mon, 09 Jan 2017 07:48:28 +0000
Message-ID: <E1cQUgu-0002ri-S8@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56906 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbdAIHsj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Jan 2017 02:48:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170109
Git describe: next-20170109
Commit: c84d0bbe09 Add linux-next specific files for 20170109

Build Time: 104 min 14 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 3
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/net/ethernet/ti/netcp_core.c:1951:28: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../drivers/net/ethernet/ti/netcp_core.c:1951:28: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 3
	  2 ../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/power/supply/axp20x_usb_power.c:297:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/power/supply/axp20x_usb_power.c:297:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	../drivers/net/ethernet/ti/netcp_core.c:1951:28: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
	../drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
