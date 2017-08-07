From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170804 build: 2 failures 16 warnings (next-20170804)
Date: Mon, 07 Aug 2017 08:33:16 +0100
Message-ID: <E1decXM-00066S-QU@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39630 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751869AbdHGHfc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Aug 2017 03:35:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170804
Git describe: next-20170804
Commit: 50107a90cb Add linux-next specific files for 20170804

Build Time: 101 min 26 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 3
Warnings: 16
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/mmc/host/mmci_qcom_dml.c:58:6: error: redefinition of 'dml_start_xfer'
../drivers/mmc/host/mmci_qcom_dml.c:123:5: error: redefinition of 'dml_hw_init'

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
../drivers/mmc/host/mmci_qcom_dml.c:58:6: error: redefinition of 'dml_start_xfer'
../drivers/mmc/host/mmci_qcom_dml.c:123:5: error: redefinition of 'dml_hw_init'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      4 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
     14 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 3
	 11 ../drivers/infiniband/hw/hns/hns_roce_device.h:626:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
	  2 ../drivers/mmc/host/mmci_qcom_dml.c:58:6: error: redefinition of 'dml_start_xfer'
	  2 ../drivers/mmc/host/mmci_qcom_dml.c:123:5: error: redefinition of 'dml_hw_init'

Warnings Summary: 16
	  4 ../drivers/gpu/drm/msm/adreno/a5xx_gpu.c:493:19: warning: unused variable 'a5xx_gpu' [-Wunused-variable]
	  2 ../drivers/video/fbdev/matrox/matroxfb_base.c:1583:12: warning: 'hotplug' defined but not used [-Wunused-variable]
	  2 ../drivers/iommu/exynos-iommu.c:58:2: warning: #warning "revisit driver if we can enable big-endian ptes" [-Wcpp]
	  2 ../drivers/gpu/drm/msm/msm_gpu.c:742:31: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
	  1 ../include/linux/fbcon.h:9:13: warning: 'fb_console_exit' defined but not used [-Wunused-function]
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
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/fbcon.h:9:13: warning: 'fb_console_exit' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 4 warnings, 0 section mismatches

Errors:
	../drivers/mmc/host/mmci_qcom_dml.c:58:6: error: redefinition of 'dml_start_xfer'
	../drivers/mmc/host/mmci_qcom_dml.c:123:5: error: redefinition of 'dml_hw_init'

Warnings:
	../drivers/crypto/ccp/ccp-ops.c:1883:3: warning: 'sb_count' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/msm/adreno/a5xx_gpu.c:493:19: warning: unused variable 'a5xx_gpu' [-Wunused-variable]
	../drivers/iommu/exynos-iommu.c:58:2: warning: #warning "revisit driver if we can enable big-endian ptes" [-Wcpp]
	../drivers/video/fbdev/matrox/matroxfb_base.c:1583:12: warning: 'hotplug' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/msm/adreno/a5xx_gpu.c:493:19: warning: unused variable 'a5xx_gpu' [-Wunused-variable]
	../drivers/gpu/drm/msm/msm_gpu.c:742:31: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 13 errors, 14 warnings, 0 section mismatches

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
	../drivers/mmc/host/mmci_qcom_dml.c:58:6: error: redefinition of 'dml_start_xfer'
	../drivers/mmc/host/mmci_qcom_dml.c:123:5: error: redefinition of 'dml_hw_init'

Warnings:
	../drivers/gpu/drm/msm/adreno/a5xx_gpu.c:493:19: warning: unused variable 'a5xx_gpu' [-Wunused-variable]
	../drivers/gpu/drm/msm/msm_gpu.c:742:31: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
	../drivers/infiniband/hw/hns/hns_roce_eq.c:571:30: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:497:59: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:951:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1166:30: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1836:34: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1997:24: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2474:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2762:29: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:2774:31: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/iommu/exynos-iommu.c:58:2: warning: #warning "revisit driver if we can enable big-endian ptes" [-Wcpp]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/video/fbdev/matrox/matroxfb_base.c:1583:12: warning: 'hotplug' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/msm/adreno/a5xx_gpu.c:493:19: warning: unused variable 'a5xx_gpu' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
