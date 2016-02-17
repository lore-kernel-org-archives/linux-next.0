From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160217 build: 3 failures 14 warnings (next-20160217)
Date: Wed, 17 Feb 2016 08:28:37 +0000
Message-ID: <E1aVxTQ-0000zq-U4@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55045 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756827AbcBQI2p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Feb 2016 03:28:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160217
Git describe: next-20160217
Commit: b3ebd75cbc Add linux-next specific files for 20160217

Build Time: 74 min 15 sec

Passed:    6 / 9   ( 66.67 %)
Failed:    3 / 9   ( 33.33 %)

Errors: 11
Warnings: 14
Section Mismatches: 1

Failed defconfigs:
	arm64-allmodconfig
	arm64-defconfig

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
      6 warnings    2 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
      7 warnings    0 mismatches  : arm-allmodconfig
      6 warnings    0 mismatches  : arm64-defconfig

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

Warnings Summary: 14
	  4 ../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	  2 ../net/ipv4/igmp.c:1665:14: warning: unused variable 'net' [-Wunused-variable]
	  2 ../net/ipv4/igmp.c:1646:14: warning: unused variable 'net' [-Wunused-variable]
	  2 ../net/ipv4/igmp.c:1319:14: warning: unused variable 'net' [-Wunused-variable]
	  2 ../net/ipv4/igmp.c:1227:14: warning: unused variable 'net' [-Wunused-variable]
	  2 ../include/linux/kernel.h:754:17: warning: comparison of distinct pointer types lacks a cast
	  2 ../drivers/spi/spi.c:2279:9: warning: format '%i' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 1
	  2 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x198): Section mismatch in reference from the function init_module() to the function .exit.text:fsl_mc_allocator_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 11 errors, 6 warnings, 2 section mismatches

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
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../drivers/spi/spi.c:2279:9: warning: format '%i' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../include/linux/kernel.h:754:17: warning: comparison of distinct pointer types lacks a cast

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x198): Section mismatch in reference from the function init_module() to the function .exit.text:fsl_mc_allocator_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x198): Section mismatch in reference from the function init_module() to the function .exit.text:fsl_mc_allocator_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../net/ipv4/igmp.c:1227:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1319:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1646:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1665:14: warning: unused variable 'net' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../net/ipv4/igmp.c:1227:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1319:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1646:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1665:14: warning: unused variable 'net' [-Wunused-variable]
	../drivers/spi/spi.c:2279:9: warning: format '%i' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../include/linux/kernel.h:754:17: warning: comparison of distinct pointer types lacks a cast
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
