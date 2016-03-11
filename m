From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160311 build: 1 failures 13 warnings (next-20160311)
Date: Fri, 11 Mar 2016 08:45:31 +0000
Message-ID: <E1aeIhP-00019p-Ha@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51818 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964788AbcCKIpl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Mar 2016 03:45:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160311
Git describe: next-20160311
Commit: bb17bf337d Add linux-next specific files for 20160311

Build Time: 75 min 53 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 8
Warnings: 13
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
      3 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
     13 warnings    0 mismatches  : arm-allmodconfig

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

Warnings Summary: 13
	  3 ../drivers/media/v4l2-core/v4l2-mc.c:37:55: warning: unused variable 'dtv_demod' [-Wunused-variable]
	  2 ../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  2 ../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../net/sched/cls_flower.c:591:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/sched/cls_flower.c:563:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/sched/cls_flower.c:557:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/sched/cls_flower.c:222:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1682:2: warning: ignoring return value of 'device_reset', declared with attribute warn_unused_result [-Wunused-result]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


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
	../drivers/media/v4l2-core/v4l2-mc.c:37:55: warning: unused variable 'dtv_demod' [-Wunused-variable]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/media/v4l2-core/v4l2-mc.c:37:55: warning: unused variable 'dtv_demod' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 13 warnings, 0 section mismatches

Warnings:
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../net/sched/cls_flower.c:222:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../net/sched/cls_flower.c:557:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../net/sched/cls_flower.c:563:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../net/sched/cls_flower.c:591:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/media/v4l2-core/v4l2-mc.c:37:55: warning: unused variable 'dtv_demod' [-Wunused-variable]
	../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/tty/serial/uartlite.c:348:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/tty/serial/uartlite.c:354:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1682:2: warning: ignoring return value of 'device_reset', declared with attribute warn_unused_result [-Wunused-result]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm64-defconfig
