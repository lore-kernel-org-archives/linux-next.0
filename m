From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170217 build: 2 failures 7 warnings (next-20170217)
Date: Fri, 17 Feb 2017 09:32:46 +0000
Message-ID: <E1ceeuE-0004r2-HY@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38878 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbdBQJcy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Feb 2017 04:32:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170217
Git describe: next-20170217
Commit: 4ce4a759a3 Add linux-next specific files for 20170217

Build Time: 99 min 16 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 2
Warnings: 7
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

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      7 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  2 ../kernel/sched/core.c:199:11: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]
	  2 ../kernel/sched/core.c:198:25: error: 'paravirt_steal_rq_enabled' undeclared (first use in this function)

Warnings Summary: 7
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/device.h:1477:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../include/linux/device.h:1472:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
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
arm-allmodconfig : FAIL, 2 errors, 7 warnings, 0 section mismatches

Errors:
	../kernel/sched/core.c:198:25: error: 'paravirt_steal_rq_enabled' undeclared (first use in this function)
	../kernel/sched/core.c:199:11: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]

Warnings:
	../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/device.h:1472:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/device.h:1477:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
