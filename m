From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160104 build: 3 failures 15 warnings (next-20160104)
Date: Mon, 04 Jan 2016 12:12:20 +0000
Message-ID: <E1aG3zo-0000gt-2t@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35408 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456AbcADMM3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2016 07:12:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160104
Git describe: next-20160104
Commit: 57c4229929 Add linux-next specific files for 20160104

Build Time: 65 min 8 sec

Passed:    6 / 9   ( 66.67 %)
Failed:    3 / 9   ( 33.33 %)

Errors: 1
Warnings: 15
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig
	arm64-defconfig

Errors:

	arm64-allmodconfig
Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error
Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

	arm64-defconfig
Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allnoconfig
      5 warnings    0 mismatches  : arm64-allmodconfig
      7 warnings    0 mismatches  : arm-multi_v5_defconfig
      9 warnings    0 mismatches  : arm-multi_v7_defconfig
      7 warnings    0 mismatches  : arm-allmodconfig
      4 warnings    0 mismatches  : arm-allnoconfig
      4 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  3 Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

Warnings Summary: 15
	  7 ../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	  7 ../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	  6 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  4 ../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  2 ../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 arch/arm/configs/multi_v7_defconfig:435:warning: symbol value 'm' invalid for MFD_DA9063
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/udf/inode.c:1974:3: warning: 'adsize' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/udf/inode.c:1927:28: warning: 'adsize' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/dax.c:916:17: warning: passing argument 1 of '__dax_dbg' from incompatible pointer type
	  1 ../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 5 warnings, 0 section mismatches

Errors:
	Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error
	Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

Warnings:
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../fs/dax.c:916:17: warning: passing argument 1 of '__dax_dbg' from incompatible pointer type
	../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]
	../fs/udf/inode.c:1974:3: warning: 'adsize' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/udf/inode.c:1927:28: warning: 'adsize' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:435:warning: symbol value 'm' invalid for MFD_DA9063
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 1 errors, 4 warnings, 0 section mismatches

Errors:
	Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

Warnings:
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
