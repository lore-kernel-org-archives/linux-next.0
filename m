From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170209 build: 0 failures 18 warnings (next-20170209)
Date: Thu, 09 Feb 2017 12:18:07 +0000
Message-ID: <E1cbnfq-0002b2-UI@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58310 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdBIMtO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Feb 2017 07:49:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170209
Git describe: next-20170209
Commit: 9f7e70ff42 Add linux-next specific files for 20170209

Build Time: 122 min 5 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 18
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     11 warnings    0 mismatches  : arm64-allmodconfig
      8 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Warnings Summary: 18
	  3 warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/device.h:1477:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	  1 ../include/linux/device.h:1472:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
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
arm64-allmodconfig : PASS, 0 errors, 11 warnings, 0 section mismatches

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
arm-allmodconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	../drivers/cpufreq/ti-cpufreq.c:250:6: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
	../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/device.h:1472:20: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
	../include/linux/device.h:1477:15: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
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
