From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160426 build: 0 failures 15 warnings (next-20160426)
Date: Tue, 26 Apr 2016 11:29:25 +0100
Message-ID: <E1av0FB-0003yw-R7@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43972 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbcDZK3c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Apr 2016 06:29:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160426
Git describe: next-20160426
Commit: 1ed5c5d25f Add linux-next specific files for 20160426

Build Time: 87 min 13 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 15
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      9 warnings    0 mismatches  : arm64-allmodconfig
      6 warnings    0 mismatches  : arm-multi_v7_defconfig
     12 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 15
	  5 ../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  5 ../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  3 ../drivers/regulator/rk808-regulator.c:306:29: warning: 'rk808_reg_ops_ranges' defined but not used [-Wunused-variable]
	  3 ../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	  3 ../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  3 ../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  2 ../drivers/pinctrl/sh-pfc/core.c:603:17: warning: unused variable 'pfc' [-Wunused-variable]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/en_main.c:1325:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/pinctrl/sh-pfc/core.c:603:17: warning: unused variable 'pfc' [-Wunused-variable]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/regulator/rk808-regulator.c:306:29: warning: 'rk808_reg_ops_ranges' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/regulator/rk808-regulator.c:306:29: warning: 'rk808_reg_ops_ranges' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 12 warnings, 0 section mismatches

Warnings:
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/regulator/rk808-regulator.c:306:29: warning: 'rk808_reg_ops_ranges' defined but not used [-Wunused-variable]
	../drivers/net/ethernet/mellanox/mlx5/core/en_main.c:1325:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/pinctrl/sh-pfc/core.c:603:17: warning: unused variable 'pfc' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
x86_64-defconfig
