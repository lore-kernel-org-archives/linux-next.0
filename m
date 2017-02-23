From: Build bot for Mark Brown <broonie@kernel.org>
Subject: master build: 0 failures 9 warnings (v4.10-11302-g27fde84)
Date: Thu, 23 Feb 2017 10:59:26 +0000
Message-ID: <E1cgr7M-0006OL-Os@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44084 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750828AbdBWK7h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Feb 2017 05:59:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: master
Git describe: v4.10-11302-g27fde84
Commit: 27fde840c0 Add linux-next specific files for 20170223

Build Time: 172 min 52 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 9
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      9 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig

-------------------------------------------------------------------------------

Warnings Summary: 9
	  2 ../drivers/gpu/drm/sti/sti_vtg.c:392:22: warning: unused variable 'np' [-Wunused-variable]
	  2 ../drivers/gpu/drm/sti/sti_drv.c:120:13: warning: 'sti_drm_dbg_cleanup' defined but not used [-Wunused-function]
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/device.h:1478:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../include/linux/device.h:1473:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/sti/sti_vtg.c:392:22: warning: unused variable 'np' [-Wunused-variable]
	../drivers/gpu/drm/sti/sti_drv.c:120:13: warning: 'sti_drm_dbg_cleanup' defined but not used [-Wunused-function]
	../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/device.h:1473:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/device.h:1478:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/sti/sti_vtg.c:392:22: warning: unused variable 'np' [-Wunused-variable]
	../drivers/gpu/drm/sti/sti_drv.c:120:13: warning: 'sti_drm_dbg_cleanup' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
