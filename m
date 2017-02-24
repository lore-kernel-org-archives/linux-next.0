From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170224 build: 1 failures 11 warnings (next-20170224)
Date: Fri, 24 Feb 2017 09:25:50 +0000
Message-ID: <E1chC8L-0001vz-A9@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49342 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751125AbdBXJ0K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Feb 2017 04:26:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170224
Git describe: next-20170224
Commit: 3e7350242c Add linux-next specific files for 20170224

Build Time: 213 min 45 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 11
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/scsi/lpfc/lpfc.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     13 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [drivers/scsi/lpfc/lpfc.ko] undefined!

Warnings Summary: 11
	  2 ../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 12 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  2 ../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 11 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
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
arm-allmodconfig : FAIL, 1 errors, 13 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/scsi/lpfc/lpfc.ko] undefined!

Warnings:
	../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/sti/sti_vtg.c:392:22: warning: unused variable 'np' [-Wunused-variable]
	../drivers/gpu/drm/sti/sti_drv.c:120:13: warning: 'sti_drm_dbg_cleanup' defined but not used [-Wunused-function]
	../include/linux/device.h:1473:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/device.h:1478:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 11 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 12 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 11 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 12 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
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
