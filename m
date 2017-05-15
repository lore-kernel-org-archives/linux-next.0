From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170515 build: 1 failures 2 warnings (next-20170515)
Date: Mon, 15 May 2017 07:40:38 +0100
Message-ID: <E1dA9gM-0000Hx-Ro@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48056 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759481AbdEOGkp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 May 2017 02:40:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170515
Git describe: next-20170515
Commit: ecf5e3d45a Add linux-next specific files for 20170515

Build Time: 117 min 57 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 7
Warnings: 2
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../sound/atmel/ac97c.c:133:10: error: implicit declaration of function 'dw_dma_cyclic_prep' [-Werror=implicit-function-declaration]
../sound/atmel/ac97c.c:141:8: error: dereferencing pointer to incomplete type 'struct dw_cyclic_desc'
../sound/atmel/ac97c.c:262:5: error: implicit declaration of function 'dw_dma_cyclic_free' [-Werror=implicit-function-declaration]
../sound/atmel/ac97c.c:513:13: error: implicit declaration of function 'dw_dma_cyclic_start' [-Werror=implicit-function-declaration]
../sound/atmel/ac97c.c:525:4: error: implicit declaration of function 'dw_dma_cyclic_stop' [-Werror=implicit-function-declaration]
../sound/atmel/ac97c.c:597:11: error: implicit declaration of function 'dw_dma_get_src_addr' [-Werror=implicit-function-declaration]
../sound/atmel/ac97c.c:617:11: error: implicit declaration of function 'dw_dma_get_dst_addr' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig

-------------------------------------------------------------------------------

Errors summary: 7
	  1 ../sound/atmel/ac97c.c:617:11: error: implicit declaration of function 'dw_dma_get_dst_addr' [-Werror=implicit-function-declaration]
	  1 ../sound/atmel/ac97c.c:597:11: error: implicit declaration of function 'dw_dma_get_src_addr' [-Werror=implicit-function-declaration]
	  1 ../sound/atmel/ac97c.c:525:4: error: implicit declaration of function 'dw_dma_cyclic_stop' [-Werror=implicit-function-declaration]
	  1 ../sound/atmel/ac97c.c:513:13: error: implicit declaration of function 'dw_dma_cyclic_start' [-Werror=implicit-function-declaration]
	  1 ../sound/atmel/ac97c.c:262:5: error: implicit declaration of function 'dw_dma_cyclic_free' [-Werror=implicit-function-declaration]
	  1 ../sound/atmel/ac97c.c:141:8: error: dereferencing pointer to incomplete type 'struct dw_cyclic_desc'
	  1 ../sound/atmel/ac97c.c:133:10: error: implicit declaration of function 'dw_dma_cyclic_prep' [-Werror=implicit-function-declaration]

Warnings Summary: 2
	  2 ../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast
	  1 ../sound/atmel/ac97c.c:133:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 7 errors, 2 warnings, 0 section mismatches

Errors:
	../sound/atmel/ac97c.c:133:10: error: implicit declaration of function 'dw_dma_cyclic_prep' [-Werror=implicit-function-declaration]
	../sound/atmel/ac97c.c:141:8: error: dereferencing pointer to incomplete type 'struct dw_cyclic_desc'
	../sound/atmel/ac97c.c:262:5: error: implicit declaration of function 'dw_dma_cyclic_free' [-Werror=implicit-function-declaration]
	../sound/atmel/ac97c.c:513:13: error: implicit declaration of function 'dw_dma_cyclic_start' [-Werror=implicit-function-declaration]
	../sound/atmel/ac97c.c:525:4: error: implicit declaration of function 'dw_dma_cyclic_stop' [-Werror=implicit-function-declaration]
	../sound/atmel/ac97c.c:597:11: error: implicit declaration of function 'dw_dma_get_src_addr' [-Werror=implicit-function-declaration]
	../sound/atmel/ac97c.c:617:11: error: implicit declaration of function 'dw_dma_get_dst_addr' [-Werror=implicit-function-declaration]

Warnings:
	../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast
	../sound/atmel/ac97c.c:133:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
