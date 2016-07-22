From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160722 build: 1 failures 5 warnings (next-20160722)
Date: Fri, 22 Jul 2016 11:13:41 +0100
Message-ID: <E1bQXSf-0008Uu-Ej@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43868 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752378AbcGVKNs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2016 06:13:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160722
Git describe: next-20160722
Commit: 13123042d0 Add linux-next specific files for 20160722

Build Time: 86 min 57 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 1
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "dax_do_io" [fs/xfs/xfs.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
      5 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "dax_do_io" [fs/xfs/xfs.ko] undefined!

Warnings Summary: 5
	  6 ../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	  6 ../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
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
arm-allmodconfig : FAIL, 1 errors, 5 warnings, 0 section mismatches

Errors:
	ERROR: "dax_do_io" [fs/xfs/xfs.ko] undefined!

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/misc/lkdtm_usercopy.c:52:15: warning: 'bad_stack' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
