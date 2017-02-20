From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170220 build: 2 failures 9 warnings (next-20170220)
Date: Mon, 20 Feb 2017 08:19:12 +0000
Message-ID: <E1cfjBg-0003Zo-9z@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54876 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdBTITU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Feb 2017 03:19:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170220
Git describe: next-20170220
Commit: b349d1bbdc Add linux-next specific files for 20170220

Build Time: 99 min 42 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 5
Warnings: 9
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../kernel/sched/core.c:198:25: error: 'paravirt_steal_rq_enabled' undeclared (first use in this function)
../kernel/sched/core.c:199:11: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]

	arm-allmodconfig
../kernel/sched/core.c:198:25: error: 'paravirt_steal_rq_enabled' undeclared (first use in this function)
../kernel/sched/core.c:199:11: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]
../drivers/pci/dwc/pci-exynos.c:132:25: error: 'struct exynos_pcie' has no member named 'pp'
../drivers/pci/dwc/pci-exynos.c:162:25: error: 'struct exynos_pcie' has no member named 'pp'
../drivers/pci/dwc/pci-exynos.c:185:25: error: 'struct exynos_pcie' has no member named 'pp'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      9 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 5
	  2 ../kernel/sched/core.c:199:11: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]
	  2 ../kernel/sched/core.c:198:25: error: 'paravirt_steal_rq_enabled' undeclared (first use in this function)
	  1 ../drivers/pci/dwc/pci-exynos.c:185:25: error: 'struct exynos_pcie' has no member named 'pp'
	  1 ../drivers/pci/dwc/pci-exynos.c:162:25: error: 'struct exynos_pcie' has no member named 'pp'
	  1 ../drivers/pci/dwc/pci-exynos.c:132:25: error: 'struct exynos_pcie' has no member named 'pp'

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
arm64-allmodconfig : FAIL, 2 errors, 0 warnings, 0 section mismatches

Errors:
	../kernel/sched/core.c:198:25: error: 'paravirt_steal_rq_enabled' undeclared (first use in this function)
	../kernel/sched/core.c:199:11: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/sti/sti_vtg.c:392:22: warning: unused variable 'np' [-Wunused-variable]
	../drivers/gpu/drm/sti/sti_drv.c:120:13: warning: 'sti_drm_dbg_cleanup' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 5 errors, 9 warnings, 0 section mismatches

Errors:
	../kernel/sched/core.c:198:25: error: 'paravirt_steal_rq_enabled' undeclared (first use in this function)
	../kernel/sched/core.c:199:11: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]
	../drivers/pci/dwc/pci-exynos.c:132:25: error: 'struct exynos_pcie' has no member named 'pp'
	../drivers/pci/dwc/pci-exynos.c:162:25: error: 'struct exynos_pcie' has no member named 'pp'
	../drivers/pci/dwc/pci-exynos.c:185:25: error: 'struct exynos_pcie' has no member named 'pp'

Warnings:
	../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/sti/sti_vtg.c:392:22: warning: unused variable 'np' [-Wunused-variable]
	../drivers/gpu/drm/sti/sti_drv.c:120:13: warning: 'sti_drm_dbg_cleanup' defined but not used [-Wunused-function]
	../include/linux/device.h:1473:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/device.h:1478:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
