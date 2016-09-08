From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160908 build: 2 failures 1 warnings (next-20160908)
Date: Thu, 08 Sep 2016 11:33:24 +0100
Message-ID: <E1bhwe4-00023R-1G@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38070 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966352AbcIHKde (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Sep 2016 06:33:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160908
Git describe: next-20160908
Commit: 4affa544ad Add linux-next specific files for 20160908

Build Time: 95 min 39 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 2
Warnings: 1
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!

	arm-allmodconfig
../crypto/crypto_engine.c:234:3: error: implicit declaration of function 'queue_kthread_work' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  1 ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!
	  1 ../crypto/crypto_engine.c:234:3: error: implicit declaration of function 'queue_kthread_work' [-Werror=implicit-function-declaration]

Warnings Summary: 1
	  2 ../arch/arm64/kvm/../../../virt/kvm/arm/arch_timer.c:457:1: warning: label 'out_free' defined but not used [-Wunused-label]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!

Warnings:
	../arch/arm64/kvm/../../../virt/kvm/arm/arch_timer.c:457:1: warning: label 'out_free' defined but not used [-Wunused-label]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../crypto/crypto_engine.c:234:3: error: implicit declaration of function 'queue_kthread_work' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/arm64/kvm/../../../virt/kvm/arm/arch_timer.c:457:1: warning: label 'out_free' defined but not used [-Wunused-label]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
