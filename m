From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171213 build: 0 failures 15 warnings (next-20171213)
Date: Wed, 13 Dec 2017 10:02:42 +0000
Message-ID: <E1eP3sA-0005mK-5K@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:34114 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751853AbdLMKCo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Dec 2017 05:02:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171213
Git describe: next-20171213
Commit: 41d8c16909 Add linux-next specific files for 20171213

Build Time: 123 min 52 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 15
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     15 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v5_defconfig
      6 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : x86_64-defconfig
     15 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      6 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 15
	  7 ../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  6 ../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	  6 ../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	  6 ../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/md/dm-bufio.c:1756:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 15 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm-bufio.c:1756:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 15 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm-bufio.c:1756:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
