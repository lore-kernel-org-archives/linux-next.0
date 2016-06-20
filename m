From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160620 build: 2 failures 9 warnings (next-20160620)
Date: Mon, 20 Jun 2016 11:17:20 +0100
Message-ID: <E1bEwGe-0004DR-4p@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52930 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932130AbcFTLAz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Jun 2016 07:00:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160620
Git describe: next-20160620
Commit: 6ab97590a2 Add linux-next specific files for 20160620

Build Time: 87 min 20 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 2
Warnings: 9
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/iommu/mtk_iommu.c:27:32: fatal error: linux/of_component.h: No such file or directory

	arm-allmodconfig
../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
../drivers/iommu/mtk_iommu.c:27:32: fatal error: linux/of_component.h: No such file or directory

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      8 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v7_defconfig
     72 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  3 ../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	  2 ../drivers/iommu/mtk_iommu.c:27:32: fatal error: linux/of_component.h: No such file or directory

Warnings Summary: 9
	 66 ../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	  4 ../drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	  4 ../drivers/pci/host/pci-host-common.c:88:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	  4 ../drivers/pci/host/pci-host-common.c:108:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
	  2 ../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/staging/ks7010/ks7010_config.c:263:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 8 warnings, 0 section mismatches

Errors:
	../drivers/iommu/mtk_iommu.c:27:32: fatal error: linux/of_component.h: No such file or directory

Warnings:
	../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
	../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pci/host/pci-host-common.c:88:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/pci/host/pci-host-common.c:108:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/ks7010/ks7010_config.c:263:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/pci/host/pci-host-common.c:88:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/pci/host/pci-host-common.c:108:9: warning: return makes pointer from integer without a cast [-Wint-conversion]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 4 errors, 72 warnings, 0 section mismatches

Errors:
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	../include/linux/compiler-gcc.h:243:38: error: impossible constraint in 'asm'
	../drivers/iommu/mtk_iommu.c:27:32: fatal error: linux/of_component.h: No such file or directory

Warnings:
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../include/linux/compiler-gcc.h:243:38: warning: asm operand 0 probably doesn't match constraints
	../net/rxrpc/peer_object.c:57:15: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:134:3: warning: 'carrier_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pci/host/pci-host-common.c:88:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/pci/host/pci-host-common.c:108:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/staging/ks7010/ks7010_config.c:263:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/pci/host/pci-host-common.c:88:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../drivers/pci/host/pci-host-common.c:108:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
