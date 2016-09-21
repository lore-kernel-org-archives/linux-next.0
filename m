From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160921 build: 2 failures 4 warnings (next-20160921)
Date: Wed, 21 Sep 2016 10:18:33 +0100
Message-ID: <E1bmdfl-0004iM-2t@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54174 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753240AbcIUJSo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2016 05:18:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160921
Git describe: next-20160921
Commit: 4fbbc83e89 Add linux-next specific files for 20160921

Build Time: 85 min 15 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 4
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/lov/lov.ko] undefined!
ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/llite/lustre.ko] undefined!
ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

	arm-allmodconfig
ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/lov/lov.ko] undefined!
ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/llite/lustre.ko] undefined!
ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      6 warnings    0 mismatches  : arm-multi_v5_defconfig
      7 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v4t_defconfig
      3 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 4
	  2 ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
	  2 ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/lov/lov.ko] undefined!
	  2 ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/llite/lustre.ko] undefined!
	  2 ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings Summary: 4
	  7 <stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	  7 <stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	  7 <stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	  2 ../drivers/dma/imx-sdma.c:673:13: warning: 'sdma_handle_channel_loop' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 4 errors, 0 warnings, 0 section mismatches

Errors:
	ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
	ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/lov/lov.ko] undefined!
	ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/llite/lustre.ko] undefined!
	ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	../drivers/dma/imx-sdma.c:673:13: warning: 'sdma_handle_channel_loop' defined but not used [-Wunused-function]
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 4 errors, 4 warnings, 0 section mismatches

Errors:
	ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
	ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/lov/lov.ko] undefined!
	ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/llite/lustre.ko] undefined!
	ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
	../drivers/dma/imx-sdma.c:673:13: warning: 'sdma_handle_channel_loop' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1316:2: warning: #warning syscall pkey_mprotect not implemented [-Wcpp]
	<stdin>:1319:2: warning: #warning syscall pkey_alloc not implemented [-Wcpp]
	<stdin>:1322:2: warning: #warning syscall pkey_free not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
arm64-defconfig
