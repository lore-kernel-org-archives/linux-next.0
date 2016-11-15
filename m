From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161115 build: 0 failures 6 warnings (next-20161115)
Date: Tue, 15 Nov 2016 09:17:01 +0000
Message-ID: <E1c6ZrR-0006r3-LB@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44028 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966264AbcKOJRK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Nov 2016 04:17:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161115
Git describe: next-20161115
Commit: 88a2ced28f Add linux-next specific files for 20161115

Build Time: 113 min 41 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 6
Section Mismatches: 4

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     15 warnings    2 mismatches  : arm64-allmodconfig
     13 warnings    2 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 6
	 16 ../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
	  6 warning: (THUNDERBOLT) selects APPLE_PROPERTIES which has unmet direct dependencies (EFI && EFI_STUB && X86)
	  2 ../drivers/staging/iio/frequency/ad9832.c:214:11: warning: 'st' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/gpio/gpiolib-acpi.c:925:9: warning: 'lflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/gpio/gpiolib-acpi.c:925:7: warning: 'dflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/char/tpm/tpm_of.c:37:8: warning: 'np' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.text+0x790014): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: vmlinux.o(.text+0x5473b8): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x1a1a4c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x10f450): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 15 warnings, 2 section mismatches

Warnings:
	warning: (THUNDERBOLT) selects APPLE_PROPERTIES which has unmet direct dependencies (EFI && EFI_STUB && X86)
	warning: (THUNDERBOLT) selects APPLE_PROPERTIES which has unmet direct dependencies (EFI && EFI_STUB && X86)
	warning: (THUNDERBOLT) selects APPLE_PROPERTIES which has unmet direct dependencies (EFI && EFI_STUB && X86)
	../drivers/char/tpm/tpm_of.c:37:8: warning: 'np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpio/gpiolib-acpi.c:925:9: warning: 'lflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpio/gpiolib-acpi.c:925:7: warning: 'dflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
	WARNING: drivers/built-in.o(.text+0x1a1a4c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x790014): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 13 warnings, 2 section mismatches

Warnings:
	warning: (THUNDERBOLT) selects APPLE_PROPERTIES which has unmet direct dependencies (EFI && EFI_STUB && X86)
	warning: (THUNDERBOLT) selects APPLE_PROPERTIES which has unmet direct dependencies (EFI && EFI_STUB && X86)
	warning: (THUNDERBOLT) selects APPLE_PROPERTIES which has unmet direct dependencies (EFI && EFI_STUB && X86)
	../drivers/char/tpm/tpm_of.c:37:8: warning: 'np' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
	WARNING: drivers/built-in.o(.text+0x10f450): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x5473b8): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()

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
