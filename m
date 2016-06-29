From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160629 build: 2 failures 4 warnings (next-20160629)
Date: Wed, 29 Jun 2016 10:17:02 +0100
Message-ID: <E1bIBcE-0003jN-K9@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54340 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932103AbcF2JRL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jun 2016 05:17:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160629
Git describe: next-20160629
Commit: b07695ee86 Add linux-next specific files for 20160629

Build Time: 74 min 48 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 5
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1653:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1654:19: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1655:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1656:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1657:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

	arm-allmodconfig
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1653:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1654:19: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1655:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1656:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1657:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 5
	  2 ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1657:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  2 ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1656:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  2 ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1655:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  2 ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1654:19: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  2 ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1653:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 4
	  1 ../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 5 errors, 1 warnings, 0 section mismatches

Errors:
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1653:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1654:19: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1655:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1656:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1657:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
	../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 5 errors, 3 warnings, 0 section mismatches

Errors:
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1653:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1654:19: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1655:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1656:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/mediatek/mtk_hdmi.c:1657:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm64-defconfig
