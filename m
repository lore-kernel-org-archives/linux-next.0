From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160708 build: 3 failures 6 warnings (next-20160708)
Date: Fri, 08 Jul 2016 11:42:55 +0100
Message-ID: <E1bLTFH-0001v5-5L@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56882 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754073AbcGHKnF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Jul 2016 06:43:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160708
Git describe: next-20160708
Commit: a379b037c5 Add linux-next specific files for 20160708

Build Time: 72 min 47 sec

Passed:    6 / 9   ( 66.67 %)
Failed:    3 / 9   ( 33.33 %)

Errors: 1
Warnings: 6
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/gpu/drm/rockchip/rockchip_drm_drv.c:17:27: fatal error: asm/dma-iommu.h: No such file or directory

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      6 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../drivers/gpu/drm/rockchip/rockchip_drm_drv.c:17:27: fatal error: asm/dma-iommu.h: No such file or directory

Warnings Summary: 6
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1824:4: warning: this decimal constant is unsigned only in ISO C90
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1822:4: warning: this decimal constant is unsigned only in ISO C90
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1817:4: warning: this decimal constant is unsigned only in ISO C90
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../drivers/gpu/drm/rockchip/rockchip_drm_drv.c:17:27: fatal error: asm/dma-iommu.h: No such file or directory

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1817:4: warning: this decimal constant is unsigned only in ISO C90
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1822:4: warning: this decimal constant is unsigned only in ISO C90
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1824:4: warning: this decimal constant is unsigned only in ISO C90
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
