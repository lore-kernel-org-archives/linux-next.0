From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151102 build: 0 failures 50 warnings (next-20151102)
Date: Mon, 02 Nov 2015 08:28:23 +0000
Message-ID: <E1ZtATX-00014h-Nb@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44174 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751024AbbKBI2d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2015 03:28:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151102
Git describe: next-20151102
Commit: 10822ed97d Add linux-next specific files for 20151102

Build Time: 75 min 46 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 50
Section Mismatches: 4

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
     78 warnings    4 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      6 warnings    0 mismatches  : arm-multi_v7_defconfig
      5 warnings    0 mismatches  : x86_64-defconfig
     19 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 50
	 17 ../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	 17 ../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	  7 <stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	  3 ../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	  3 ../drivers/gpu/drm/drm_gem_cma_helper.c:484:21: warning: unused variable 'dev' [-Wunused-variable]
	  2 ../kernel/trace/trace_events.c:580:32: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type
	  2 ../kernel/trace/trace_events.c:579:32: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type
	  2 ../kernel/trace/trace_events.c:1725:36: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type
	  2 ../kernel/trace/trace_events.c:1723:36: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type
	  2 ../drivers/mfd/rtsx_pcr.c:565:6: warning: unused variable 'err' [-Wunused-variable]
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/rockchip/rockchip_spdif.c:283:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/netfilter/nfnetlink_log.c:320:14: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6635:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6635:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/trace/trace_events.c:580:2: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type [enabled by default]
	  1 ../kernel/trace/trace_events.c:579:2: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type [enabled by default]
	  1 ../kernel/trace/trace_events.c:1726:8: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type [enabled by default]
	  1 ../kernel/trace/trace_events.c:1724:8: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type [enabled by default]
	  1 ../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../fs/orangefs/pvfs2-bufmap.c:552:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	  1 ../fs/orangefs/pvfs2-bufmap.c:520:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	  1 ../drivers/spi/spi-bcm63xx.c:565:2: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat=]
	  1 ../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2133:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/ntb_transport.c:828:3: warning: right shift count >= width of type [enabled by default]
	  1 ../drivers/net/ethernet/qlogic/qed/qed_dev.c:1670:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/hid/hid-gfrm.c:151:2: warning: initialization from incompatible pointer type [enabled by default]
	  1 ../drivers/hid/hid-gfrm.c:151:2: warning: (near initialization for 'gfrm_driver.input_configured') [enabled by default]
	  1 ../drivers/hid/hid-gfrm.c:151:22: warning: initialization from incompatible pointer type
	  1 ../drivers/hid/hid-gfrm.c:151:22: warning: (near initialization for 'gfrm_driver.input_configured')
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm64/kernel/cpufeature.c:698:13: warning: 'cpus_have_hwcap' defined but not used [-Wunused-function]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.data+0x1ab0c8): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	  1 WARNING: drivers/pci/host/built-in.o(.data+0x14d0): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	  1 WARNING: drivers/pci/built-in.o(.data+0x12620): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	  1 WARNING: drivers/built-in.o(.data+0x3cfc8): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../arch/arm64/kernel/cpufeature.c:698:13: warning: 'cpus_have_hwcap' defined but not used [-Wunused-function]
	../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 78 warnings, 4 section mismatches

Warnings:
	../kernel/trace/trace_events.c:579:32: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type
	../kernel/trace/trace_events.c:580:32: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type
	../kernel/trace/trace_events.c:1723:36: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type
	../kernel/trace/trace_events.c:1725:36: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type
	../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../sound/soc/rockchip/rockchip_spdif.c:283:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/hid/hid-gfrm.c:151:22: warning: initialization from incompatible pointer type
	../drivers/hid/hid-gfrm.c:151:22: warning: (near initialization for 'gfrm_driver.input_configured')
	../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" redefined
	../drivers/gpu/drm/drm_gem_cma_helper.c:484:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/mfd/rtsx_pcr.c:565:6: warning: unused variable 'err' [-Wunused-variable]
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
	../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/spi/spi-bcm63xx.c:565:2: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat=]
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]

Section Mismatches:
	WARNING: drivers/pci/host/built-in.o(.data+0x14d0): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	WARNING: drivers/pci/built-in.o(.data+0x12620): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	WARNING: drivers/built-in.o(.data+0x3cfc8): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	WARNING: vmlinux.o(.data+0x1ab0c8): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6635:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6635:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/drm_gem_cma_helper.c:484:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/regulator/core.c:142:6: warning: unused variable 'i' [-Wunused-variable]
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../kernel/trace/trace_events.c:579:32: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type
	../kernel/trace/trace_events.c:580:32: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type
	../kernel/trace/trace_events.c:1723:36: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type
	../kernel/trace/trace_events.c:1725:36: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type
	../net/netfilter/nfnetlink_log.c:320:14: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 19 warnings, 0 section mismatches

Warnings:
	<stdin>:1304:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../kernel/trace/trace_events.c:579:2: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type [enabled by default]
	../kernel/trace/trace_events.c:580:2: warning: passing argument 1 of 'unregister_trace_sched_switch' from incompatible pointer type [enabled by default]
	../kernel/trace/trace_events.c:1724:8: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type [enabled by default]
	../kernel/trace/trace_events.c:1726:8: warning: passing argument 1 of 'register_trace_prio_sched_switch' from incompatible pointer type [enabled by default]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1079:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'long long int' [-Wformat]
	../drivers/hid/hid-gfrm.c:151:2: warning: initialization from incompatible pointer type [enabled by default]
	../drivers/hid/hid-gfrm.c:151:2: warning: (near initialization for 'gfrm_driver.input_configured') [enabled by default]
	../fs/orangefs/pvfs2-bufmap.c:520:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	../fs/orangefs/pvfs2-bufmap.c:552:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
	../drivers/gpu/drm/drm_gem_cma_helper.c:484:21: warning: unused variable 'dev' [-Wunused-variable]
	../drivers/mfd/rtsx_pcr.c:565:6: warning: unused variable 'err' [-Wunused-variable]
	../drivers/ntb/ntb_transport.c:828:3: warning: right shift count >= width of type [enabled by default]
	../drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2133:1: warning: the frame size of 1256 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/net/ethernet/qlogic/qed/qed_dev.c:1670:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
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
