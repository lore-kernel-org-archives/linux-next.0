From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160209 build: 1 failures 5 warnings (next-20160209)
Date: Tue, 09 Feb 2016 08:28:44 +0000
Message-ID: <E1aT3fA-0006F9-JQ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41073 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751734AbcBII2x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2016 03:28:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160209
Git describe: next-20160209
Commit: c06a2a7722 Add linux-next specific files for 20160209

Build Time: 74 min 39 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 11
Warnings: 5
Section Mismatches: 1

Failed defconfigs:
	arm64-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "msi_create_irq_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "irq_chip_mask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "free_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "msi_domain_alloc_irqs" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "of_msi_get_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "irq_chip_eoi_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "msi_domain_set_affinity" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "msi_get_domain_info" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "msi_domain_free_irqs" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "alloc_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
ERROR: "irq_chip_unmask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    2 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      5 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 11
	  1 ERROR: "of_msi_get_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "msi_get_domain_info" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "msi_domain_set_affinity" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "msi_domain_free_irqs" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "msi_domain_alloc_irqs" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "msi_create_irq_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "irq_chip_unmask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "irq_chip_mask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "irq_chip_eoi_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "free_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	  1 ERROR: "alloc_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!

Warnings Summary: 5
	  3 ../drivers/gpu/drm/tegra/drm.c:861:19: warning: unused variable 'crtc' [-Wunused-variable]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 1
	  2 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x198): Section mismatch in reference from the function init_module() to the function .exit.text:fsl_mc_allocator_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 11 errors, 1 warnings, 2 section mismatches

Errors:
	ERROR: "msi_create_irq_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "irq_chip_mask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "free_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "msi_domain_alloc_irqs" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "of_msi_get_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "irq_chip_eoi_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "msi_domain_set_affinity" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "msi_get_domain_info" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "msi_domain_free_irqs" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "alloc_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
	ERROR: "irq_chip_unmask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!

Warnings:
	../drivers/gpu/drm/tegra/drm.c:861:19: warning: unused variable 'crtc' [-Wunused-variable]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x198): Section mismatch in reference from the function init_module() to the function .exit.text:fsl_mc_allocator_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x198): Section mismatch in reference from the function init_module() to the function .exit.text:fsl_mc_allocator_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/tegra/drm.c:861:19: warning: unused variable 'crtc' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/tegra/drm.c:861:19: warning: unused variable 'crtc' [-Wunused-variable]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm64-defconfig
