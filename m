From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171130 build: 0 failures 16 warnings (next-20171130)
Date: Thu, 30 Nov 2017 11:52:07 +0000
Message-ID: <E1eKNNv-0005TM-8m@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36286 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbdK3LwJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Nov 2017 06:52:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171130
Git describe: next-20171130
Commit: 11fed7829b Add linux-next specific files for 20171130

Build Time: 123 min 24 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 16
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     15 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      3 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
     15 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 16
	  7 ../fs/super.c:521:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc.c:451:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/scsi/arcmsr/arcmsr_hba.c:3641:13: warning: 'arcmsr_set_iop_datetime' defined but not used [-Wunused-function]
	  2 ../drivers/md/dm-bufio.c:1752:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/md/bcache/btree.c:810:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  1 ../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]
	  1 ../drivers/leds/leds-pm8058.c:109:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 15 warnings, 0 section mismatches

Warnings:
	../fs/super.c:521:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/leds/leds-pm8058.c:109:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/md/dm-bufio.c:1752:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/bcache/btree.c:810:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:451:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/scsi/arcmsr/arcmsr_hba.c:3641:13: warning: 'arcmsr_set_iop_datetime' defined but not used [-Wunused-function]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/super.c:521:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../fs/super.c:521:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:451:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/super.c:521:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 15 warnings, 0 section mismatches

Warnings:
	../fs/super.c:521:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm-bufio.c:1752:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/bcache/btree.c:810:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:451:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/scsi/arcmsr/arcmsr_hba.c:3641:13: warning: 'arcmsr_set_iop_datetime' defined but not used [-Wunused-function]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/super.c:521:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../fs/super.c:521:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:451:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
