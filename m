From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170823 build: 1 failures 9 warnings (next-20170823)
Date: Wed, 23 Aug 2017 12:38:04 +0100
Message-ID: <E1dkTz2-0001jl-7T@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46452 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753768AbdHWLiG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Aug 2017 07:38:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170823
Git describe: next-20170823
Commit: cc6d46bb99 Add linux-next specific files for 20170823

Build Time: 102 min 39 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 3
Warnings: 9
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/rtc/rtc-sa1100.c:272:2: error: 'ret' undeclared (first use in this function)
../drivers/rtc/rtc-sa1100.c:273:22: error: 'dev' undeclared (first use in this function)
../drivers/rtc/rtc-sa1100.c:285:2: error: 'rtc' undeclared (first use in this function)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      6 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      8 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 3
	  1 ../drivers/rtc/rtc-sa1100.c:285:2: error: 'rtc' undeclared (first use in this function)
	  1 ../drivers/rtc/rtc-sa1100.c:273:22: error: 'dev' undeclared (first use in this function)
	  1 ../drivers/rtc/rtc-sa1100.c:272:2: error: 'ret' undeclared (first use in this function)

Warnings Summary: 9
	  3 ../sound/soc/tegra/tegra_wm8903.c:206:23: warning: unused variable 'machine' [-Wunused-variable]
	  2 ../net/ipv6/route.c:1322:43: warning: 'rt_cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/spi/spi-imx.c:319:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	  2 ../drivers/spi/spi-imx.c:284:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	  1 ../include/linux/dynamic_debug.h:134:3: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/rtlwifi/base.c:2546:34: warning: 'ht_cap_ie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/phy/ralink/phy-ralink-usb.c:195:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/ipv6/route.c:1322:43: warning: 'rt_cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/tegra/tegra_wm8903.c:206:23: warning: unused variable 'machine' [-Wunused-variable]
	../drivers/phy/ralink/phy-ralink-usb.c:195:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/spi/spi-imx.c:284:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	../drivers/spi/spi-imx.c:319:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../sound/soc/tegra/tegra_wm8903.c:206:23: warning: unused variable 'machine' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 3 errors, 8 warnings, 0 section mismatches

Errors:
	../drivers/rtc/rtc-sa1100.c:272:2: error: 'ret' undeclared (first use in this function)
	../drivers/rtc/rtc-sa1100.c:273:22: error: 'dev' undeclared (first use in this function)
	../drivers/rtc/rtc-sa1100.c:285:2: error: 'rtc' undeclared (first use in this function)

Warnings:
	../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/tegra/tegra_wm8903.c:206:23: warning: unused variable 'machine' [-Wunused-variable]
	../net/ipv6/route.c:1322:43: warning: 'rt_cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/linux/dynamic_debug.h:134:3: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/spi/spi-imx.c:284:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	../drivers/spi/spi-imx.c:319:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
	../drivers/staging/rtlwifi/base.c:2546:34: warning: 'ht_cap_ie' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
