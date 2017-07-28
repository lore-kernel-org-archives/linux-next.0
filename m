From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170728 build: 1 failures 2 warnings (next-20170728)
Date: Fri, 28 Jul 2017 11:28:54 +0100
Message-ID: <E1db2Vq-0000IU-Ew@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:32838 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751776AbdG1K3A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Jul 2017 06:29:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170728
Git describe: next-20170728
Commit: b2cf822e07 Add linux-next specific files for 20170728

Build Time: 103 min 27 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 5
Warnings: 2
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/infiniband/hw/hns/hns_roce_eq.c:477:8: error: unknown type name 'irqreturn_t'
../drivers/infiniband/hw/hns/hns_roce_eq.c:485:9: error: implicit declaration of function 'IRQ_RETVAL' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_eq.c:711:9: error: implicit declaration of function 'request_irq' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_eq.c:726:3: error: implicit declaration of function 'free_irq' [-Werror=implicit-function-declaration]
../drivers/staging/fsl-dpaa2/ethernet/../../fsl-mc/include/dpaa2-io.h:86:1: error: unknown type name 'irqreturn_t'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 5
	  1 ../drivers/staging/fsl-dpaa2/ethernet/../../fsl-mc/include/dpaa2-io.h:86:1: error: unknown type name 'irqreturn_t'
	  1 ../drivers/infiniband/hw/hns/hns_roce_eq.c:726:3: error: implicit declaration of function 'free_irq' [-Werror=implicit-function-declaration]
	  1 ../drivers/infiniband/hw/hns/hns_roce_eq.c:711:9: error: implicit declaration of function 'request_irq' [-Werror=implicit-function-declaration]
	  1 ../drivers/infiniband/hw/hns/hns_roce_eq.c:485:9: error: implicit declaration of function 'IRQ_RETVAL' [-Werror=implicit-function-declaration]
	  1 ../drivers/infiniband/hw/hns/hns_roce_eq.c:477:8: error: unknown type name 'irqreturn_t'

Warnings Summary: 2
	  2 ../drivers/iommu/exynos-iommu.c:58:2: warning: #warning "revisit driver if we can enable big-endian ptes" [-Wcpp]
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 5 errors, 1 warnings, 0 section mismatches

Errors:
	../drivers/infiniband/hw/hns/hns_roce_eq.c:477:8: error: unknown type name 'irqreturn_t'
	../drivers/infiniband/hw/hns/hns_roce_eq.c:485:9: error: implicit declaration of function 'IRQ_RETVAL' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_eq.c:711:9: error: implicit declaration of function 'request_irq' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_eq.c:726:3: error: implicit declaration of function 'free_irq' [-Werror=implicit-function-declaration]
	../drivers/staging/fsl-dpaa2/ethernet/../../fsl-mc/include/dpaa2-io.h:86:1: error: unknown type name 'irqreturn_t'

Warnings:
	../drivers/iommu/exynos-iommu.c:58:2: warning: #warning "revisit driver if we can enable big-endian ptes" [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/iommu/exynos-iommu.c:58:2: warning: #warning "revisit driver if we can enable big-endian ptes" [-Wcpp]
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
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
