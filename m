From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160105 build: 4 failures 16 warnings (next-20160105)
Date: Tue, 05 Jan 2016 10:12:20 +0000
Message-ID: <E1aGObD-00029R-St@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36488 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbcAEKMa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2016 05:12:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160105
Git describe: next-20160105
Commit: 8ef79cd05e Add linux-next specific files for 20160105

Build Time: 65 min 8 sec

Passed:    5 / 9   ( 55.56 %)
Failed:    4 / 9   ( 44.44 %)

Errors: 1
Warnings: 16
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
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
      2 warnings    0 mismatches  : arm64-allnoconfig
      7 warnings    0 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v5_defconfig
      9 warnings    0 mismatches  : arm-multi_v7_defconfig
      8 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm-allnoconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  3 Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

Warnings Summary: 16
	  7 ../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	  7 ../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	  6 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  2 ../fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
	  1 arch/arm/configs/multi_v7_defconfig:435:warning: symbol value 'm' invalid for MFD_DA9063
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/orangefs/symlink.c:32:2: warning: initialization from incompatible pointer type [enabled by default]
	  1 ../fs/orangefs/symlink.c:32:2: warning: (near initialization for 'orangefs_symlink_inode_operations.get_link') [enabled by default]
	  1 ../fs/orangefs/symlink.c:32:14: warning: initialization from incompatible pointer type
	  1 ../fs/orangefs/symlink.c:32:14: warning: (near initialization for 'orangefs_symlink_inode_operations.get_link')
	  1 ../fs/dax.c:916:17: warning: passing argument 1 of '__dax_dbg' from incompatible pointer type
	  1 ../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 7 warnings, 0 section mismatches

Errors:
	Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error
	Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

Warnings:
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../fs/orangefs/symlink.c:32:14: warning: initialization from incompatible pointer type
	../fs/orangefs/symlink.c:32:14: warning: (near initialization for 'orangefs_symlink_inode_operations.get_link')
	../fs/dax.c:916:17: warning: passing argument 1 of '__dax_dbg' from incompatible pointer type
	../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:435:warning: symbol value 'm' invalid for MFD_DA9063
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
	../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	../fs/orangefs/symlink.c:32:2: warning: initialization from incompatible pointer type [enabled by default]
	../fs/orangefs/symlink.c:32:2: warning: (near initialization for 'orangefs_symlink_inode_operations.get_link') [enabled by default]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 1 errors, 3 warnings, 0 section mismatches

Errors:
	Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

Warnings:
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
