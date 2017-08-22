From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170822 build: 0 failures 8 warnings (next-20170822)
Date: Tue, 22 Aug 2017 13:19:10 +0100
Message-ID: <E1dk89G-0004LK-Sn@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47410 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932427AbdHVMTN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Aug 2017 08:19:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170822
Git describe: next-20170822
Commit: b822482178 Add linux-next specific files for 20170822

Build Time: 98 min 24 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 8
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      7 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 8
	  2 ../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/spi/spi-imx.c:319:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	  2 ../drivers/spi/spi-imx.c:284:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	  1 ../include/linux/dynamic_debug.h:134:3: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/rtlwifi/base.c:2546:34: warning: 'ht_cap_ie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/phy/ralink/phy-ralink-usb.c:195:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mmc/core/mmc_test.c:883:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/phy/ralink/phy-ralink-usb.c:195:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/spi/spi-imx.c:284:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	../drivers/spi/spi-imx.c:319:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/mmc/core/mmc_test.c:883:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/linux/dynamic_debug.h:134:3: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/spi/spi-imx.c:284:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	../drivers/spi/spi-imx.c:319:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	../drivers/staging/rtlwifi/base.c:2546:34: warning: 'ht_cap_ie' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
