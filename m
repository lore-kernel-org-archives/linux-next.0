From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170810 build: 2 failures 13 warnings (next-20170810)
Date: Thu, 10 Aug 2017 19:21:05 +0100
Message-ID: <E1dfs4v-0007uQ-5x@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55334 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752504AbdHJSXX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Aug 2017 14:23:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170810
Git describe: next-20170810
Commit: b23cb848c7 Add linux-next specific files for 20170810

Build Time: 96 min 13 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 1
Warnings: 13
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
     11 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	 11 ../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]

Warnings Summary: 13
	  2 ../drivers/spi/spi-qup.c:507:28: warning: 'tx_nents' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/spi/spi-qup.c:1062:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/spi/spi-qup.c:464:7: warning: 'rx_nents' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/spi/spi-qup.c:464:17: warning: 'tx_nents' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:951:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:497:59: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2774:31: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2762:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2474:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1997:24: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1836:34: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1166:30: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_eq.c:571:30: warning: right shift count >= width of type [-Wshift-count-overflow]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/spi/spi-qup.c:1062:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/spi/spi-qup.c:507:28: warning: 'tx_nents' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 11 errors, 11 warnings, 0 section mismatches

Errors:
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]

Warnings:
	../drivers/infiniband/hw/hns/hns_roce_eq.c:571:30: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:497:59: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:951:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1166:30: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1836:34: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1997:24: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2474:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2762:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2774:31: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/spi/spi-qup.c:464:17: warning: 'tx_nents' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/spi/spi-qup.c:464:7: warning: 'rx_nents' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/spi/spi-qup.c:1062:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/spi/spi-qup.c:507:28: warning: 'tx_nents' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
