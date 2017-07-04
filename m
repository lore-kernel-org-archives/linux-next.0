From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170704 build: 1 failures 5 warnings (next-20170704)
Date: Tue, 04 Jul 2017 09:55:47 +0100
Message-ID: <E1dSJcZ-0006Xv-O9@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43024 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751979AbdGDIzz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Jul 2017 04:55:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170704
Git describe: next-20170704
Commit: 84fae2ca66 Add linux-next specific files for 20170704

Build Time: 0 min 30 sec

Passed:    6 / 7   ( 85.71 %)
Failed:    1 / 7   ( 14.29 %)

Errors: 1
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      5 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!

Warnings Summary: 5
	  2 ../drivers/rtc/rtc-brcmstb-waketimer.c:142:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 <command-line>:0:16: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'u32 {aka unsigned int}' [-Wformat=]
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1744:3: warning: ignoring return value of 'copy_to_iter', declared with attribute warn_unused_result [-Wunused-result]
	  1 ../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1643:2: warning: ignoring return value of 'copy_from_iter', declared with attribute warn_unused_result [-Wunused-result]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 5 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!

Warnings:
	<command-line>:0:16: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'u32 {aka unsigned int}' [-Wformat=]
	../drivers/rtc/rtc-brcmstb-waketimer.c:142:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1643:2: warning: ignoring return value of 'copy_from_iter', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1744:3: warning: ignoring return value of 'copy_to_iter', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/rtc/rtc-brcmstb-waketimer.c:142:6: warning: unused variable 'ret' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-multi_v4t_defconfig
arm-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
