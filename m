From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160706 build: 0 failures 6 warnings (next-20160706)
Date: Wed, 06 Jul 2016 10:19:29 +0100
Message-ID: <E1bKizR-0005wS-8b@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48348 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751550AbcGFJUb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jul 2016 05:20:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160706
Git describe: next-20160706
Commit: bdf410d9fe Add linux-next specific files for 20160706

Build Time: 85 min 46 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 6
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      6 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

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
arm-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

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
arm64-allmodconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm64-defconfig
