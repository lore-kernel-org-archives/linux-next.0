From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151216 build: 0 failures 21 warnings (next-20151216)
Date: Wed, 16 Dec 2015 09:28:30 +0000
Message-ID: <E1a98Nq-0005vz-6a@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36203 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933966AbbLPJ2i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2015 04:28:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151216
Git describe: next-20151216
Commit: 57036847fe Add linux-next specific files for 20151216

Build Time: 72 min 50 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 21
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      7 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
     10 warnings    0 mismatches  : arm-multi_v7_defconfig
     10 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 21
	  7 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  2 ../drivers/scsi/device_handler/scsi_dh_alua.c:324:23: warning: unused variable 'vpd_pg83' [-Wunused-variable]
	  2 ../drivers/scsi/device_handler/scsi_dh_alua.c:323:17: warning: unused variable 'd' [-Wunused-variable]
	  2 ../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 arch/arm/configs/multi_v7_defconfig:424:warning: symbol value 'm' invalid for MFD_DA9063
	  1 ../sound/soc/sh/rcar/mix.c:135:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/dvc.c:337:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/dma-mapping.h:211:18: warning: 'dma_buf' may be used uninitialized in this function [-Wuninitialized]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/ti/netcp_core.c:776:14: warning: 'buf_ptr' may be used uninitialized in this function [-Wuninitialized]
	  1 ../drivers/net/ethernet/ti/netcp_core.c:687:14: warning: 'ptr' may be used uninitialized in this function [-Wuninitialized]
	  1 ../drivers/net/ethernet/ti/netcp_core.c:665:6: warning: 'org_buf_len' may be used uninitialized in this function [-Wuninitialized]
	  1 ../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpio/gpiolib.c:193:20: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	../drivers/scsi/device_handler/scsi_dh_alua.c:324:23: warning: unused variable 'vpd_pg83' [-Wunused-variable]
	../drivers/scsi/device_handler/scsi_dh_alua.c:323:17: warning: unused variable 'd' [-Wunused-variable]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:424:warning: symbol value 'm' invalid for MFD_DA9063
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/mix.c:135:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/dvc.c:337:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/scsi/device_handler/scsi_dh_alua.c:324:23: warning: unused variable 'vpd_pg83' [-Wunused-variable]
	../drivers/scsi/device_handler/scsi_dh_alua.c:323:17: warning: unused variable 'd' [-Wunused-variable]
	../drivers/net/ethernet/ti/netcp_core.c:776:14: warning: 'buf_ptr' may be used uninitialized in this function [-Wuninitialized]
	../include/linux/dma-mapping.h:211:18: warning: 'dma_buf' may be used uninitialized in this function [-Wuninitialized]
	../drivers/net/ethernet/ti/netcp_core.c:665:6: warning: 'org_buf_len' may be used uninitialized in this function [-Wuninitialized]
	../drivers/net/ethernet/ti/netcp_core.c:687:14: warning: 'ptr' may be used uninitialized in this function [-Wuninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpio/gpiolib.c:193:20: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
