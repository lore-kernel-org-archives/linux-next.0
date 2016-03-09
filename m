From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160309 build: 1 failures 12 warnings (next-20160309)
Date: Wed, 09 Mar 2016 08:45:09 +0000
Message-ID: <E1adZjx-00089R-1L@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46184 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246AbcCIIpS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2016 03:45:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160309
Git describe: next-20160309
Commit: 7811b4ffc3 Add linux-next specific files for 20160309

Build Time: 75 min 29 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 8
Warnings: 12
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
      3 warnings    0 mismatches  : arm-multi_v7_defconfig
      3 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
     13 warnings    0 mismatches  : arm-allmodconfig
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

Warnings Summary: 12
	  7 <stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	  3 ../sound/soc/codecs/rt5640.c:1892:11: warning: unused variable 'dai_sel' [-Wunused-variable]
	  2 ../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  2 ../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  1 ../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	../sound/soc/codecs/rt5640.c:1892:11: warning: unused variable 'dai_sel' [-Wunused-variable]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 8 errors, 3 warnings, 0 section mismatches

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
	../sound/soc/codecs/rt5640.c:1892:11: warning: unused variable 'dai_sel' [-Wunused-variable]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 13 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../sound/soc/codecs/rt5640.c:1892:11: warning: unused variable 'dai_sel' [-Wunused-variable]
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
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
