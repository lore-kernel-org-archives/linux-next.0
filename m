From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150813 build: 1 failures 61 warnings (next-20150813)
Date: Thu, 13 Aug 2015 11:56:38 +0100
Message-ID: <E1ZPqBa-0004dx-L9@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41736 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbbHMK4p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2015 06:56:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150813
Git describe: next-20150813
Commit: 30b42f4b8d Add linux-next specific files for 20150813

Build Time: 80 min 48 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 1
Warnings: 61
Section Mismatches: 1

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/pci/host/pcie-xilinx.c:235:3: error: implicit declaration of function 'msi_desc_to_pci_sys_data' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allnoconfig
     83 warnings    3 mismatches  : arm64-allmodconfig
      6 warnings    0 mismatches  : arm-multi_v5_defconfig
     10 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
     85 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : x86_64-allnoconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../drivers/pci/host/pcie-xilinx.c:235:3: error: implicit declaration of function 'msi_desc_to_pci_sys_data' [-Werror=implicit-function-declaration]

Warnings Summary: 61
	 17 ../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	 17 ../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	 11 <stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	 11 ../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	  9 ../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	  6 <stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40e/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40e/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40e/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40e/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	  4 ../drivers/net/ethernet/intel/i40e/i40e_main.c:7601:2: warning: left shift count >= width of type [enabled by default]
	  2 ../drivers/rtc/rtc-ds1374.c:667:6: warning: unused variable 'res' [-Wunused-variable]
	  2 ../drivers/gpio/gpio-omap.c:504:3: warning: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [enabled by default]
	  2 ../drivers/dma/ipu/ipu_irq.c:305:22: warning: 'irq' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../arch/x86/kernel/irq.c:236:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	  1 arch/arm/configs/multi_v7_defconfig:413:warning: override: reassigning to symbol REGULATOR_MAX77802
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../net/bluetooth/mgmt.c:6643:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6643:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/tty/serial/amba-pl011.c:329:13: warning: 'pl011_writeb' defined but not used [-Wunused-function]
	  1 ../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2134:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pci/host/pcie-xilinx.c:235:3: warning: passing argument 1 of 'sys_to_pcie' makes pointer from integer without a cast [enabled by default]
	  1 ../drivers/ntb/ntb_transport.c:809:3: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/mellanox/mlxsw/pci.c:1561:2: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/mellanox/mlxsw/pci.c:1549:2: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:4564:8: warning: 'chip' may be used uninitialized in this function [-Wuninitialized]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/core/uverbs_cmd.c:1466:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/devfreq/event/exynos-ppmu.c:322:3: warning: left shift count >= width of type [enabled by default]
	  1 ../drivers/devfreq/event/exynos-ppmu.c:322:3: warning: left shift count >= width of type
	  1 ../drivers/block/nvme-core.c:1888:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1846:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 1
	  3 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 83 warnings, 3 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../drivers/devfreq/event/exynos-ppmu.c:322:3: warning: left shift count >= width of type
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
	../drivers/rtc/rtc-ds1374.c:667:6: warning: unused variable 'res' [-Wunused-variable]
	../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
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
	../drivers/tty/serial/amba-pl011.c:329:13: warning: 'pl011_writeb' defined but not used [-Wunused-function]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../drivers/dma/ipu/ipu_irq.c:305:22: warning: 'irq' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:413:warning: override: reassigning to symbol REGULATOR_MAX77802
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../net/bluetooth/mgmt.c:6643:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6643:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/dma/ipu/ipu_irq.c:305:22: warning: 'irq' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpio/gpio-omap.c:504:3: warning: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [enabled by default]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/irq.c:236:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 85 warnings, 0 section mismatches

Errors:
	../drivers/pci/host/pcie-xilinx.c:235:3: error: implicit declaration of function 'msi_desc_to_pci_sys_data' [-Werror=implicit-function-declaration]

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/block/nvme-core.c:1846:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1888:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/crypto/caam/desc.h:1495:0: warning: "JUMP_TYPE_MASK" redefined [enabled by default]
	../drivers/devfreq/event/exynos-ppmu.c:322:3: warning: left shift count >= width of type [enabled by default]
	../drivers/gpio/gpio-omap.c:504:3: warning: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [enabled by default]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/infiniband/core/uverbs_cmd.c:1466:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	../drivers/ntb/ntb_transport.c:809:3: warning: right shift count >= width of type [enabled by default]
	../drivers/pci/host/pcie-xilinx.c:235:3: warning: passing argument 1 of 'sys_to_pcie' makes pointer from integer without a cast [enabled by default]
	../drivers/rtc/rtc-ds1374.c:667:6: warning: unused variable 'res' [-Wunused-variable]
	../drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:4564:8: warning: 'chip' may be used uninitialized in this function [-Wuninitialized]
	../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2134:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/net/ethernet/intel/i40e/i40e_main.c:7601:2: warning: left shift count >= width of type [enabled by default]
	../drivers/net/ethernet/intel/i40e/i40e_main.c:7601:2: warning: left shift count >= width of type [enabled by default]
	../drivers/net/ethernet/intel/i40e/i40e_main.c:7601:2: warning: left shift count >= width of type [enabled by default]
	../drivers/net/ethernet/intel/i40e/i40e_main.c:7601:2: warning: left shift count >= width of type [enabled by default]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:444:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:445:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:521:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:522:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/mellanox/mlxsw/pci.c:1549:2: warning: right shift count >= width of type [enabled by default]
	../drivers/net/ethernet/mellanox/mlxsw/pci.c:1561:2: warning: right shift count >= width of type [enabled by default]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/irq.c:236:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../kernel/notifier.c:547:2: warning: 'deprecate_rcu_lockdep_assert' is deprecated (declared at ../include/linux/rcupdate.h:540) [-Wdeprecated-declarations]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:
