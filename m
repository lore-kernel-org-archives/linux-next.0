From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160420 build: 2 failures 16 warnings (next-20160420)
Date: Wed, 20 Apr 2016 09:43:11 +0100
Message-ID: <E1asnj4-0004aD-LH@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56386 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932445AbcDTInU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Apr 2016 04:43:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160420
Git describe: next-20160420
Commit: 356ed29496 Add linux-next specific files for 20160420

Build Time: 109 min 11 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 1
Warnings: 16
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../sound/soc/mediatek/mt8173-rt5650.c:236:9: error: implicit declaration of function 'snd_soc_get_dai_name' [-Werror=implicit-function-declaration]

	arm-allmodconfig
../sound/soc/mediatek/mt8173-rt5650.c:236:9: error: implicit declaration of function 'snd_soc_get_dai_name' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
      7 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : x86_64-defconfig
     10 warnings    0 mismatches  : arm-allmodconfig
      6 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ../sound/soc/mediatek/mt8173-rt5650.c:236:9: error: implicit declaration of function 'snd_soc_get_dai_name' [-Werror=implicit-function-declaration]

Warnings Summary: 16
	  5 ../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  5 ../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  4 <stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	  4 <stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	  3 ../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	  3 ../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  3 ../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../net/netfilter/nf_conntrack_netlink.c:572:15: warning: 'ctnetlink_timestamp_size' defined but not used [-Wunused-function]
	  1 ../net/netfilter/nf_conntrack_netlink.c:556:12: warning: 'ctnetlink_secctx_size' defined but not used [-Wunused-function]
	  1 ../net/netfilter/nf_conntrack_netlink.c:546:15: warning: 'ctnetlink_acct_size' defined but not used [-Wunused-function]
	  1 ../net/netfilter/nf_conntrack_netlink.c:529:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]
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
arm64-allmodconfig : FAIL, 1 errors, 7 warnings, 0 section mismatches

Errors:
	../sound/soc/mediatek/mt8173-rt5650.c:236:9: error: implicit declaration of function 'snd_soc_get_dai_name' [-Werror=implicit-function-declaration]

Warnings:
	<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
	<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/regulator/core.c:2512:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../net/netfilter/nf_conntrack_netlink.c:529:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]
	../net/netfilter/nf_conntrack_netlink.c:546:15: warning: 'ctnetlink_acct_size' defined but not used [-Wunused-function]
	../net/netfilter/nf_conntrack_netlink.c:556:12: warning: 'ctnetlink_secctx_size' defined but not used [-Wunused-function]
	../net/netfilter/nf_conntrack_netlink.c:572:15: warning: 'ctnetlink_timestamp_size' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 10 warnings, 0 section mismatches

Errors:
	../sound/soc/mediatek/mt8173-rt5650.c:236:9: error: implicit declaration of function 'snd_soc_get_dai_name' [-Werror=implicit-function-declaration]

Warnings:
	../drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:181:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
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
