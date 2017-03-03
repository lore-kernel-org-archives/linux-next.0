From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170303 build: 0 failures 4 warnings (next-20170303)
Date: Fri, 03 Mar 2017 08:31:45 +0000
Message-ID: <E1cjicr-0006bT-3G@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58292 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751768AbdCCKHx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Mar 2017 05:07:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170303
Git describe: next-20170303
Commit: c0b7b2b33b Add linux-next specific files for 20170303

Build Time: 188 min 37 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 4
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
      2 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      5 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 4
	 13 <stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
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
arm-allmodconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	../include/linux/device.h:1474:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/device.h:1479:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
