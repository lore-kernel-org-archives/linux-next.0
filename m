From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160310 build: 1 failures 8 warnings (next-20160310)
Date: Thu, 10 Mar 2016 12:45:00 +0000
Message-ID: <E1adzxb-0001fB-6R@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49850 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069AbcCJMpJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2016 07:45:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160310
Git describe: next-20160310
Commit: 8540bdafb4 Add linux-next specific files for 20160310

Build Time: 147 min 19 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 8
Warnings: 8
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "irq_chip_eoi_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
ERROR: "irq_chip_unmask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
ERROR: "irq_chip_mask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
ERROR: "irq_domain_create_hierarchy" [drivers/gpio/gpio-xgene-sb.ko] undefined!
ERROR: "irq_chip_set_type_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
ERROR: "irq_domain_alloc_irqs_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
ERROR: "irq_domain_set_hwirq_and_chip" [drivers/gpio/gpio-xgene-sb.ko] undefined!
ERROR: "irq_domain_reset_irq_data" [drivers/gpio/gpio-xgene-sb.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      9 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Errors summary: 8
	  1 ERROR: "irq_domain_set_hwirq_and_chip" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	  1 ERROR: "irq_domain_reset_irq_data" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	  1 ERROR: "irq_domain_create_hierarchy" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	  1 ERROR: "irq_domain_alloc_irqs_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	  1 ERROR: "irq_chip_unmask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	  1 ERROR: "irq_chip_set_type_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	  1 ERROR: "irq_chip_mask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	  1 ERROR: "irq_chip_eoi_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!

Warnings Summary: 8
	  7 <stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	  2 ../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  2 ../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 8 errors, 2 warnings, 0 section mismatches

Errors:
	ERROR: "irq_chip_eoi_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	ERROR: "irq_chip_unmask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	ERROR: "irq_chip_mask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	ERROR: "irq_domain_create_hierarchy" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	ERROR: "irq_chip_set_type_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	ERROR: "irq_domain_alloc_irqs_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	ERROR: "irq_domain_set_hwirq_and_chip" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	ERROR: "irq_domain_reset_irq_data" [drivers/gpio/gpio-xgene-sb.ko] undefined!

Warnings:
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
arm64-defconfig
