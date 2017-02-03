From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170203 build: 4 failures 7 warnings (next-20170203)
Date: Fri, 03 Feb 2017 08:39:51 +0000
Message-ID: <E1cZZPK-0004vs-V1@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58934 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751726AbdBCIj6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2017 03:39:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170203
Git describe: next-20170203
Commit: 421cf055e6 Add linux-next specific files for 20170203

Build Time: 95 min 22 sec

Passed:    6 / 10   ( 60.00 %)
Failed:    4 / 10   ( 40.00 %)

Errors: 4
Warnings: 7
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allnoconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]

	arm-allnoconfig
../mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
../mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'

	arm-allmodconfig
../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]
../drivers/staging/media/platform/bcm2835/mmal-vchiq.c:453:8: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : x86_64-allnoconfig
      1 warnings    0 mismatches  : arm64-allnoconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      6 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 4
	  2 ../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]
	  1 ../mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'
	  1 ../mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
	  1 ../drivers/staging/media/platform/bcm2835/mmal-vchiq.c:453:8: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]

Warnings Summary: 7
	  3 ../drivers/char/random.c:318:12: warning: 'random_min_urandom_seed' defined but not used [-Wunused-variable]
	  1 ../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:814:40: warning: 'out_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/char/random.c:318:12: warning: 'random_min_urandom_seed' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/char/random.c:318:12: warning: 'random_min_urandom_seed' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 2 errors, 1 warnings, 0 section mismatches

Errors:
	../mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
	../mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'

Warnings:
	../drivers/char/random.c:318:12: warning: 'random_min_urandom_seed' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 6 warnings, 0 section mismatches

Errors:
	../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]
	../drivers/staging/media/platform/bcm2835/mmal-vchiq.c:453:8: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]

Warnings:
	../drivers/iio/adc/rcar-gyroadc.c:429:27: warning: 'num_channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:426:22: warning: 'sample_width' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:428:23: warning: 'channels' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/iio/adc/rcar-gyroadc.c:398:26: warning: 'adcmode' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:814:40: warning: 'out_dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dynamic_debug.h:126:3: warning: 'ept_cfg' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v4t_defconfig
x86_64-defconfig
arm-multi_v7_defconfig
arm-multi_v5_defconfig
arm64-defconfig
