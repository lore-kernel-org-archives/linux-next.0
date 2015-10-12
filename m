From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151012 build: 2 failures 67 warnings (next-20151012)
Date: Mon, 12 Oct 2015 13:00:05 +0100
Message-ID: <E1Zlblt-0006Ua-RC@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54851 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751725AbbJLMAQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2015 08:00:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151012
Git describe: next-20151012
Commit: daae820916 Add linux-next specific files for 20151012

Build Time: 73 min 28 sec

Passed:    6 / 8   ( 75.00 %)
Failed:    2 / 8   ( 25.00 %)

Errors: 24
Warnings: 67
Section Mismatches: 1

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/pci/host/pcie-designware.c:78:13: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:80:12: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:582:2: error: invalid use of undefined type 'struct hw_pci'
../drivers/pci/host/pcie-designware.c:583:2: error: invalid use of undefined type 'struct hw_pci'
../drivers/pci/host/pcie-designware.c:585:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
../drivers/pci/host/pcie-designware.c:739:6: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:740:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
../drivers/pci/host/pcie-designware.c:742:31: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:743:9: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:746:5: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:747:30: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:747:56: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:748:23: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:758:23: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:761:43: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:762:19: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:765:39: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:766:15: error: dereferencing pointer to incomplete type
../drivers/pci/host/pcie-designware.c:789:15: error: variable 'dw_pci' has initializer but incomplete type
../drivers/pci/host/pcie-designware.c:790:2: error: unknown field 'setup' specified in initializer
../drivers/pci/host/pcie-designware.c:791:2: error: unknown field 'scan' specified in initializer
../drivers/pci/host/pcie-designware.c:792:2: error: unknown field 'map_irq' specified in initializer

	arm-allmodconfig
../drivers/firmware/broadcom/bcm47xx_nvram.c:110:30: error: macro "DIV_ROUND_UP" requires 2 arguments, but only 1 given
../drivers/firmware/broadcom/bcm47xx_nvram.c:110:4: error: 'DIV_ROUND_UP' undeclared (first use in this function)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
     94 warnings    1 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v5_defconfig
      8 warnings    0 mismatches  : arm-multi_v7_defconfig
     48 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 24
	  1 ../drivers/pci/host/pcie-designware.c:80:12: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:792:2: error: unknown field 'map_irq' specified in initializer
	  1 ../drivers/pci/host/pcie-designware.c:791:2: error: unknown field 'scan' specified in initializer
	  1 ../drivers/pci/host/pcie-designware.c:790:2: error: unknown field 'setup' specified in initializer
	  1 ../drivers/pci/host/pcie-designware.c:78:13: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:789:15: error: variable 'dw_pci' has initializer but incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:766:15: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:765:39: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:762:19: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:761:43: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:758:23: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:748:23: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:747:56: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:747:30: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:746:5: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:743:9: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:742:31: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:740:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
	  1 ../drivers/pci/host/pcie-designware.c:739:6: error: dereferencing pointer to incomplete type
	  1 ../drivers/pci/host/pcie-designware.c:585:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
	  1 ../drivers/pci/host/pcie-designware.c:583:2: error: invalid use of undefined type 'struct hw_pci'
	  1 ../drivers/pci/host/pcie-designware.c:582:2: error: invalid use of undefined type 'struct hw_pci'
	  1 ../drivers/firmware/broadcom/bcm47xx_nvram.c:110:4: error: 'DIV_ROUND_UP' undeclared (first use in this function)
	  1 ../drivers/firmware/broadcom/bcm47xx_nvram.c:110:30: error: macro "DIV_ROUND_UP" requires 2 arguments, but only 1 given

