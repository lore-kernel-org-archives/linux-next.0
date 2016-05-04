From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160504 build: 1 failures 12 warnings (next-20160504)
Date: Wed, 04 May 2016 10:53:01 +0100
Message-ID: <E1axtUL-0007fu-S3@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48318 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbcEDJxK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 May 2016 05:53:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160504
Git describe: next-20160504
Commit: a57cdca62e Add linux-next specific files for 20160504

Build Time: 88 min 54 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 1
Warnings: 12
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/pinctrl/bcm/pinctrl-ns2-mux.c:540:17: error: 'pinctrl_utils_dt_free_map' undeclared here (not in a function)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      5 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      9 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../drivers/pinctrl/bcm/pinctrl-ns2-mux.c:540:17: error: 'pinctrl_utils_dt_free_map' undeclared here (not in a function)

Warnings Summary: 12
	  5 ../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  5 ../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/uapi/linux/swab.h:126:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../include/uapi/linux/byteorder/big_endian.h:30:52: warning: passing argument 1 of '__fswab64' makes integer from pointer without a cast [-Wint-conversion]
	  1 ../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../include/linux/cpumask.h:550:25: warning: passing argument 2 of 'dev_pm_opp_set_sharing_cpus' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/uapi/linux/byteorder/big_endian.h:30:52: warning: passing argument 1 of '__fswab64' makes integer from pointer without a cast [-Wint-conversion]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 9 warnings, 0 section mismatches

Errors:
	../drivers/pinctrl/bcm/pinctrl-ns2-mux.c:540:17: error: 'pinctrl_utils_dt_free_map' undeclared here (not in a function)

Warnings:
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/linux/cpumask.h:550:25: warning: passing argument 2 of 'dev_pm_opp_set_sharing_cpus' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/uapi/linux/swab.h:126:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
x86_64-defconfig
