From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150930 build: 1 failures 59 warnings (next-20150930)
Date: Wed, 30 Sep 2015 10:45:22 +0100
Message-ID: <E1ZhDww-0002Iu-Rj@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57536 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932164AbbI3Jpa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2015 05:45:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150930
Git describe: next-20150930
Commit: f0378dad70 Add linux-next specific files for 20150930

Build Time: 73 min 43 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 2
Warnings: 59
Section Mismatches: 1

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
ERROR: "__aeabi_ldivmod" [drivers/mtd/devices/mtdram.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
     79 warnings    3 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
     76 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  1 ERROR: "__aeabi_uldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
	  1 ERROR: "__aeabi_ldivmod" [drivers/mtd/devices/mtdram.ko] undefined!

Warnings Summary: 59
	 17 ../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	 17 ../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	  6 <stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
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
	  4 ../drivers/net/ethernet/intel/i40e/i40e_main.c:7710:2: warning: left shift count >= width of type [enabled by default]
	  2 ../include/linux/kernel.h:724:17: warning: comparison of distinct pointer types lacks a cast
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../net/bluetooth/mgmt.c:6643:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6643:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/net/ip_vs.h:1081:2: warning: 'ipvs' may be used uninitialized in this function [-Wuninitialized]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../fs/logfs/dev_bdev.c:84:14: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	  1 ../fs/logfs/dev_bdev.c:174:14: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	  1 ../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2134:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/ntb_transport.c:828:3: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/mellanox/mlxsw/pci.c:1588:2: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/mellanox/mlxsw/pci.c:1585:2: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/hisilicon/hns/hnae.c:466:5: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/hisilicon/hns/hnae.c:456:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/hisilicon/hns/hnae.c:452:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:1109:32: warning: 'err' may be used uninitialized in this function [-Wuninitialized]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/core/uverbs_cmd.c:1481:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/i915/intel_audio.c:332:39: warning: passing argument 2 of 'audio_rate_need_prog' discards 'const' qualifier from pointer target type
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:210:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:199:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:179:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1891:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1849:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 1
	  3 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 79 warnings, 3 section mismatches

Warnings:
	../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/linux/kernel.h:724:17: warning: comparison of distinct pointer types lacks a cast
	../include/linux/kernel.h:724:17: warning: comparison of distinct pointer types lacks a cast
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
	../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6643:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6643:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/i915/intel_audio.c:332:39: warning: passing argument 2 of 'audio_rate_need_prog' discards 'const' qualifier from pointer target type

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 76 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
	ERROR: "__aeabi_ldivmod" [drivers/mtd/devices/mtdram.ko] undefined!

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../fs/logfs/dev_bdev.c:84:14: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	../fs/logfs/dev_bdev.c:174:14: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	../drivers/block/nvme-core.c:1849:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1891:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:179:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:199:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:210:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/net/ip_vs.h:1081:2: warning: 'ipvs' may be used uninitialized in this function [-Wuninitialized]
	../drivers/infiniband/core/uverbs_cmd.c:1481:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	../drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:1109:32: warning: 'err' may be used uninitialized in this function [-Wuninitialized]
	../drivers/ntb/ntb_transport.c:828:3: warning: right shift count >= width of type [enabled by default]
	../drivers/net/ethernet/hisilicon/hns/hnae.c:452:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/hisilicon/hns/hnae.c:456:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/hisilicon/hns/hnae.c:466:5: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40e/i40e_main.c:7710:2: warning: left shift count >= width of type [enabled by default]
	../drivers/net/ethernet/intel/i40e/i40e_main.c:7710:2: warning: left shift count >= width of type [enabled by default]
	../drivers/net/ethernet/intel/i40e/i40e_main.c:7710:2: warning: left shift count >= width of type [enabled by default]
	../drivers/net/ethernet/intel/i40e/i40e_main.c:7710:2: warning: left shift count >= width of type [enabled by default]
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
	../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2134:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
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
	../drivers/net/ethernet/mellanox/mlxsw/pci.c:1585:2: warning: right shift count >= width of type [enabled by default]
	../drivers/net/ethernet/mellanox/mlxsw/pci.c:1588:2: warning: right shift count >= width of type [enabled by default]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-defconfig
