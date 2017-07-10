From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170710 build: 2 failures 5 warnings (next-20170710)
Date: Mon, 10 Jul 2017 08:47:12 +0100
Message-ID: <E1dUTPU-0005oi-5M@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57822 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753495AbdGJHrT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Jul 2017 03:47:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170710
Git describe: next-20170710
Commit: 3ac23ebd35 Add linux-next specific files for 20170710

Build Time: 0 min 11 sec

Passed:    5 / 7   ( 71.43 %)
Failed:    2 / 7   ( 28.57 %)

Errors: 2
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm-multi_v4t_defconfig
	arm-allnoconfig

Errors:

	arm-multi_v4t_defconfig
../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'
../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'
../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'

	arm-allnoconfig
../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'
../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm-multi_v4t_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  5 ../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
	  5 ../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'

Warnings Summary: 5
	  5 ../include/linux/nvmem-provider.h:51:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
	  1 <command-line>:0:16: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'u32 {aka unsigned int}' [-Wformat=]
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1744:3: warning: ignoring return value of 'copy_to_iter', declared with attribute warn_unused_result [-Wunused-result]
	  1 ../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1643:2: warning: ignoring return value of 'copy_from_iter', declared with attribute warn_unused_result [-Wunused-result]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : FAIL, 6 errors, 3 warnings, 0 section mismatches

Errors:
	../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
	../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'
	../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
	../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'
	../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
	../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'

Warnings:
	../include/linux/nvmem-provider.h:51:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../include/linux/nvmem-provider.h:51:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../include/linux/nvmem-provider.h:51:9: warning: return makes pointer from integer without a cast [-Wint-conversion]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<command-line>:0:16: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'u32 {aka unsigned int}' [-Wformat=]
	../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1643:2: warning: ignoring return value of 'copy_from_iter', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1744:3: warning: ignoring return value of 'copy_to_iter', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 4 errors, 2 warnings, 0 section mismatches

Errors:
	../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
	../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'
	../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
	../include/linux/err.h:23:35: error: conflicting types for 'ERR_PTR'

Warnings:
	../include/linux/nvmem-provider.h:51:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
	../include/linux/nvmem-provider.h:51:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-multi_v7_defconfig
arm-multi_v5_defconfig
x86_64-defconfig
