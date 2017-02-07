From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170207 build: 1 failures 16 warnings (next-20170207)
Date: Tue, 07 Feb 2017 11:24:41 +0000
Message-ID: <E1cb3t3-0007eX-GI@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48472 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752595AbdBGLYu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Feb 2017 06:24:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170207
Git describe: next-20170207
Commit: eb60f01302 Add linux-next specific files for 20170207

Build Time: 140 min 2 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 2
Warnings: 16
Section Mismatches: 0

Failed defconfigs:
	arm-allnoconfig

Errors:

	arm-allnoconfig
../mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
../mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
     12 warnings    0 mismatches  : arm64-allmodconfig
      7 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  1 ../mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'
	  1 ../mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'

Warnings Summary: 16
	  4 ../drivers/tty/serial/sh-sci.c:977:12: warning: 'scif_set_rtrg' defined but not used [-Wunused-function]
	  3 warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/scsi/aacraid/src.c:414:29: warning: right shift count >= width of type [-Wshift-count-overflow]
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



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/sh-sci.c:977:12: warning: 'scif_set_rtrg' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 12 warnings, 0 section mismatches

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
	../drivers/tty/serial/sh-sci.c:977:12: warning: 'scif_set_rtrg' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 2 errors, 0 warnings, 0 section mismatches

Errors:
	../mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
	../mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/scsi/aacraid/src.c:414:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/tty/serial/sh-sci.c:977:12: warning: 'scif_set_rtrg' defined but not used [-Wunused-function]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/sh-sci.c:977:12: warning: 'scif_set_rtrg' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-multi_v4t_defconfig
arm-multi_v5_defconfig
x86_64-defconfig
