From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150610 build: 2 failures 40 warnings (next-20150610)
Date: Wed, 10 Jun 2015 16:25:06 +0100
Message-ID: <E1Z2hsI-0006G7-PC@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52268 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964815AbbFJPZP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2015 11:25:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150610
Git describe: next-20150610
Commit: 54896f27dd Add linux-next specific files for 20150610

Build Time: 66 min 34 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 3
Warnings: 40
Section Mismatches: 2

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "acpi_gpiochip_request_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!
ERROR: "acpi_gpiochip_free_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/media/pci/cobalt/cobalt.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
     17 warnings    3 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v5_defconfig
      8 warnings    0 mismatches  : arm-multi_v7_defconfig
      3 warnings    0 mismatches  : x86_64-defconfig
     16 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      5 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 3
	  1 ERROR: "acpi_gpiochip_request_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	  1 ERROR: "acpi_gpiochip_free_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	  1 ERROR: "__aeabi_uldivmod" [drivers/media/pci/cobalt/cobalt.ko] undefined!

Warnings Summary: 40
	 10 <stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	  5 ../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not supported for this machine [-Wpragmas]
	  4 ../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but not used [-Wunused-function]
	  2 ../crypto/jitterentropy.c:336:9: warning: #pragma GCC target is not supported for this machine [-Wpragmas]
	  1 arch/arm/configs/multi_v7_defconfig:605:warning: override: reassigning to symbol COMMON_CLK_QCOM
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../net/ipv4/inet_hashtables.c:631:13: warning: division by zero [-Wdiv-by-zero]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/cgroup.c:2714:6: warning: 'ssid' may be used uninitialized in this function [-Wuninitialized]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/trace/trace_events.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	  1 ../include/linux/dynamic_debug.h:64:16: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t' [-Wformat=]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/scsi/advansys.c:7805:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'flags' [-Wunused-variable]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/media/platform/coda/./trace.h:12:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/i915/intel_display.c:11877:6: warning: 'crtc' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/i915/intel_display.c:11853:14: warning: 'crtc_state' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/exynos/exynos_drm_vidi.c:183:6: warning: unused variable 'i' [-Wunused-variable]
	  1 ../drivers/gpu/drm/exynos/exynos_drm_vidi.c:182:27: warning: unused variable 'plane' [-Wunused-variable]
	  1 ../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/block/nvme-core.c:1834:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1792:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm64/kernel/psci.c:61:13: warning: 'psci_tos_resident_on' defined but not used [-Wunused-function]
	  1 ../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 2
	  2 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	  1 WARNING: drivers/i2c/busses/i2c-xgene-slimpro.o(.data+0x28): Section mismatch in reference from the variable xgene_slimpro_i2c_driver to the variable .init.text:$x



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../arch/arm64/kernel/psci.c:61:13: warning: 'psci_tos_resident_on' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 17 warnings, 3 section mismatches

Errors:
	ERROR: "acpi_gpiochip_request_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!
	ERROR: "acpi_gpiochip_free_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not supported for this machine [-Wpragmas]
	../crypto/jitterentropy.c:336:9: warning: #pragma GCC target is not supported for this machine [-Wpragmas]
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../include/linux/dynamic_debug.h:64:16: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t' [-Wformat=]
	../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	WARNING: drivers/i2c/busses/i2c-xgene-slimpro.o(.data+0x28): Section mismatch in reference from the variable xgene_slimpro_i2c_driver to the variable .init.text:$x
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not supported for this machine [-Wpragmas]
	../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but not used [-Wunused-function]
	../net/ipv4/inet_hashtables.c:631:13: warning: division by zero [-Wdiv-by-zero]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:605:warning: override: reassigning to symbol COMMON_CLK_QCOM
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../kernel/cgroup.c:2714:6: warning: 'ssid' may be used uninitialized in this function [-Wuninitialized]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not supported for this machine [-Wpragmas]
	../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but not used [-Wunused-function]
	../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but not used [-Wunused-function]
	../drivers/gpu/drm/i915/intel_display.c:11853:14: warning: 'crtc_state' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/i915/intel_display.c:11877:6: warning: 'crtc' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 16 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/media/pci/cobalt/cobalt.ko] undefined!

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not supported for this machine [-Wpragmas]
	../drivers/block/nvme-core.c:1792:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1834:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/exynos/exynos_drm_vidi.c:183:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/gpu/drm/exynos/exynos_drm_vidi.c:182:27: warning: unused variable 'plane' [-Wunused-variable]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'flags' [-Wunused-variable]
	../include/trace/trace_events.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	../drivers/media/platform/coda/./trace.h:12:0: warning: "TRACE_SYSTEM_STRING" redefined [enabled by default]
	../drivers/scsi/advansys.c:7805:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not supported for this machine [-Wpragmas]
	../crypto/jitterentropy.c:336:9: warning: #pragma GCC target is not supported for this machine [-Wpragmas]
	../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but not used [-Wunused-function]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
