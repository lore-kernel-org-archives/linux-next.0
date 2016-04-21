From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160421 build: 1 failures 13 warnings (next-20160421)
Date: Thu, 21 Apr 2016 10:21:39 +0100
Message-ID: <E1atAnq-0007WC-W9@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58834 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752045AbcDUJVt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2016 05:21:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160421
Git describe: next-20160421
Commit: bde6ae871b Add linux-next specific files for 20160421

Build Time: 87 min 8 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 1
Warnings: 13
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__bad_udelay" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
     10 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      6 warnings    0 mismatches  : arm-multi_v7_defconfig
     11 warnings    0 mismatches  : arm-allmodconfig
      6 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__bad_udelay" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!

Warnings Summary: 13
	  5 <stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	  5 <stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	  5 ../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  5 ../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  3 ../drivers/gpu/drm/rcar-du/rcar_du_drv.c:300:24: warning: unused variable 'connector' [-Wunused-variable]
	  3 ../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	  3 ../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  3 ../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/rcar-du/rcar_du_drv.c:300:24: warning: unused variable 'connector' [-Wunused-variable]
	../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/rcar-du/rcar_du_drv.c:300:24: warning: unused variable 'connector' [-Wunused-variable]
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 11 warnings, 0 section mismatches

Errors:
	ERROR: "__bad_udelay" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!

Warnings:
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/rcar-du/rcar_du_drv.c:300:24: warning: unused variable 'connector' [-Wunused-variable]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-allnoconfig
x86_64-defconfig
