From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160714 build: 0 failures 6 warnings (next-20160714)
Date: Thu, 14 Jul 2016 10:19:51 +0100
Message-ID: <E1bNcoB-00031J-9a@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44532 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751010AbcGNJUA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Jul 2016 05:20:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160714
Git describe: next-20160714
Commit: fd8d43a58d Add linux-next specific files for 20160714

Build Time: 85 min 59 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 6
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 6
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 arch/arm64/configs/defconfig:352:warning: override: reassigning to symbol PWM
	  1 ../include/trace/events/devlink.h:42:12: warning: format '%lu' expects argument of type 'long unsigned int', but argument 10 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	../include/trace/events/devlink.h:42:12: warning: format '%lu' expects argument of type 'long unsigned int', but argument 10 has type 'size_t {aka unsigned int}' [-Wformat=]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	arch/arm64/configs/defconfig:352:warning: override: reassigning to symbol PWM
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
