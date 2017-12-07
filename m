From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171207 build: 0 failures 24 warnings (next-20171207)
Date: Thu, 07 Dec 2017 12:51:54 +0000
Message-ID: <E1eMvec-0000uV-6T@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52806 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753319AbdLGMv4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Dec 2017 07:51:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171207
Git describe: next-20171207
Commit: e40fd8d6b4 Add linux-next specific files for 20171207

Build Time: 123 min 26 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 24
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     14 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
     13 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
     14 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 24
	  7 ../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/scsi/bfa/bfad_bsg.c:3353:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	  2 ../drivers/scsi/bfa/bfad_bsg.c:3137:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	  2 ../drivers/md/dm-bufio.c:1752:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  1 arch/arm/configs/multi_v7_defconfig:966:warning: override: reassigning to symbol VIRTIO_MMIO
	  1 arch/arm/configs/multi_v7_defconfig:964:warning: override: reassigning to symbol VIRTIO_PCI
	  1 arch/arm/configs/multi_v7_defconfig:962:warning: override: reassigning to symbol VIDEO_VIVID
	  1 arch/arm/configs/multi_v7_defconfig:934:warning: override: reassigning to symbol HW_RANDOM_ST
	  1 arch/arm/configs/multi_v7_defconfig:933:warning: override: reassigning to symbol HW_RANDOM
	  1 arch/arm/configs/multi_v7_defconfig:932:warning: override: reassigning to symbol KEYSTONE_IRQ
	  1 arch/arm/configs/multi_v7_defconfig:846:warning: override: reassigning to symbol ARCH_TEGRA_124_SOC
	  1 arch/arm/configs/multi_v7_defconfig:845:warning: override: reassigning to symbol ARCH_TEGRA_114_SOC
	  1 arch/arm/configs/multi_v7_defconfig:844:warning: override: reassigning to symbol ARCH_TEGRA_3x_SOC
	  1 arch/arm/configs/multi_v7_defconfig:843:warning: override: reassigning to symbol ARCH_TEGRA_2x_SOC



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 14 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm-bufio.c:1752:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/scsi/bfa/bfad_bsg.c:3137:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/scsi/bfa/bfad_bsg.c:3353:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 13 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:843:warning: override: reassigning to symbol ARCH_TEGRA_2x_SOC
	arch/arm/configs/multi_v7_defconfig:844:warning: override: reassigning to symbol ARCH_TEGRA_3x_SOC
	arch/arm/configs/multi_v7_defconfig:845:warning: override: reassigning to symbol ARCH_TEGRA_114_SOC
	arch/arm/configs/multi_v7_defconfig:846:warning: override: reassigning to symbol ARCH_TEGRA_124_SOC
	arch/arm/configs/multi_v7_defconfig:932:warning: override: reassigning to symbol KEYSTONE_IRQ
	arch/arm/configs/multi_v7_defconfig:933:warning: override: reassigning to symbol HW_RANDOM
	arch/arm/configs/multi_v7_defconfig:934:warning: override: reassigning to symbol HW_RANDOM_ST
	arch/arm/configs/multi_v7_defconfig:962:warning: override: reassigning to symbol VIDEO_VIVID
	arch/arm/configs/multi_v7_defconfig:964:warning: override: reassigning to symbol VIRTIO_PCI
	arch/arm/configs/multi_v7_defconfig:966:warning: override: reassigning to symbol VIRTIO_MMIO
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 14 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm-bufio.c:1752:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/scsi/bfa/bfad_bsg.c:3137:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/scsi/bfa/bfad_bsg.c:3353:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
