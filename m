From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160727 build: 0 failures 7 warnings (next-20160727)
Date: Wed, 27 Jul 2016 12:29:33 +0100
Message-ID: <E1bSN1p-0001Xq-RW@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59820 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754200AbcG0L3n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Jul 2016 07:29:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160727
Git describe: next-20160727
Commit: d9c44325f3 Add linux-next specific files for 20160727

Build Time: 90 min 4 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 7
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
      7 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 7
	  6 ../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	  6 ../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/net/ethernet/apm/xgene/xgene_enet_hw.c:803:23: warning: 'phy_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/apm/xgene/xgene_enet_hw.c:759:22: warning: unused variable 'adev' [-Wunused-variable]
	  1 ../drivers/misc/lkdtm_usercopy.c:52:15: warning: 'bad_stack' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/misc/lkdtm_usercopy.c:52:15: warning: 'bad_stack' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/net/ethernet/apm/xgene/xgene_enet_hw.c:759:22: warning: unused variable 'adev' [-Wunused-variable]
	../drivers/net/ethernet/apm/xgene/xgene_enet_hw.c:803:23: warning: 'phy_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
