From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170629 build: 0 failures 6 warnings (next-20170629)
Date: Thu, 29 Jun 2017 09:33:33 +0100
Message-ID: <E1dQUtJ-0004eo-Iy@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54912 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752136AbdF2Ifv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jun 2017 04:35:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170629
Git describe: next-20170629
Commit: 3fb8ba638d Add linux-next specific files for 20170629

Build Time: 0 min 10 sec

Passed:    7 / 7   (100.00 %)
Failed:    0 / 7   (  0.00 %)

Errors: 0
Warnings: 6
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      3 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm-multi_v4t_defconfig

-------------------------------------------------------------------------------

Warnings Summary: 6
	  3 ../kernel/sched/fair.c:2657:9: warning: its scope is only this definition or declaration, which is probably not what you want
	  3 ../kernel/sched/fair.c:2657:9: warning: 'struct sched_domain' declared inside parameter list
	  2 ../drivers/rtc/rtc-brcmstb-waketimer.c:142:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../kernel/sched/fair.c:2655:44: warning: 'struct sched_domain' declared inside parameter list will not be visible outside of this definition or declaration
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../kernel/sched/fair.c:2657:9: warning: 'struct sched_domain' declared inside parameter list
	../kernel/sched/fair.c:2657:9: warning: its scope is only this definition or declaration, which is probably not what you want

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/rtc/rtc-brcmstb-waketimer.c:142:6: warning: unused variable 'ret' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/rtc/rtc-brcmstb-waketimer.c:142:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../kernel/sched/fair.c:2657:9: warning: 'struct sched_domain' declared inside parameter list
	../kernel/sched/fair.c:2657:9: warning: its scope is only this definition or declaration, which is probably not what you want

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../kernel/sched/fair.c:2655:44: warning: 'struct sched_domain' declared inside parameter list will not be visible outside of this definition or declaration

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../kernel/sched/fair.c:2657:9: warning: 'struct sched_domain' declared inside parameter list
	../kernel/sched/fair.c:2657:9: warning: its scope is only this definition or declaration, which is probably not what you want
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-defconfig
