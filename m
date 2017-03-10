From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170310 build: 0 failures 7 warnings (next-20170310)
Date: Fri, 10 Mar 2017 09:11:34 +0000
Message-ID: <E1cmGaD-00010s-GZ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43066 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932881AbdCJJLy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Mar 2017 04:11:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170310
Git describe: next-20170310
Commit: 5be4921c99 Add linux-next specific files for 20170310

Build Time: 195 min 10 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 7
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
      4 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v5_defconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
      7 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 7
	 13 <stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	  4 ../include/drm/drm_pci.h:76:64: warning: its scope is only this definition or declaration, which is probably not what you want
	  4 ../include/drm/drm_pci.h:76:64: warning: 'struct platform_device' declared inside parameter list
	  2 ../include/drm/drm_pci.h:76:64: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
	  2 ../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:128:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]
	  1 ../sound/soc/codecs/cs35l35.c:1371:2: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
	  1 ../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:138:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../sound/soc/codecs/cs35l35.c:1371:2: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
	../include/drm/drm_pci.h:76:64: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../include/drm/drm_pci.h:76:64: warning: 'struct platform_device' declared inside parameter list
	../include/drm/drm_pci.h:76:64: warning: its scope is only this definition or declaration, which is probably not what you want
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../include/drm/drm_pci.h:76:64: warning: 'struct platform_device' declared inside parameter list
	../include/drm/drm_pci.h:76:64: warning: its scope is only this definition or declaration, which is probably not what you want
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/drm/drm_pci.h:76:64: warning: 'struct platform_device' declared inside parameter list
	../include/drm/drm_pci.h:76:64: warning: its scope is only this definition or declaration, which is probably not what you want

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../include/drm/drm_pci.h:76:64: warning: 'struct platform_device' declared inside parameter list
	../include/drm/drm_pci.h:76:64: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:138:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]
	../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:128:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]
	../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:128:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../include/drm/drm_pci.h:76:64: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
