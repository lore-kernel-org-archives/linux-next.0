From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171211 build: 1 failures 16 warnings (next-20171211)
Date: Mon, 11 Dec 2017 10:43:24 +0000
Message-ID: <E1eOLYS-0007oI-B2@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42776 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751347AbdLKKn0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Dec 2017 05:43:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171211
Git describe: next-20171211
Commit: 153e8244eb Add linux-next specific files for 20171211

Build Time: 123 min 56 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 16
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../include/linux/hugetlb.h:262:32: error: dereferencing pointer to incomplete type 'const struct vm_operations_struct'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
     17 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : x86_64-defconfig
     17 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : x86_64-allnoconfig
      3 warnings    0 mismatches  : arm-multi_v4t_defconfig
      5 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../include/linux/hugetlb.h:262:32: error: dereferencing pointer to incomplete type 'const struct vm_operations_struct'

Warnings Summary: 16
	 20 drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	  7 ../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  4 ../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  3 ../drivers/md/dm.c:1365:45: warning: 'ti' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/scsi/bfa/bfad_bsg.c:3353:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	  2 ../drivers/scsi/bfa/bfad_bsg.c:3137:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	  2 ../drivers/md/dm-bufio.c:1756:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	  2 ../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 17 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm.c:1365:45: warning: 'ti' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/md/dm-bufio.c:1756:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/scsi/bfa/bfad_bsg.c:3137:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/scsi/bfa/bfad_bsg.c:3353:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm.c:1365:45: warning: 'ti' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 17 warnings, 0 section mismatches

Errors:
	../include/linux/hugetlb.h:262:32: error: dereferencing pointer to incomplete type 'const struct vm_operations_struct'

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm.c:1365:45: warning: 'ti' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/md/dm-bufio.c:1756:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/scsi/bfa/bfad_bsg.c:3137:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/scsi/bfa/bfad_bsg.c:3353:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1090:3: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:435:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:
