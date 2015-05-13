From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150513 build: 2 failures 47 warnings (next-20150513)
Date: Wed, 13 May 2015 12:34:48 +0100
Message-ID: <E1YsUw4-0002i4-Do@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36769 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754549AbbEMLez (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2015 07:34:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150513
Git describe: next-20150513
Commit: b8c256259d Add linux-next specific files for 20150513

Build Time: 64 min 33 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 1
Warnings: 47
Section Mismatches: 1

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/bus/arm-ccn.c:924:3: error: implicit declaration of function '__hrtimer_start_range_ns' [-Werror=implicit-function-declaration]

	arm-allmodconfig
../drivers/bus/arm-ccn.c:924:3: error: implicit declaration of function '__hrtimer_start_range_ns' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     32 warnings    1 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v7_defconfig
     20 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : x86_64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ../drivers/bus/arm-ccn.c:924:3: error: implicit declaration of function '__hrtimer_start_range_ns' [-Werror=implicit-function-declaration]

Warnings Summary: 47
	  4 ../drivers/gpu/drm/drm_crtc.c:4324:13: warning: 'drm_property_unreference_blob_locked' defined but not used [-Wunused-function]
	  2 ../drivers/staging/lustre/lustre/obdclass/cl_page.c:251:6: warning: unused variable 'pagesize' [-Wunused-variable]
	  2 ../drivers/staging/lustre/lustre/obdclass/acl.c:123:6: warning: unused variable 'old_size' [-Wunused-variable]
	  2 ../drivers/staging/lustre/lustre/llite/llite_lib.c:908:12: warning: unused variable 'instlen' [-Wunused-variable]
	  2 ../drivers/staging/lustre/lustre/llite/file.c:3242:17: warning: unused variable 'size' [-Wunused-variable]
	  2 ../drivers/staging/comedi/drivers/ni_mio_common.c:2271:34: warning: right-hand operand of comma expression has no effect [-Wunused-value]
	  2 ../drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/atmel/ac97c.c:919:29: warning: unused variable 'match' [-Wunused-variable]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/acct.c:174:2: warning: value computed is not used [-Wunused-value]
	  1 ../include/trace/ftrace.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	  1 ../drivers/usb/renesas_usbhs/common.c:492:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/scsi/scsi_debug.c:2376:8: warning: assignment from incompatible pointer type [enabled by default]
	  1 ../drivers/scsi/scsi_debug.c:2376:8: warning: assignment from incompatible pointer type
	  1 ../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'flags' [-Wunused-variable]
	  1 ../drivers/rtc/rtc-armada38x.c:67:34: warning: unused variable 'flags' [-Wunused-variable]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/mmc/host/sh_mmcif.c:407:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:406:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/media/platform/coda/./trace.h:12:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/msm/msm_iommu.c:63:3: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/msm/msm_iommu.c:102:3: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/msm/msm_gem.c:490:4: warning: format '%d' expects argument of type 'int', but argument 11 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/msm/msm_drv.c:97:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/msm/msm_drv.c:219:3: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/msm/msm_drv.c:180:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/msm/msm_drv.c:113:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/msm/msm_drv.c:105:41: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/msm/edp/edp_aux.c:158:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'ssize_t' [-Wformat=]
	  1 ../drivers/gpu/drm/msm/edp/edp_aux.c:135:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/msm/dsi/dsi_host.c:1043:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/msm/dsi/dsi_host.c:1026:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/block/nvme-core.c:1822:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1794:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 1
	  1 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 32 warnings, 1 section mismatches

Errors:
	../drivers/bus/arm-ccn.c:924:3: error: implicit declaration of function '__hrtimer_start_range_ns' [-Werror=implicit-function-declaration]

Warnings:
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/msm/edp/edp_aux.c:135:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat=]
	../drivers/gpu/drm/msm/edp/edp_aux.c:158:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'ssize_t' [-Wformat=]
	../drivers/gpu/drm/msm/msm_drv.c:97:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/msm/msm_drv.c:105:41: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/msm/msm_drv.c:113:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/msm/msm_drv.c:180:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/msm/msm_drv.c:219:3: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat=]
	../drivers/gpu/drm/msm/msm_gem.c:490:4: warning: format '%d' expects argument of type 'int', but argument 11 has type 'size_t' [-Wformat=]
	../drivers/gpu/drm/msm/msm_iommu.c:63:3: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'size_t' [-Wformat=]
	../drivers/gpu/drm/msm/msm_iommu.c:102:3: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'size_t' [-Wformat=]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:1026:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat=]
	../drivers/gpu/drm/msm/dsi/dsi_host.c:1043:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat=]
	../drivers/gpu/drm/drm_crtc.c:4324:13: warning: 'drm_property_unreference_blob_locked' defined but not used [-Wunused-function]
	../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	../drivers/mmc/host/sh_mmcif.c:406:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/mmc/host/sh_mmcif.c:407:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/comedi/drivers/ni_mio_common.c:2271:34: warning: right-hand operand of comma expression has no effect [-Wunused-value]
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	../drivers/staging/comedi/drivers/ni_mio_common.c:2271:34: warning: right-hand operand of comma expression has no effect [-Wunused-value]
	../drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]
	../drivers/scsi/scsi_debug.c:2376:8: warning: assignment from incompatible pointer type
	../drivers/staging/lustre/lustre/llite/file.c:3242:17: warning: unused variable 'size' [-Wunused-variable]
	../drivers/staging/lustre/lustre/llite/llite_lib.c:908:12: warning: unused variable 'instlen' [-Wunused-variable]
	../drivers/staging/lustre/lustre/obdclass/cl_page.c:251:6: warning: unused variable 'pagesize' [-Wunused-variable]
	../drivers/staging/lustre/lustre/obdclass/acl.c:123:6: warning: unused variable 'old_size' [-Wunused-variable]
	../drivers/usb/renesas_usbhs/common.c:492:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/drm_crtc.c:4324:13: warning: 'drm_property_unreference_blob_locked' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 20 warnings, 0 section mismatches

Errors:
	../drivers/bus/arm-ccn.c:924:3: error: implicit declaration of function '__hrtimer_start_range_ns' [-Werror=implicit-function-declaration]

Warnings:
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../sound/atmel/ac97c.c:919:29: warning: unused variable 'match' [-Wunused-variable]
	../kernel/acct.c:174:2: warning: value computed is not used [-Wunused-value]
	../drivers/block/nvme-core.c:1794:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1822:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/drm_crtc.c:4324:13: warning: 'drm_property_unreference_blob_locked' defined but not used [-Wunused-function]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/trace/ftrace.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	../drivers/media/platform/coda/./trace.h:12:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	../drivers/rtc/rtc-armada38x.c:67:34: warning: unused variable 'flags' [-Wunused-variable]
	../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'flags' [-Wunused-variable]
	../drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]
	../drivers/scsi/scsi_debug.c:2376:8: warning: assignment from incompatible pointer type [enabled by default]
	../drivers/staging/lustre/lustre/llite/file.c:3242:17: warning: unused variable 'size' [-Wunused-variable]
	../drivers/staging/lustre/lustre/llite/llite_lib.c:908:12: warning: unused variable 'instlen' [-Wunused-variable]
	../drivers/staging/lustre/lustre/obdclass/cl_page.c:251:6: warning: unused variable 'pagesize' [-Wunused-variable]
	../drivers/staging/lustre/lustre/obdclass/acl.c:123:6: warning: unused variable 'old_size' [-Wunused-variable]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/drm_crtc.c:4324:13: warning: 'drm_property_unreference_blob_locked' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
arm64-defconfig
