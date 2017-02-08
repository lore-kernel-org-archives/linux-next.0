From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170208 build: 1 failures 16 warnings (next-20170208)
Date: Wed, 08 Feb 2017 10:54:16 +0000
Message-ID: <E1cbPtA-00012m-9J@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53040 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752573AbdBHK4F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Feb 2017 05:56:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170208
Git describe: next-20170208
Commit: e3e6c5f354 Add linux-next specific files for 20170208

Build Time: 98 min 5 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 2
Warnings: 16
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig

Errors:

	arm64-allmodconfig
../arch/arm64/kernel/armv8_deprecated.c:359:31: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'aarch32_check_condition'
../arch/arm64/kernel/armv8_deprecated.c:386:10: error: implicit declaration of function 'aarch32_check_condition' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     11 warnings    0 mismatches  : arm64-allmodconfig
      6 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  1 ../arch/arm64/kernel/armv8_deprecated.c:386:10: error: implicit declaration of function 'aarch32_check_condition' [-Werror=implicit-function-declaration]
	  1 ../arch/arm64/kernel/armv8_deprecated.c:359:31: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'aarch32_check_condition'

Warnings Summary: 16
	  3 warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/crypto/atmel-sha.c:997:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../drivers/crypto/atmel-sha.c:817:27: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../drivers/crypto/atmel-sha.c:775:19: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../drivers/crypto/atmel-sha.c:747:19: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../drivers/crypto/atmel-sha.c:726:26: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../drivers/crypto/atmel-sha.c:647:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../drivers/crypto/atmel-sha.c:600:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../drivers/crypto/atmel-sha.c:571:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../drivers/cpufreq/ti-cpufreq.c:250:6: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
	  1 ../arch/arm/mach-orion5x/wnr854t-setup.c:109:44: warning: 'wnr854t_switch_plat_data' defined but not used [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 11 warnings, 0 section mismatches

Errors:
	../arch/arm64/kernel/armv8_deprecated.c:359:31: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'aarch32_check_condition'
	../arch/arm64/kernel/armv8_deprecated.c:386:10: error: implicit declaration of function 'aarch32_check_condition' [-Werror=implicit-function-declaration]

Warnings:
	warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)
	warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)
	warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)
	../drivers/crypto/atmel-sha.c:571:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/crypto/atmel-sha.c:600:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/crypto/atmel-sha.c:647:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/crypto/atmel-sha.c:726:26: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/crypto/atmel-sha.c:747:19: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/crypto/atmel-sha.c:775:19: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/crypto/atmel-sha.c:817:27: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../drivers/crypto/atmel-sha.c:997:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../drivers/cpufreq/ti-cpufreq.c:250:6: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
	../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/arm/mach-orion5x/wnr854t-setup.c:109:44: warning: 'wnr854t_switch_plat_data' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
