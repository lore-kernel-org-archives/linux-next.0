From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171212 build: 0 failures 15 warnings (next-20171212)
Date: Tue, 12 Dec 2017 10:03:02 +0000
Message-ID: <E1eOhOw-0001zl-JV@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47350 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751234AbdLLKDF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Dec 2017 05:03:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171212
Git describe: next-20171212
Commit: d20787938d Add linux-next specific files for 20171212

Build Time: 124 min 17 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 15
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
     16 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
      3 warnings    0 mismatches  : x86_64-defconfig
     16 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : x86_64-allnoconfig
      3 warnings    0 mismatches  : arm-multi_v4t_defconfig
      5 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 15
	 20 drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
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
arm64-allmodconfig : PASS, 0 errors, 16 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
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
x86_64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 16 warnings, 0 section mismatches

Warnings:
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice
	../fs/super.c:520:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/android/binder_alloc.c:1012:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../fs/xfs/xfs_qm.c:698:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/md/dm-bufio.c:1756:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc.c:484:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/scsi/bfa/bfad_bsg.c:3137:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/scsi/bfa/bfad_bsg.c:3353:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
	../drivers/staging/android/ion/ion_heap.c:306:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/android/ashmem.c:857:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/obdclass/lu_object.c:1954:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
	../drivers/staging/lustre/lustre/osc/osc_request.c:2847:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
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