Warnings Summary: 67
	 17 ../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	 17 ../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	  6 <stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  6 ../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	  4 ../drivers/regulator/core.c:159:13: warning: 'regulator_unlock_supply' defined but not used [-Wunused-function]
	  4 ../drivers/regulator/core.c:139:13: warning: 'regulator_lock_supply' defined but not used [-Wunused-function]
	  2 ../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../drivers/mfd/rtsx_pcr.c:564:6: warning: unused variable 'err' [-Wunused-variable]
	  2 ../drivers/mfd/lm3533-core.c:595:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/rockchip/rockchip_spdif.c:283:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/ipv6/ip6_output.c:135:21: warning: unused variable 'dev' [-Wunused-variable]
	  1 ../net/bluetooth/mgmt.c:6643:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6643:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../fs/orangefs/pvfs2-bufmap.c:552:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	  1 ../fs/orangefs/pvfs2-bufmap.c:520:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	  1 ../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2134:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pci/host/pcie-designware.c:81:1: warning: control reaches end of non-void function [-Wreturn-type]
	  1 ../drivers/pci/host/pcie-designware.c:792:2: warning: excess elements in struct initializer
	  1 ../drivers/pci/host/pcie-designware.c:792:2: warning: (near initialization for 'dw_pci')
	  1 ../drivers/pci/host/pcie-designware.c:791:2: warning: excess elements in struct initializer
	  1 ../drivers/pci/host/pcie-designware.c:791:2: warning: (near initialization for 'dw_pci')
	  1 ../drivers/pci/host/pcie-designware.c:790:2: warning: excess elements in struct initializer
	  1 ../drivers/pci/host/pcie-designware.c:790:2: warning: (near initialization for 'dw_pci')
	  1 ../drivers/pci/host/pcie-designware.c:76:52: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../drivers/pci/host/pcie-designware.c:76:52: warning: 'struct pci_sys_data' declared inside parameter list
	  1 ../drivers/pci/host/pcie-designware.c:756:37: warning: passing argument 1 of 'sys_to_pcie' from incompatible pointer type
	  1 ../drivers/pci/host/pcie-designware.c:753:56: warning: 'struct pci_sys_data' declared inside parameter list
	  1 ../drivers/pci/host/pcie-designware.c:736:19: warning: passing argument 1 of 'sys_to_pcie' from incompatible pointer type
	  1 ../drivers/pci/host/pcie-designware.c:732:41: warning: 'struct pci_sys_data' declared inside parameter list
	  1 ../drivers/nvme/host/pci.c:1887:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/nvme/host/pci.c:1845:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/ntb/ntb_transport.c:828:3: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:1109:32: warning: 'err' may be used uninitialized in this function [-Wuninitialized]
	  1 ../drivers/md/md.c:8990:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'sector_t' [-Wformat]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/infiniband/core/uverbs_cmd.c:1481:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/hwtracing/intel_th/msu.c:1076:13: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	  1 ../drivers/hwtracing/intel_th/msu.c:1065:13: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	  1 ../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:211:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:200:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:180:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 1
	  1 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 22 errors, 94 warnings, 1 section mismatches

Errors:
	../drivers/pci/host/pcie-designware.c:78:13: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:80:12: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:582:2: error: invalid use of undefined type 'struct hw_pci'
	../drivers/pci/host/pcie-designware.c:583:2: error: invalid use of undefined type 'struct hw_pci'
	../drivers/pci/host/pcie-designware.c:585:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
	../drivers/pci/host/pcie-designware.c:739:6: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:740:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
	../drivers/pci/host/pcie-designware.c:742:31: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:743:9: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:746:5: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:747:30: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:747:56: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:748:23: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:758:23: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:761:43: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:762:19: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:765:39: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:766:15: error: dereferencing pointer to incomplete type
	../drivers/pci/host/pcie-designware.c:789:15: error: variable 'dw_pci' has initializer but incomplete type
	../drivers/pci/host/pcie-designware.c:790:2: error: unknown field 'setup' specified in initializer
	../drivers/pci/host/pcie-designware.c:791:2: error: unknown field 'scan' specified in initializer
	../drivers/pci/host/pcie-designware.c:792:2: error: unknown field 'map_irq' specified in initializer

