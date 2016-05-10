From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160510 build: 0 failures 17 warnings (next-20160510)
Date: Tue, 10 May 2016 10:46:03 +0100
Message-ID: <E1b04Es-0005tP-Tx@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39772 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbcEJJqM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 May 2016 05:46:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160510
Git describe: next-20160510
Commit: 416636ba56 Add linux-next specific files for 20160510

Build Time: 89 min 10 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 17
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
     11 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      3 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
      8 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : x86_64-allnoconfig
      4 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 17
	  6 ../kernel/cgroup.c:1634:15: warning: unused variable 'ret' [-Wunused-variable]
	  5 ../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  5 ../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  3 ../mm/page_alloc.c:3658:5: warning: 'compact_result' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/acpi/video.h:74:12: warning: 'acpi_video_get_levels' defined but not used [-Wunused-function]
	  2 ../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]
	  1 ../net/netfilter/nf_conntrack_core.c:633:33: warning: 'ctinfo' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/soc/mediatek/mtk-pmic-wrap.c:1086:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/soc/mediatek/mtk-pmic-wrap.c:1074:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/soc/mediatek/mtk-pmic-wrap.c:1062:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	  1 ../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:3658:5: warning: 'compact_result' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 11 warnings, 0 section mismatches

Warnings:
	../kernel/cgroup.c:1634:15: warning: unused variable 'ret' [-Wunused-variable]
	../include/acpi/video.h:74:12: warning: 'acpi_video_get_levels' defined but not used [-Wunused-function]
	../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/acpi/video.h:74:12: warning: 'acpi_video_get_levels' defined but not used [-Wunused-function]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/soc/mediatek/mtk-pmic-wrap.c:1062:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/soc/mediatek/mtk-pmic-wrap.c:1074:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/soc/mediatek/mtk-pmic-wrap.c:1086:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../kernel/cgroup.c:1634:15: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../kernel/cgroup.c:1634:15: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../kernel/cgroup.c:1634:15: warning: unused variable 'ret' [-Wunused-variable]
	../net/netfilter/nf_conntrack_core.c:633:33: warning: 'ctinfo' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	../kernel/cgroup.c:1634:15: warning: unused variable 'ret' [-Wunused-variable]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:3658:5: warning: 'compact_result' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:3658:5: warning: 'compact_result' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../kernel/cgroup.c:1634:15: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
	../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:
