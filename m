From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151115 build: 0 failures 33 warnings (next-20151115)
Date: Sun, 15 Nov 2015 06:11:06 +0000
Message-ID: <E1ZxqWo-0004lV-HQ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60677 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751110AbbKOGLQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 15 Nov 2015 01:11:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151115
Git describe: next-20151115
Commit: f6cbb190f8 Add linux-next specific files for 20151115

Build Time: 74 min 24 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 33
Section Mismatches: 4

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
     71 warnings    4 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
      9 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 33
	 17 ../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	 17 ../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	  7 <stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	  3 ../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/rockchip/rockchip_spdif.c:283:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/bluetooth/mgmt.c:6319:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6319:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../fs/orangefs/pvfs2-bufmap.c:552:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	  1 ../fs/orangefs/pvfs2-bufmap.c:520:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	  1 ../drivers/spi/spi-bcm63xx.c:565:2: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat=]
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/qlogic/qed/qed_dev.c:1676:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	  1 ../drivers/clocksource/fsl_ftm_timer.c:233:13: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/clocksource/fsl_ftm_timer.c:206:13: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.data+0x1abb70): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	  1 WARNING: drivers/pci/host/built-in.o(.data+0x1948): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	  1 WARNING: drivers/pci/built-in.o(.data+0x12ac8): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	  1 WARNING: drivers/built-in.o(.data+0x3d470): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 71 warnings, 4 section mismatches

Warnings:
	../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../drivers/clocksource/fsl_ftm_timer.c:206:13: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/clocksource/fsl_ftm_timer.c:233:13: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../sound/soc/rockchip/rockchip_spdif.c:283:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
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
	../drivers/spi/spi-bcm63xx.c:565:2: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat=]
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
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

Section Mismatches:
	WARNING: drivers/pci/host/built-in.o(.data+0x1948): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	WARNING: drivers/pci/built-in.o(.data+0x12ac8): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	WARNING: drivers/built-in.o(.data+0x3d470): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	WARNING: vmlinux.o(.data+0x1abb70): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6319:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6319:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'long long int' [-Wformat]
	../fs/orangefs/pvfs2-bufmap.c:520:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	../fs/orangefs/pvfs2-bufmap.c:552:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	../drivers/net/ethernet/qlogic/qed/qed_dev.c:1676:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
