From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150716 build: 4 failures 88 warnings (next-20150716)
Date: Thu, 16 Jul 2015 11:05:11 +0100
Message-ID: <E1ZFg2R-0001bO-R5@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53689 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754660AbbGPKFV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2015 06:05:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150716
Git describe: next-20150716
Commit: 6593e2dcde Add linux-next specific files for 20150716

Build Time: 68 min 8 sec

Passed:    5 / 9   ( 55.56 %)
Failed:    4 / 9   ( 44.44 %)

Errors: 7
Warnings: 88
Section Mismatches: 1

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm-allnoconfig
	arm64-defconfig

Errors:

	arm64-allnoconfig
../mm/gup.c:51:4: error: implicit declaration of function 'update_mmu_cache' [-Werror=implicit-function-declaration]

	arm64-allmodconfig
../arch/arm64/include/asm/unistd32.h:801:1: error: array index in initializer exceeds array bounds
../arch/arm64/include/asm/unistd32.h:801:1: error: (near initialization for 'compat_sys_call_table')
../arch/arm64/include/asm/unistd32.h:803:1: error: array index in initializer exceeds array bounds
../arch/arm64/include/asm/unistd32.h:803:1: error: (near initialization for 'compat_sys_call_table')
../arch/arm64/include/asm/unistd32.h:805:1: error: array index in initializer exceeds array bounds
../arch/arm64/include/asm/unistd32.h:805:1: error: (near initialization for 'compat_sys_call_table')

	arm64-defconfig
../arch/arm64/include/asm/unistd32.h:801:1: error: array index in initializer exceeds array bounds
../arch/arm64/include/asm/unistd32.h:801:1: error: (near initialization for 'compat_sys_call_table')
../arch/arm64/include/asm/unistd32.h:803:1: error: array index in initializer exceeds array bounds
../arch/arm64/include/asm/unistd32.h:803:1: error: (near initialization for 'compat_sys_call_table')
../arch/arm64/include/asm/unistd32.h:805:1: error: array index in initializer exceeds array bounds
../arch/arm64/include/asm/unistd32.h:805:1: error: (near initialization for 'compat_sys_call_table')

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
    407 warnings    1 mismatches  : arm64-allmodconfig
     10 warnings    0 mismatches  : arm-multi_v5_defconfig
     11 warnings    0 mismatches  : arm-multi_v7_defconfig
     22 warnings    0 mismatches  : arm-allmodconfig
      5 warnings    0 mismatches  : arm-allnoconfig
      9 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 7
	  2 ../arch/arm64/include/asm/unistd32.h:805:1: error: array index in initializer exceeds array bounds
	  2 ../arch/arm64/include/asm/unistd32.h:805:1: error: (near initialization for 'compat_sys_call_table')
	  2 ../arch/arm64/include/asm/unistd32.h:803:1: error: array index in initializer exceeds array bounds
	  2 ../arch/arm64/include/asm/unistd32.h:803:1: error: (near initialization for 'compat_sys_call_table')
	  2 ../arch/arm64/include/asm/unistd32.h:801:1: error: array index in initializer exceeds array bounds
	  2 ../arch/arm64/include/asm/unistd32.h:801:1: error: (near initialization for 'compat_sys_call_table')
	  1 ../mm/gup.c:51:4: error: implicit declaration of function 'update_mmu_cache' [-Werror=implicit-function-declaration]

Warnings Summary: 88
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
	  7 <stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
	  7 <stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	  7 <stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	  6 ../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  6 ../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  5 ../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  5 ../drivers/staging/lustre/lnet/klnds/socklnd/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  4 ../lib/genalloc.c:599:2: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type [enabled by default]
	  4 ../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  4 ../drivers/staging/lustre/lustre/mdc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  4 ../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:32:0: warning: "TRUE" redefined
	  4 ../drivers/staging/ft1000/ft1000-usb/ft1000_usb.h:31:0: warning: "FALSE" redefined
	  3 warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	  3 ../lib/genalloc.c:599:67: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type
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
	  2 ../arch/arm64/include/asm/unistd32.h:805:1: warning: excess elements in array initializer
	  2 ../arch/arm64/include/asm/unistd32.h:805:1: warning: (near initialization for 'compat_sys_call_table')
	  2 ../arch/arm64/include/asm/unistd32.h:803:1: warning: excess elements in array initializer
	  2 ../arch/arm64/include/asm/unistd32.h:803:1: warning: (near initialization for 'compat_sys_call_table')
	  2 ../arch/arm64/include/asm/unistd32.h:801:1: warning: excess elements in array initializer
	  2 ../arch/arm64/include/asm/unistd32.h:801:1: warning: (near initialization for 'compat_sys_call_table')
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/codecs/sti-sas.c:231:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/ipv4/inet_hashtables.c:617:13: warning: division by zero [-Wdiv-by-zero]
	  1 ../net/bluetooth/mgmt.c:6613:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6613:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../ipc/kdbus/connection.c:2049:1: warning: the frame size of 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/linux/file.h:55:9: warning: 'cfd' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/file.h:55:16: warning: 'cfd' may be used uninitialized in this function [-Wuninitialized]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/lustre/lustre/obdecho/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  1 ../drivers/staging/lustre/lustre/lov/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  1 ../drivers/staging/lustre/lustre/llite/../lclient/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  1 ../drivers/staging/lustre/lustre/llite/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	  1 ../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
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
	  1 ../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/block/nvme-core.c:1849:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1807:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	  1 ../drivers/atm/iphase.h:127:0: warning: "isprint" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 1
	  1 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	../mm/gup.c:51:4: error: implicit declaration of function 'update_mmu_cache' [-Werror=implicit-function-declaration]

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../lib/genalloc.c:599:67: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 6 errors, 407 warnings, 1 section mismatches

