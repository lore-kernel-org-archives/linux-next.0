From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160719 build: 0 failures 4 warnings (next-20160719)
Date: Tue, 19 Jul 2016 10:51:35 +0100
Message-ID: <E1bPRgd-0004CY-8w@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60706 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752593AbcGSJvm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Jul 2016 05:51:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160719
Git describe: next-20160719
Commit: d55b4726cc Add linux-next specific files for 20160719

Build Time: 86 min 50 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 4
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      3 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 4
	  3 ../drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/misc/lkdtm_usercopy.c:52:15: warning: 'bad_stack' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/misc/lkdtm_usercopy.c:52:15: warning: 'bad_stack' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
