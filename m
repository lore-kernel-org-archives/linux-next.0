From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170322 build: 0 failures 3 warnings (next-20170322)
Date: Wed, 22 Mar 2017 07:33:35 +0000
Message-ID: <E1cqalz-0005u2-CZ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55876 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751370AbdCVHdn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Mar 2017 03:33:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170322
Git describe: next-20170322
Commit: abbb80a64e Add linux-next specific files for 20170322

Build Time: 100 min 3 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
      6 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      4 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	 13 <stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	  5 <stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	  4 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
