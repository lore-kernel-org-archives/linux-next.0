From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170228 build: 1 failures 6 warnings (next-20170228)
Date: Tue, 28 Feb 2017 07:26:52 +0000
Message-ID: <E1cicBO-0001be-Me@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41218 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751181AbdB1JVU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Feb 2017 04:21:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170228
Git describe: next-20170228
Commit: 8d01c06948 Add linux-next specific files for 20170228

Build Time: 165 min 54 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 6
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/scsi/lpfc/lpfc.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
      2 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      8 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [drivers/scsi/lpfc/lpfc.ko] undefined!

Warnings Summary: 6
	 12 <stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	  2 ../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 12 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  2 ../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 11 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/device.h:1479:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../include/linux/device.h:1474:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
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
arm-allmodconfig : FAIL, 1 errors, 8 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/scsi/lpfc/lpfc.ko] undefined!

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../include/linux/device.h:1474:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/device.h:1479:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 11 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 12 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 11 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/scsi/lpfc/lpfc_logmsg.h:52:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 12 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
