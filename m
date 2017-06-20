From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170620 build: 1 failures 3 warnings (next-20170620)
Date: Tue, 20 Jun 2017 08:41:22 +0100
Message-ID: <E1dNDms-0006If-IG@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48724 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbdFTHni (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jun 2017 03:43:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170620
Git describe: next-20170620
Commit: ac1d73c21f Add linux-next specific files for 20170620

Build Time: 0 min 10 sec

Passed:    6 / 7   ( 85.71 %)
Failed:    1 / 7   ( 14.29 %)

Errors: 1
Warnings: 3
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [fs/ufs/ufs.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : x86_64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [fs/ufs/ufs.ko] undefined!

Warnings Summary: 3
	  1 ../drivers/gpu/drm/i915/intel_dp.c:1551:12: warning: 'rate_to_index' defined but not used [-Wunused-function]
	  1 ../drivers/gpu/drm/arm/hdlcd_crtc.c:264:6: warning: unused variable 'src_x' [-Wunused-variable]
	  1 ../drivers/gpu/drm/arm/hdlcd_crtc.c:264:13: warning: unused variable 'src_y' [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [fs/ufs/ufs.ko] undefined!

Warnings:
	../drivers/gpu/drm/arm/hdlcd_crtc.c:264:13: warning: unused variable 'src_y' [-Wunused-variable]
	../drivers/gpu/drm/arm/hdlcd_crtc.c:264:6: warning: unused variable 'src_x' [-Wunused-variable]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/i915/intel_dp.c:1551:12: warning: 'rate_to_index' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-multi_v7_defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
arm-multi_v5_defconfig
