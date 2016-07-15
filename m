From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160715 build: 0 failures 14 warnings (next-20160715)
Date: Fri, 15 Jul 2016 14:32:47 +0100
Message-ID: <E1bO3EV-0000rU-8S@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48456 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcGONdC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2016 09:33:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160715
Git describe: next-20160715
Commit: 084458fea6 Add linux-next specific files for 20160715

Build Time: 86 min 39 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 14
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     10 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 14
	  3 ../drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 arch/arm64/configs/defconfig:352:warning: override: reassigning to symbol PWM
	  1 ../include/trace/events/devlink.h:42:12: warning: format '%lu' expects argument of type 'long unsigned int', but argument 10 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/misc/lkdtm_usercopy.c:54:15: warning: 'bad_stack' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/misc/lkdtm_core.c:97:22: warning: 'jp_shrink_inactive_list' defined but not used [-Wunused-function]
	  1 ../drivers/misc/lkdtm_core.c:89:13: warning: 'jp_ll_rw_block' defined but not used [-Wunused-function]
	  1 ../drivers/misc/lkdtm_core.c:83:13: warning: 'jp_tasklet_action' defined but not used [-Wunused-function]
	  1 ../drivers/misc/lkdtm_core.c:75:20: warning: 'jp_handle_irq_event' defined but not used [-Wunused-function]
	  1 ../drivers/misc/lkdtm_core.c:68:21: warning: 'jp_do_irq' defined but not used [-Wunused-function]
	  1 ../drivers/misc/lkdtm_core.c:340:16: warning: 'lkdtm_debugfs_entry' defined but not used [-Wunused-function]
	  1 ../drivers/misc/lkdtm_core.c:114:12: warning: 'jp_scsi_dispatch_cmd' defined but not used [-Wunused-function]
	  1 ../drivers/misc/lkdtm_core.c:106:12: warning: 'jp_hrtimer_start' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
	../drivers/misc/lkdtm_core.c:340:16: warning: 'lkdtm_debugfs_entry' defined but not used [-Wunused-function]
	../drivers/misc/lkdtm_core.c:68:21: warning: 'jp_do_irq' defined but not used [-Wunused-function]
	../drivers/misc/lkdtm_core.c:75:20: warning: 'jp_handle_irq_event' defined but not used [-Wunused-function]
	../drivers/misc/lkdtm_core.c:83:13: warning: 'jp_tasklet_action' defined but not used [-Wunused-function]
	../drivers/misc/lkdtm_core.c:89:13: warning: 'jp_ll_rw_block' defined but not used [-Wunused-function]
	../drivers/misc/lkdtm_core.c:97:22: warning: 'jp_shrink_inactive_list' defined but not used [-Wunused-function]
	../drivers/misc/lkdtm_core.c:106:12: warning: 'jp_hrtimer_start' defined but not used [-Wunused-function]
	../drivers/misc/lkdtm_core.c:114:12: warning: 'jp_scsi_dispatch_cmd' defined but not used [-Wunused-function]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../include/trace/events/devlink.h:42:12: warning: format '%lu' expects argument of type 'long unsigned int', but argument 10 has type 'size_t {aka unsigned int}' [-Wformat=]
	../drivers/misc/lkdtm_usercopy.c:54:15: warning: 'bad_stack' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	arch/arm64/configs/defconfig:352:warning: override: reassigning to symbol PWM
	../drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
