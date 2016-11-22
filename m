From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161122 build: 1 failures 20 warnings (next-20161122)
Date: Tue, 22 Nov 2016 13:35:26 +0000
Message-ID: <E1c9BEM-0006Ow-Bs@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59858 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755274AbcKVNff (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Nov 2016 08:35:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161122
Git describe: next-20161122
Commit: 637aaecae2 Add linux-next specific files for 20161122

Build Time: 94 min 0 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 20
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [fs/f2fs/f2fs.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     28 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [fs/f2fs/f2fs.ko] undefined!

Warnings Summary: 20
	  5 ../include/linux/device.h:1300:36: warning: 'dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  4 ../drivers/net/ethernet/marvell/mvpp2.c:529:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  3 ../fs/overlayfs/overlayfs.h:92:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../drivers/net/ethernet/marvell/mvpp2.c:517:34: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  2 ../drivers/scsi/hpsa.c:2033:5: warning: 'sd' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/net/ethernet/marvell/mvpp2.c:537:33: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  2 ../drivers/net/ethernet/marvell/mvpp2.c:524:33: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  2 ../drivers/net/ethernet/marvell/mvpp2.c:3375:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  2 ../drivers/net/ethernet/marvell/mvneta_bm.c:128:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/marvell/mvpp2.c:5136:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/marvell/mvpp2.c:5066:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/marvell/mvpp2.c:5011:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/marvell/mvpp2.c:3647:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/marvell/mvpp2.c:3433:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/marvell/mvneta_bm.c:103:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/marvell/mvneta.c:2023:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/marvell/mvneta.c:1902:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/marvell/mvneta.c:1864:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/marvell/mvneta.c:1802:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/clocksource/timer-nps.c:102:6: warning: 'nps_timer1_freq' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 28 warnings, 0 section mismatches

Warnings:
	../fs/overlayfs/overlayfs.h:92:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/device.h:1300:36: warning: 'dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/net/ethernet/marvell/mvneta_bm.c:103:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/marvell/mvneta_bm.c:128:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/marvell/mvneta_bm.c:128:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/marvell/mvneta.c:1802:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/marvell/mvneta.c:1864:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/marvell/mvneta.c:1902:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/marvell/mvneta.c:2023:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/marvell/mvpp2.c:524:33: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:517:34: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:517:34: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:529:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:529:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:517:34: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:529:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:537:33: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:529:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:537:33: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:524:33: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/marvell/mvpp2.c:3375:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/marvell/mvpp2.c:3375:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/marvell/mvpp2.c:3433:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/marvell/mvpp2.c:3647:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/marvell/mvpp2.c:5011:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/marvell/mvpp2.c:5066:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/marvell/mvpp2.c:5136:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/scsi/hpsa.c:2033:5: warning: 'sd' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/device.h:1300:36: warning: 'dev' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 4 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [fs/f2fs/f2fs.ko] undefined!

Warnings:
	../drivers/clocksource/timer-nps.c:102:6: warning: 'nps_timer1_freq' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/device.h:1300:36: warning: 'dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/overlayfs.h:92:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/scsi/hpsa.c:2033:5: warning: 'sd' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/device.h:1300:36: warning: 'dev' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/overlayfs/overlayfs.h:92:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/device.h:1300:36: warning: 'dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v4t_defconfig
x86_64-defconfig
