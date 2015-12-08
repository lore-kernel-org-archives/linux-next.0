From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151208 build: 3 failures 21 warnings (next-20151208)
Date: Tue, 08 Dec 2015 08:19:00 +0000
Message-ID: <E1a6DUC-00069X-Sv@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37143 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932799AbbLHITJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2015 03:19:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151208
Git describe: next-20151208
Commit: 856ed208dd Add linux-next specific files for 20151208

Build Time: 64 min 0 sec

Passed:    6 / 9   ( 66.67 %)
Failed:    3 / 9   ( 33.33 %)

Errors: 7
Warnings: 21
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm64-defconfig

Errors:

	arm64-allnoconfig
../arch/arm64/mm/mmap.c:54:1: error: unknown type name 'ifdef'
../arch/arm64/mm/mmap.c:55:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'if'
../arch/arm64/mm/mmap.c:57:2: error: 'else' without a previous 'if'
../arch/arm64/mm/mmap.c:58:2: error: #endif without #if

	arm64-allmodconfig
../arch/arm64/mm/mmap.c:54:1: error: 'ifdef' undeclared (first use in this function)
include/generated/autoconf.h:401:23: error: expected ';' before numeric constant
../arch/arm64/mm/mmap.c:57:2: error: 'else' without a previous 'if'
../arch/arm64/mm/mmap.c:58:2: error: #endif without #if

	arm64-defconfig
../arch/arm64/mm/mmap.c:54:1: error: 'ifdef' undeclared (first use in this function)
include/generated/autoconf.h:51:23: error: expected ';' before numeric constant
../arch/arm64/mm/mmap.c:57:2: error: 'else' without a previous 'if'
../arch/arm64/mm/mmap.c:58:2: error: #endif without #if

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      7 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
     10 warnings    0 mismatches  : arm-multi_v7_defconfig
     12 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 7
	  3 ../arch/arm64/mm/mmap.c:58:2: error: #endif without #if
	  3 ../arch/arm64/mm/mmap.c:57:2: error: 'else' without a previous 'if'
	  2 ../arch/arm64/mm/mmap.c:54:1: error: 'ifdef' undeclared (first use in this function)
	  1 include/generated/autoconf.h:51:23: error: expected ';' before numeric constant
	  1 include/generated/autoconf.h:401:23: error: expected ';' before numeric constant
	  1 ../arch/arm64/mm/mmap.c:55:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'if'
	  1 ../arch/arm64/mm/mmap.c:54:1: error: unknown type name 'ifdef'

Warnings Summary: 21
	  7 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  2 ../fs/cifs/cifsfs.c:963:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
	  2 ../fs/cifs/cifsfs.c:924:20: warning: unused variable 'src_tcon' [-Wunused-variable]
	  2 ../drivers/dma/at_hdmac_regs.h:390:4: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t' [-Wformat]
	  2 ../drivers/dma/at_hdmac_regs.h:390:4: warning: format '%p' expects argument of type 'void *', but argument 4 has type 'dma_addr_t' [-Wformat]
	  2 ../drivers/dma/at_hdmac_regs.h:390:4: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'dma_addr_t' [-Wformat]
	  1 ../sound/soc/sh/rcar/mix.c:135:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/dvc.c:337:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/codecs/da7218.c:2261:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/nvme/host/core.c:424:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/qlogic/qed/qed_dev.c:1676:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/net/ethernet/freescale/fsl_pq_mdio.c:468:6: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long int' [-Wformat=]
	  1 ../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:6: warning: unused variable 'i' [-Wunused-variable]
	  1 ../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:380:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 4 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/mm/mmap.c:54:1: error: unknown type name 'ifdef'
	../arch/arm64/mm/mmap.c:55:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'if'
	../arch/arm64/mm/mmap.c:57:2: error: 'else' without a previous 'if'
	../arch/arm64/mm/mmap.c:58:2: error: #endif without #if

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 4 errors, 7 warnings, 0 section mismatches

Errors:
	../arch/arm64/mm/mmap.c:54:1: error: 'ifdef' undeclared (first use in this function)
	include/generated/autoconf.h:401:23: error: expected ';' before numeric constant
	../arch/arm64/mm/mmap.c:57:2: error: 'else' without a previous 'if'
	../arch/arm64/mm/mmap.c:58:2: error: #endif without #if

Warnings:
	../fs/cifs/cifsfs.c:963:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
	../fs/cifs/cifsfs.c:924:20: warning: unused variable 'src_tcon' [-Wunused-variable]
	../sound/soc/codecs/da7218.c:2261:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/freescale/fsl_pq_mdio.c:468:6: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long int' [-Wformat=]
	../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/mix.c:135:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/dvc.c:337:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/dma/at_hdmac_regs.h:390:4: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'dma_addr_t' [-Wformat]
	../drivers/dma/at_hdmac_regs.h:390:4: warning: format '%p' expects argument of type 'void *', but argument 4 has type 'dma_addr_t' [-Wformat]
	../drivers/dma/at_hdmac_regs.h:390:4: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t' [-Wformat]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 12 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../fs/cifs/cifsfs.c:963:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
	../fs/cifs/cifsfs.c:924:20: warning: unused variable 'src_tcon' [-Wunused-variable]
	../drivers/dma/at_hdmac_regs.h:390:4: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'dma_addr_t' [-Wformat]
	../drivers/dma/at_hdmac_regs.h:390:4: warning: format '%p' expects argument of type 'void *', but argument 4 has type 'dma_addr_t' [-Wformat]
	../drivers/dma/at_hdmac_regs.h:390:4: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t' [-Wformat]
	../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:380:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/nvme/host/core.c:424:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/qlogic/qed/qed_dev.c:1676:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 4 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/mm/mmap.c:54:1: error: 'ifdef' undeclared (first use in this function)
	include/generated/autoconf.h:51:23: error: expected ';' before numeric constant
	../arch/arm64/mm/mmap.c:57:2: error: 'else' without a previous 'if'
	../arch/arm64/mm/mmap.c:58:2: error: #endif without #if
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
