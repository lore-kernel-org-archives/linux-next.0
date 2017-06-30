From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170630 build: 1 failures 7 warnings (next-20170630)
Date: Fri, 30 Jun 2017 09:54:51 +0100
Message-ID: <E1dQrhT-0004sB-Cn@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33948 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751589AbdF3I5I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Jun 2017 04:57:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170630
Git describe: next-20170630
Commit: a70e9c77d0 Add linux-next specific files for 20170630

Build Time: 0 min 11 sec

Passed:    6 / 7   ( 85.71 %)
Failed:    1 / 7   ( 14.29 %)

Errors: 1
Warnings: 7
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm-multi_v4t_defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!

Warnings Summary: 7
	  3 ../kernel/sched/fair.c:2657:9: warning: its scope is only this definition or declaration, which is probably not what you want
	  3 ../kernel/sched/fair.c:2657:9: warning: 'struct sched_domain' declared inside parameter list
	  2 ../drivers/rtc/rtc-brcmstb-waketimer.c:142:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../kernel/sched/fair.c:2655:44: warning: 'struct sched_domain' declared inside parameter list will not be visible outside of this definition or declaration
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/pinctrl/pinctrl-rza1.c:1260:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]



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
arm-allmodconfig : FAIL, 1 errors, 4 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!

Warnings:
	../drivers/pinctrl/pinctrl-rza1.c:1260:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/rtc/rtc-brcmstb-waketimer.c:142:6: warning: unused variable 'ret' [-Wunused-variable]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]

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
