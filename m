From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160106 build: 0 failures 13 warnings (next-20160106)
Date: Wed, 06 Jan 2016 11:45:31 +0000
Message-ID: <E1aGmWx-00038s-9M@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38143 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752025AbcAFLpi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2016 06:45:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160106
Git describe: next-20160106
Commit: 600690a892 Add linux-next specific files for 20160106

Build Time: 73 min 23 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 13
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      7 warnings    0 mismatches  : arm-multi_v7_defconfig
      7 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 13
	  7 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  2 ../fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
	  1 arch/arm/configs/multi_v7_defconfig:435:warning: symbol value 'm' invalid for MFD_DA9063
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/orangefs/symlink.c:32:2: warning: initialization from incompatible pointer type [enabled by default]
	  1 ../fs/orangefs/symlink.c:32:2: warning: (near initialization for 'orangefs_symlink_inode_operations.get_link') [enabled by default]
	  1 ../fs/orangefs/symlink.c:32:14: warning: initialization from incompatible pointer type
	  1 ../fs/orangefs/symlink.c:32:14: warning: (near initialization for 'orangefs_symlink_inode_operations.get_link')
	  1 ../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../fs/orangefs/symlink.c:32:14: warning: initialization from incompatible pointer type
	../fs/orangefs/symlink.c:32:14: warning: (near initialization for 'orangefs_symlink_inode_operations.get_link')
	../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:435:warning: symbol value 'm' invalid for MFD_DA9063
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
	../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../fs/orangefs/symlink.c:32:2: warning: initialization from incompatible pointer type [enabled by default]
	../fs/orangefs/symlink.c:32:2: warning: (near initialization for 'orangefs_symlink_inode_operations.get_link') [enabled by default]
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
