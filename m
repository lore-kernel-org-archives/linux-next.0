From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150730 build: 2 failures 52 warnings (next-20150730)
Date: Thu, 30 Jul 2015 12:59:47 +0100
Message-ID: <E1ZKmV1-0001ch-51@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46491 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbbG3L74 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2015 07:59:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150730
Git describe: next-20150730
Commit: 09d19a8106 Add linux-next specific files for 20150730

Build Time: 70 min 9 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 13
Warnings: 52
Section Mismatches: 2

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../include/linux/platform_device.h:245:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../include/linux/platform_device.h:250:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

	arm-allmodconfig
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
../drivers/gpu/drm/omapdrm/omap_crtc.c:470:2: error: initialization from incompatible pointer type [-Werror]
../drivers/gpu/drm/omapdrm/omap_crtc.c:470:2: error: (near initialization for 'omap_crtc_helper_funcs.atomic_begin') [-Werror]
../drivers/gpu/drm/omapdrm/omap_crtc.c:471:2: error: initialization from incompatible pointer type [-Werror]
../drivers/gpu/drm/omapdrm/omap_crtc.c:471:2: error: (near initialization for 'omap_crtc_helper_funcs.atomic_flush') [-Werror]
../drivers/pci/host/pcie-xilinx.c:235:3: error: implicit declaration of function 'msi_desc_to_pci_sys_data' [-Werror=implicit-function-declaration]
../drivers/soc/mediatek/mtk-scpsys.c:487:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
../drivers/soc/mediatek/mtk-scpsys.c:487:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allnoconfig
    115 warnings    1 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v5_defconfig
      8 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
     22 warnings    1 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : x86_64-allnoconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 13
	 15 ../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	 15 ../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	 15 ../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	 15 ../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	  1 ../include/linux/platform_device.h:250:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	  1 ../include/linux/platform_device.h:245:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	  1 ../drivers/soc/mediatek/mtk-scpsys.c:487:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	  1 ../drivers/soc/mediatek/mtk-scpsys.c:487:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
	  1 ../drivers/pci/host/pcie-xilinx.c:235:3: error: implicit declaration of function 'msi_desc_to_pci_sys_data' [-Werror=implicit-function-declaration]
	  1 ../drivers/gpu/drm/omapdrm/omap_crtc.c:471:2: error: initialization from incompatible pointer type [-Werror]
	  1 ../drivers/gpu/drm/omapdrm/omap_crtc.c:471:2: error: (near initialization for 'omap_crtc_helper_funcs.atomic_flush') [-Werror]
	  1 ../drivers/gpu/drm/omapdrm/omap_crtc.c:470:2: error: initialization from incompatible pointer type [-Werror]
	  1 ../drivers/gpu/drm/omapdrm/omap_crtc.c:470:2: error: (near initialization for 'omap_crtc_helper_funcs.atomic_begin') [-Werror]

Warnings Summary: 52
	 17 ../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	 17 ../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	 14 ../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	 14 ../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	 10 <stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	  9 ../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	  6 <stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	  3 warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	  2 ../include/linux/export.h:36:30: warning: parameter names (without types) in function declaration
	  2 ../drivers/soc/mediatek/mtk-scpsys.c:487:1: warning: parameter names (without types) in function declaration [enabled by default]
	  2 ../drivers/soc/mediatek/mtk-scpsys.c:487:1: warning: data definition has no type or storage class [enabled by default]
	  2 ../drivers/gpio/gpio-omap.c:504:3: warning: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [enabled by default]
	  2 ../arch/x86/kernel/irq.c:237:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../net/bluetooth/mgmt.c:6636:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6636:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]
	  1 ../ipc/kdbus/connection.c:2049:1: warning: the frame size of 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/linux/platform_device.h:250:1: warning: data definition has no type or storage class
	  1 ../include/linux/platform_device.h:245:1: warning: data definition has no type or storage class
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/soc/mediatek/mtk-scpsys.c:487:30: warning: 'scpsys_drv_init' defined but not used [-Wunused-function]
	  1 ../drivers/soc/mediatek/mtk-scpsys.c:487:1: warning: 'scpsys_drv_init' defined but not used [-Wunused-function]
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pci/host/pcie-xilinx.c:235:3: warning: passing argument 1 of 'sys_to_pcie' makes pointer from integer without a cast [enabled by default]
	  1 ../drivers/ntb/ntb_transport.c:778:3: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/core/uverbs_cmd.c:1466:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/block/nvme-core.c:1888:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1846:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 2
	  1 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	  1 WARNING: arch/arm/mach-zx/built-in.o(.data+0x2c): Section mismatch in reference from the variable zx296702_pd_driver to the (unknown reference) .init.rodata:(unknown)



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 115 warnings, 1 section mismatches

