From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170309 build: 0 failures 4 warnings (next-20170309)
Date: Thu, 09 Mar 2017 09:23:37 +0000
Message-ID: <E1cluIK-0001iV-G3@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37290 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752458AbdCIJXs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Mar 2017 04:23:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170309
Git describe: next-20170309
Commit: 2e62da1e53 Add linux-next specific files for 20170309

Build Time: 188 min 58 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 4
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
      3 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      5 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 4
	 13 <stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	  2 ../drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h:128:3: warning: the address of '__func__' will always evaluate as 'true' [-Waddress]
	  1 ../sound/soc/codecs/cs35l35.c:1371:2: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
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
arm-allmodconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
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
