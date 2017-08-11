From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170811 build: 1 failures 12 warnings (next-20170811)
Date: Fri, 11 Aug 2017 14:31:03 +0100
Message-ID: <E1dgA1n-0003Xs-Fl@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49674 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753076AbdHKNdU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Aug 2017 09:33:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170811
Git describe: next-20170811
Commit: 91dfed74ea Add linux-next specific files for 20170811

Build Time: 92 min 34 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 12
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
      1 warnings    0 mismatches  : x86_64-allnoconfig
     11 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	 11 ../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]

Warnings Summary: 12
	  1 ../drivers/mmc/core/mmc_test.c:883:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:951:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:497:59: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2774:31: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2762:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2474:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1997:24: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1836:34: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1166:30: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/infiniband/hw/hns/hns_roce_eq.c:571:30: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../arch/x86/kernel/cpu/amd.c:305:13: warning: 'legacy_fixup_core_id' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/cpu/amd.c:305:13: warning: 'legacy_fixup_core_id' defined but not used [-Wunused-function]

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
	../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/mmc/core/mmc_test.c:883:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