Errors:
	../arch/arm64/include/asm/unistd32.h:801:1: error: array index in initializer exceeds array bounds
	../arch/arm64/include/asm/unistd32.h:801:1: error: (near initialization for 'compat_sys_call_table')
	../arch/arm64/include/asm/unistd32.h:803:1: error: array index in initializer exceeds array bounds
	../arch/arm64/include/asm/unistd32.h:803:1: error: (near initialization for 'compat_sys_call_table')
	../arch/arm64/include/asm/unistd32.h:805:1: error: array index in initializer exceeds array bounds
	../arch/arm64/include/asm/unistd32.h:805:1: error: (near initialization for 'compat_sys_call_table')

Warnings:
	warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	warning: (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../arch/arm64/include/asm/unistd32.h:801:1: warning: excess elements in array initializer
	../arch/arm64/include/asm/unistd32.h:801:1: warning: (near initialization for 'compat_sys_call_table')
	../arch/arm64/include/asm/unistd32.h:803:1: warning: excess elements in array initializer
	../arch/arm64/include/asm/unistd32.h:803:1: warning: (near initialization for 'compat_sys_call_table')
	../arch/arm64/include/asm/unistd32.h:805:1: warning: excess elements in array initializer
	../arch/arm64/include/asm/unistd32.h:805:1: warning: (near initialization for 'compat_sys_call_table')
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
	../lib/genalloc.c:599:67: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type
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
	../sound/soc/codecs/sti-sas.c:231:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../sound/pci/echoaudio/echoaudio.h:156:0: warning: "TRUE" redefined
	../sound/pci/echoaudio/echoaudio.h:157:0: warning: "FALSE" redefined
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" redefined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MASK" redefined
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
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
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fid/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/fld/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
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
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/libcfs/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../lclient/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../lclient/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../lclient/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/llite/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lmv/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lmv/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lmv/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lmv/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/lov/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
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
	../drivers/staging/lustre/lustre/obdclass/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/linux/../../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mgc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/linux/../../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/mgc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/linux/../../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdecho/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/osc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/lustre/lustre/obdclass/../include/linux/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/obdclass/../include/lustre/../../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
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
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../include/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../include/linux/bitops.h:6:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
	../drivers/staging/lustre/lustre/ptlrpc/../../include/linux/libcfs/libcfs_string.h:105:0: warning: "strtoul" redefined
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
	../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c): Section mismatch in reference from the function init_module() to the function .exit.text:dprc_driver_exit()

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
	../lib/genalloc.c:599:2: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type [enabled by default]
	../net/ipv4/inet_hashtables.c:617:13: warning: division by zero [-Wdiv-by-zero]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 11 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:6613:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6613:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../lib/genalloc.c:599:2: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type [enabled by default]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 22 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../ipc/kdbus/connection.c:2049:1: warning: the frame size of 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/linux/file.h:55:16: warning: 'cfd' may be used uninitialized in this function [-Wuninitialized]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/block/nvme-core.c:1807:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1849:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../lib/genalloc.c:599:2: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type [enabled by default]
	../drivers/infiniband/core/uverbs_cmd.c:1466:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'long long int' [-Wformat]
	../drivers/ntb/ntb_transport.c:778:3: warning: right shift count >= width of type [enabled by default]
	../drivers/scsi/advansys.c:7806:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1256:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1259:2: warning: #warning syscall munlock2 not implemented [-Wcpp]
	<stdin>:1262:2: warning: #warning syscall munlockall2 not implemented [-Wcpp]
	../lib/genalloc.c:599:2: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type [enabled by default]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 6 errors, 9 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/unistd32.h:801:1: error: array index in initializer exceeds array bounds
	../arch/arm64/include/asm/unistd32.h:801:1: error: (near initialization for 'compat_sys_call_table')
	../arch/arm64/include/asm/unistd32.h:803:1: error: array index in initializer exceeds array bounds
	../arch/arm64/include/asm/unistd32.h:803:1: error: (near initialization for 'compat_sys_call_table')
	../arch/arm64/include/asm/unistd32.h:805:1: error: array index in initializer exceeds array bounds
	../arch/arm64/include/asm/unistd32.h:805:1: error: (near initialization for 'compat_sys_call_table')

Warnings:
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../arch/arm64/include/asm/unistd32.h:801:1: warning: excess elements in array initializer
	../arch/arm64/include/asm/unistd32.h:801:1: warning: (near initialization for 'compat_sys_call_table')
	../arch/arm64/include/asm/unistd32.h:803:1: warning: excess elements in array initializer
	../arch/arm64/include/asm/unistd32.h:803:1: warning: (near initialization for 'compat_sys_call_table')
	../arch/arm64/include/asm/unistd32.h:805:1: warning: excess elements in array initializer
	../arch/arm64/include/asm/unistd32.h:805:1: warning: (near initialization for 'compat_sys_call_table')
	../include/linux/file.h:55:9: warning: 'cfd' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../lib/genalloc.c:599:67: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
