From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160724 build: 2 failures 6 warnings (next-20160724)
Date: Sun, 24 Jul 2016 12:08:44 +0100
Message-ID: <E1bRHH2-0004tC-9F@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33370 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752084AbcGXLIy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 24 Jul 2016 07:08:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160724
Git describe: next-20160724
Commit: 6f9bfbf3e7 Add linux-next specific files for 20160724

Build Time: 73 min 58 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 1
Warnings: 6
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm64-defconfig

Errors:

	arm64-allmodconfig
../arch/arm64/kvm/../../../virt/kvm/arm/vgic/vgic-irqfd.c:48:5: error: conflicting types for 'kvm_set_routing_entry'

	arm64-defconfig
../arch/arm64/kvm/../../../virt/kvm/arm/vgic/vgic-irqfd.c:48:5: error: conflicting types for 'kvm_set_routing_entry'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
      6 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ../arch/arm64/kvm/../../../virt/kvm/arm/vgic/vgic-irqfd.c:48:5: error: conflicting types for 'kvm_set_routing_entry'

Warnings Summary: 6
	  6 ../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	  6 ../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	  2 ../include/linux/of.h:1004:20: warning: comparison of distinct pointer types lacks a cast
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/misc/lkdtm_usercopy.c:52:15: warning: 'bad_stack' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 4 warnings, 0 section mismatches

Errors:
	../arch/arm64/kvm/../../../virt/kvm/arm/vgic/vgic-irqfd.c:48:5: error: conflicting types for 'kvm_set_routing_entry'

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../include/linux/of.h:1004:20: warning: comparison of distinct pointer types lacks a cast
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
arm-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../include/linux/of.h:1004:20: warning: comparison of distinct pointer types lacks a cast
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/misc/lkdtm_usercopy.c:52:15: warning: 'bad_stack' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	../arch/arm64/kvm/../../../virt/kvm/arm/vgic/vgic-irqfd.c:48:5: error: conflicting types for 'kvm_set_routing_entry'

Warnings:
	../drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
	../drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