Errors:
	../include/linux/platform_device.h:245:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../include/linux/platform_device.h:250:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

Warnings:
	warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	../include/linux/platform_device.h:245:1: warning: data definition has no type or storage class
	../include/linux/export.h:36:30: warning: parameter names (without types) in function declaration
	../include/linux/platform_device.h:250:1: warning: data definition has no type or storage class
	../include/linux/export.h:36:30: warning: parameter names (without types) in function declaration
	../drivers/soc/mediatek/mtk-scpsys.c:487:30: warning: 'scpsys_drv_init' defined but not used [-Wunused-function]
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../net/bluetooth/mgmt.c:6636:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6636:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpio/gpio-omap.c:504:3: warning: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [enabled by default]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../arch/x86/kernel/irq.c:237:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 67 errors, 22 warnings, 1 section mismatches

Errors:
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:12:3: error: unknown type name 'u32'
	../arch/arm/include/asm/spinlock_types.h:15:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:16:4: error: unknown type name 'u16'
	../arch/arm/include/asm/spinlock_types.h:28:2: error: unknown type name 'u32'
	../drivers/gpu/drm/omapdrm/omap_crtc.c:470:2: error: initialization from incompatible pointer type [-Werror]
	../drivers/gpu/drm/omapdrm/omap_crtc.c:470:2: error: (near initialization for 'omap_crtc_helper_funcs.atomic_begin') [-Werror]
	../drivers/gpu/drm/omapdrm/omap_crtc.c:471:2: error: initialization from incompatible pointer type [-Werror]
	../drivers/gpu/drm/omapdrm/omap_crtc.c:471:2: error: (near initialization for 'omap_crtc_helper_funcs.atomic_flush') [-Werror]
	../drivers/pci/host/pcie-xilinx.c:235:3: error: implicit declaration of function 'msi_desc_to_pci_sys_data' [-Werror=implicit-function-declaration]
	../drivers/soc/mediatek/mtk-scpsys.c:487:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
	../drivers/soc/mediatek/mtk-scpsys.c:487:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../ipc/kdbus/connection.c:2049:1: warning: the frame size of 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/block/nvme-core.c:1846:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1888:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpio/gpio-omap.c:504:3: warning: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [enabled by default]
	../drivers/infiniband/core/uverbs_cmd.c:1466:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	../drivers/ntb/ntb_transport.c:778:3: warning: right shift count >= width of type [enabled by default]
	../drivers/pci/host/pcie-xilinx.c:235:3: warning: passing argument 1 of 'sys_to_pcie' makes pointer from integer without a cast [enabled by default]
	../drivers/soc/mediatek/mtk-scpsys.c:487:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/soc/mediatek/mtk-scpsys.c:487:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/soc/mediatek/mtk-scpsys.c:487:1: warning: data definition has no type or storage class [enabled by default]
	../drivers/soc/mediatek/mtk-scpsys.c:487:1: warning: parameter names (without types) in function declaration [enabled by default]
	../drivers/soc/mediatek/mtk-scpsys.c:487:1: warning: 'scpsys_drv_init' defined but not used [-Wunused-function]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]

Section Mismatches:
	WARNING: arch/arm/mach-zx/built-in.o(.data+0x2c): Section mismatch in reference from the variable zx296702_pd_driver to the (unknown reference) .init.rodata:(unknown)

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/irq.c:237:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:
