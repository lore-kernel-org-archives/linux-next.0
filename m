From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170308 build: 0 failures 7 warnings (next-20170308)
Date: Wed, 08 Mar 2017 07:46:28 +0000
Message-ID: <E1clWIm-0007fB-4J@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59332 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751174AbdCHJmd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Mar 2017 04:42:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170308
Git describe: next-20170308
Commit: 56b8bad5e0 Add linux-next specific files for 20170308

Build Time: 98 min 23 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 7
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
      3 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      6 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      4 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 7
	 13 <stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	  2 ../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:128:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]
	  1 ../sound/soc/codecs/cs35l35.c:1371:2: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/overlayfs/inode.c:323:30: warning: 'ovl_i_mutex_dir_key' defined but not used [-Wunused-variable]
	  1 ../fs/overlayfs/inode.c:322:30: warning: 'ovl_i_mutex_key' defined but not used [-Wunused-variable]
	  1 ../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:138:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../sound/soc/codecs/cs35l35.c:1371:2: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:138:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]
	../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:128:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]
	../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:128:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../fs/overlayfs/inode.c:323:30: warning: 'ovl_i_mutex_dir_key' defined but not used [-Wunused-variable]
	../fs/overlayfs/inode.c:322:30: warning: 'ovl_i_mutex_key' defined but not used [-Wunused-variable]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
