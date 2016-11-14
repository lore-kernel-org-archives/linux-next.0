From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161114 build: 0 failures 5 warnings (next-20161114)
Date: Mon, 14 Nov 2016 10:33:59 +0000
Message-ID: <E1c6EaM-0002B1-SZ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57768 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752514AbcKNKeH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Nov 2016 05:34:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161114
Git describe: next-20161114
Commit: b60de3eba5 Add linux-next specific files for 20161114

Build Time: 88 min 46 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 5
Section Mismatches: 4

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     12 warnings    2 mismatches  : arm64-allmodconfig
     10 warnings    2 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 5
	 16 ../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	  2 ../drivers/staging/iio/frequency/ad9832.c:214:11: warning: 'st' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/scsi/hpsa.c:8223:40: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/gpio/gpiolib-acpi.c:925:9: warning: 'lflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/gpio/gpiolib-acpi.c:925:7: warning: 'dflags' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.text+0x791ca4): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: vmlinux.o(.text+0x548560): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x1a365c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x1105d8): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 12 warnings, 2 section mismatches

Warnings:
	../drivers/gpio/gpiolib-acpi.c:925:9: warning: 'lflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpio/gpiolib-acpi.c:925:7: warning: 'dflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/iio/frequency/ad9832.c:214:11: warning: 'st' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/scsi/hpsa.c:8223:40: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined

Section Mismatches:
	WARNING: drivers/built-in.o(.text+0x1a365c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x791ca4): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 10 warnings, 2 section mismatches

Warnings:
	../drivers/scsi/hpsa.c:8223:40: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/iio/frequency/ad9832.c:214:11: warning: 'st' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined

Section Mismatches:
	WARNING: drivers/built-in.o(.text+0x1105d8): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x548560): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpio/gpiolib-acpi.c:925:9: warning: 'lflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpio/gpiolib-acpi.c:925:7: warning: 'dflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
