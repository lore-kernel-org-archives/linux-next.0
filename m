From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150723 build: 2 failures 74 warnings (next-20150723)
Date: Thu, 23 Jul 2015 11:29:11 +0100
Message-ID: <E1ZIDkV-0004VQ-LU@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36052 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752688AbbGWK3V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2015 06:29:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150723
Git describe: next-20150723
Commit: 4e8d04d904 Add linux-next specific files for 20150723

Build Time: 69 min 31 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 2
Warnings: 74
Section Mismatches: 1

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!

	arm-allmodconfig
ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
    400 warnings    2 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
     13 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  2 ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
	  2 ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!

Warnings Summary: 74
	 30 ../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 26 ../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 24 ../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 23 ../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 22 ../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 19 ../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 17 ../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 17 ../drivers/net/fddi/skfp/h/targetos.h:63:0: warning: "FALSE" redefined
	 17 ../drivers/net/fddi/skfp/h/targetos.h:62:0: warning: "TRUE" redefined
	 14 ../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	 14 ../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	 14 ../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 12 ../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 10 <stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	 10 ../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 10 ../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:44:0: warning: "TRUE" redefined
	 10 ../drivers/isdn/mISDN/dsp_ecdis.h:43:0: warning: "FALSE" redefined
	  9 ../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  9 ../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  6 ../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  6 ../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  5 ../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  5 ../drivers/staging/lustre/lnet/klnds/socklnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  4 ../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  4 ../drivers/staging/lustre/lustre/mdc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  4 ../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	  3 warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	  3 ../drivers/staging/lustre/lustre/osc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  3 ../drivers/staging/lustre/lustre/obdclass/linux/../../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  3 ../drivers/staging/lustre/lustre/mgc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  3 ../drivers/staging/lustre/lustre/lov/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  3 ../drivers/staging/lustre/lnet/lnet/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  3 ../drivers/staging/lustre/lnet/klnds/o2iblnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  2 ../drivers/staging/lustre/lustre/obdclass/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  2 ../drivers/staging/lustre/lustre/mdc/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  2 ../drivers/staging/lustre/lustre/lmv/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  2 ../drivers/staging/lustre/lustre/lmv/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  2 ../drivers/staging/lustre/lustre/llite/../lclient/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../net/bluetooth/mgmt.c:6636:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6636:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../ipc/kdbus/connection.c:2049:1: warning: the frame size of 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/lustre/lustre/obdecho/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  1 ../drivers/staging/lustre/lustre/lov/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  1 ../drivers/staging/lustre/lustre/llite/../lclient/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  1 ../drivers/staging/lustre/lustre/llite/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
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

Section Mismatch Summary: 1
	  2 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 400 warnings, 2 section mismatches

Errors:
	ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
	ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!

Warnings:
	warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
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
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
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
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warning Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	../drivers/staging/lustre/lnet/klnds/o2iblnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/klnds/o2iblnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/klnds/o2iblnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/klnds/socklnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/klnds/socklnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/klnds/socklnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/klnds/socklnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/klnds/socklnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/lnet/../../include/linux/lnet/../libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lnet/selftest/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lmv/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lmv/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lmv/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lmv/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../lclient/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../lclient/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../lclient/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mdc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mdc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mdc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mdc/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mdc/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mdc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mgc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mgc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mgc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/linux/../../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/linux/../../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/linux/../../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdecho/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6636:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6636:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 13 warnings, 0 section mismatches

Errors:
	ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
	ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../ipc/kdbus/connection.c:2049:1: warning: the frame size of 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/block/nvme-core.c:1846:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1888:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	../drivers/infiniband/core/uverbs_cmd.c:1466:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/ntb_transport.c:778:3: warning: right shift count >= width of type [enabled by default]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
