From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170808 build: 1 failures 11 warnings (next-20170808)
Date: Tue, 08 Aug 2017 10:40:33 +0100
Message-ID: <E1df105-0003Ch-4x@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57042 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751464AbdHHJkk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2017 05:40:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170808
Git describe: next-20170808
Commit: c0b96dbc8c Add linux-next specific files for 20170808

Build Time: 92 min 38 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 11
Section Mismatches: 0

Failed defconfigs:
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
      1 warnings    0 mismatches  : arm64-allmodconfig
     10 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	 11 ../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]

Warnings Summary: 11
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:951:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:497:59: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2774:31: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2762:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2474:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1997:24: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1836:34: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1166:30: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_eq.c:571:30: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/crypto/ccp/ccp-ops.c:1883:3: warning: 'sb_count' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/crypto/ccp/ccp-ops.c:1883:3: warning: 'sb_count' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 11 errors, 10 warnings, 0 section mismatches

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
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
