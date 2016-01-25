From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160125 build: 0 failures 7 warnings (next-20160125)
Date: Mon, 25 Jan 2016 05:16:31 +0000
Message-ID: <E1aNZVu-0004Y4-Ut@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45476 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750728AbcAYFQh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2016 00:16:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160125
Git describe: next-20160125
Commit: e216cada8e Add linux-next specific files for 20160125

Build Time: 73 min 56 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 7
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
      6 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 7
	  7 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
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
