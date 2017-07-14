From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170714 build: 0 failures 4 warnings (next-20170714)
Date: Fri, 14 Jul 2017 06:59:29 +0100
Message-ID: <E1dVtdR-0007vX-Jj@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59706 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbdGNGBq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Jul 2017 02:01:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170714
Git describe: next-20170714
Commit: 674b585feb Add linux-next specific files for 20170714

Build Time: 0 min 14 sec

Passed:    7 / 7   (100.00 %)
Failed:    0 / 7   (  0.00 %)

Errors: 0
Warnings: 4
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 4
	  1 <command-line>:0:16: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'u32 {aka unsigned int}' [-Wformat=]
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1744:3: warning: ignoring return value of 'copy_to_iter', declared with attribute warn_unused_result [-Wunused-result]
	  1 ../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1643:2: warning: ignoring return value of 'copy_from_iter', declared with attribute warn_unused_result [-Wunused-result]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<command-line>:0:16: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'u32 {aka unsigned int}' [-Wformat=]
	../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1643:2: warning: ignoring return value of 'copy_from_iter', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:1744:3: warning: ignoring return value of 'copy_to_iter', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
