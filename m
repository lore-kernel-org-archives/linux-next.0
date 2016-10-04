From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161004 build: 2 failures 5 warnings (next-20161004)
Date: Tue, 04 Oct 2016 23:18:47 +0100
Message-ID: <E1brY2v-00042m-DP@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52226 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751025AbcJDWS5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Oct 2016 18:18:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161004
Git describe: next-20161004
Commit: c7d3b91218 Add linux-next specific files for 20161004

Build Time: 218 min 41 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 1
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

	arm-allmodconfig
ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      6 warnings    0 mismatches  : arm-multi_v5_defconfig
      7 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v4t_defconfig
      3 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings Summary: 5
	  7 <stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	  7 <stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	  7 <stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	  2 ../drivers/dma/imx-sdma.c:673:13: warning: 'sdma_handle_channel_loop' defined but not used [-Wunused-function]
	  1 ../include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings:
	../include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	../drivers/dma/imx-sdma.c:673:13: warning: 'sdma_handle_channel_loop' defined but not used [-Wunused-function]
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 4 warnings, 0 section mismatches

Errors:
	ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	../drivers/dma/imx-sdma.c:673:13: warning: 'sdma_handle_channel_loop' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
