From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161117 build: 0 failures 3 warnings (next-20161117)
Date: Thu, 17 Nov 2016 09:20:07 +0000
Message-ID: <E1c7IrX-0002uk-KR@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40344 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932132AbcKQJUQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Nov 2016 04:20:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161117
Git describe: next-20161117
Commit: e3b16de6a5 Add linux-next specific files for 20161117

Build Time: 84 min 54 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 1
Warnings: 3
Section Mismatches: 4

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     10 warnings    2 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
     10 warnings    2 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	 20 drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

Warnings Summary: 3
	 16 ../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	  4 ../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1194:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  4 ../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.text+0x797db4): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: vmlinux.o(.text+0x54b098): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x1a376c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x10f9c8): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 2 errors, 10 warnings, 2 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

Warnings:
	../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1194:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined

Section Mismatches:
	WARNING: drivers/built-in.o(.text+0x1a376c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x797db4): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 2 errors, 2 warnings, 0 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

Warnings:
	../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1194:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 2 errors, 10 warnings, 2 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

Warnings:
	../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1194:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined

Section Mismatches:
	WARNING: drivers/built-in.o(.text+0x10f9c8): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x54b098): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 2 errors, 2 warnings, 0 section mismatches

Errors:
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
	drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

Warnings:
	../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1194:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:
