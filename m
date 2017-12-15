From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171215 build: 0 failures 13 warnings (next-20171215)
Date: Fri, 15 Dec 2017 18:30:13 +0000
Message-ID: <E1ePukP-0001RG-4k@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44598 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755419AbdLOSaP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Dec 2017 13:30:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171215
Git describe: next-20171215
Commit: 0c1f9d81ac Add linux-next specific files for 20171215

Build Time: 123 min 43 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 13
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     12 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v5_defconfig
      6 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : x86_64-defconfig
     11 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      7 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 13
	  7 ../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  6 ../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	  6 ../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	  6 ../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/md/dm-bufio.c:1756:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  1 ../mm/khugepaged.c:1757:31: warning: 'vma' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../mm/khugepaged.c:1659:25: warning: 'vma' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 12 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../mm/khugepaged.c:1757:31: warning: 'vma' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm-bufio.c:1756:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

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
arm-allmodconfig : PASS, 0 errors, 11 warnings, 0 section mismatches

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

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1877:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../kernel/cgroup/cgroup.c:1879:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
	../mm/khugepaged.c:1659:25: warning: 'vma' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