Warnings:
	../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../sound/soc/rockchip/rockchip_spdif.c:283:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	../drivers/mfd/rtsx_pcr.c:564:6: warning: unused variable 'err' [-Wunused-variable]
	../drivers/mfd/lm3533-core.c:595:6: warning: unused variable 'ret' [-Wunused-variable]
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
	../drivers/pci/host/pcie-designware.c:76:52: warning: 'struct pci_sys_data' declared inside parameter list
	../drivers/pci/host/pcie-designware.c:76:52: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/pci/host/pcie-designware.c:732:41: warning: 'struct pci_sys_data' declared inside parameter list
	../drivers/pci/host/pcie-designware.c:736:19: warning: passing argument 1 of 'sys_to_pcie' from incompatible pointer type
	../drivers/pci/host/pcie-designware.c:753:56: warning: 'struct pci_sys_data' declared inside parameter list
	../drivers/pci/host/pcie-designware.c:756:37: warning: passing argument 1 of 'sys_to_pcie' from incompatible pointer type
	../drivers/pci/host/pcie-designware.c:790:2: warning: excess elements in struct initializer
	../drivers/pci/host/pcie-designware.c:790:2: warning: (near initialization for 'dw_pci')
	../drivers/pci/host/pcie-designware.c:791:2: warning: excess elements in struct initializer
	../drivers/pci/host/pcie-designware.c:791:2: warning: (near initialization for 'dw_pci')
	../drivers/pci/host/pcie-designware.c:792:2: warning: excess elements in struct initializer
	../drivers/pci/host/pcie-designware.c:792:2: warning: (near initialization for 'dw_pci')
	../drivers/pci/host/pcie-designware.c:81:1: warning: control reaches end of non-void function [-Wreturn-type]
	../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/regulator/core.c:139:13: warning: 'regulator_lock_supply' defined but not used [-Wunused-function]
	../drivers/regulator/core.c:159:13: warning: 'regulator_unlock_supply' defined but not used [-Wunused-function]
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
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x16c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/regulator/core.c:139:13: warning: 'regulator_lock_supply' defined but not used [-Wunused-function]
	../drivers/regulator/core.c:159:13: warning: 'regulator_unlock_supply' defined but not used [-Wunused-function]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6643:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6643:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/ipv6/ip6_output.c:135:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/regulator/core.c:139:13: warning: 'regulator_lock_supply' defined but not used [-Wunused-function]
	../drivers/regulator/core.c:159:13: warning: 'regulator_unlock_supply' defined but not used [-Wunused-function]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 48 warnings, 0 section mismatches

Errors:
	../drivers/firmware/broadcom/bcm47xx_nvram.c:110:30: error: macro "DIV_ROUND_UP" requires 2 arguments, but only 1 given
	../drivers/firmware/broadcom/bcm47xx_nvram.c:110:4: error: 'DIV_ROUND_UP' undeclared (first use in this function)

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:180:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:200:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:211:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/hwtracing/intel_th/msu.c:1065:13: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	../drivers/hwtracing/intel_th/msu.c:1076:13: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	../fs/orangefs/pvfs2-bufmap.c:520:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	../fs/orangefs/pvfs2-bufmap.c:552:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	../drivers/infiniband/core/uverbs_cmd.c:1481:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/md/md.c:8990:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'sector_t' [-Wformat]
	../drivers/mfd/rtsx_pcr.c:564:6: warning: unused variable 'err' [-Wunused-variable]
	../drivers/mfd/lm3533-core.c:595:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/ntb/ntb_transport.c:828:3: warning: right shift count >= width of type [enabled by default]
	../drivers/nvme/host/pci.c:1845:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/nvme/host/pci.c:1887:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/regulator/core.c:139:13: warning: 'regulator_lock_supply' defined but not used [-Wunused-function]
	../drivers/regulator/core.c:159:13: warning: 'regulator_unlock_supply' defined but not used [-Wunused-function]
	../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2134:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:1109:32: warning: 'err' may be used uninitialized in this function [-Wuninitialized]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:446:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:447:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:523:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/intel/i40evf/i40e_common.c:524:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
