From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150825 build: 2 failures 13 warnings (next-20150825)
Date: Tue, 25 Aug 2015 10:14:11 +0100
Message-ID: <E1ZUAJ1-0006mL-Ee@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:32858 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755725AbbHYJOQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Aug 2015 05:14:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150825
Git describe: next-20150825
Commit: 512450361e Add linux-next specific files for 20150825

Build Time: 6 min 39 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 2
Warnings: 13
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
../scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory

	arm-allmodconfig
../scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
../scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
      1 warnings    0 mismatches  : arm64-allmodconfig
     10 warnings    0 mismatches  : arm-multi_v5_defconfig
     14 warnings    0 mismatches  : arm-multi_v7_defconfig
      3 warnings    0 mismatches  : x86_64-defconfig
      3 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  2 ../scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
	  2 ../scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory

Warnings Summary: 13
	 10 <stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	  6 <stdin>:1304:2: warning: #warning syscall membarrier not implemented [-Wcpp]
	  6 <stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	  3 ../include/linux/blkdev.h:1368:21: warning: 'bvprv.bv_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../include/linux/blkdev.h:1368:21: warning: 'bvprv.bv_len' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/dma/ipu/ipu_irq.c:305:22: warning: 'irq' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../block/blk-merge.c:91:9: warning: 'bvprv.bv_page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/tegra/tegra20_spdif.c:361:24: warning: unused variable 'spdif' [-Wunused-variable]
	  1 ../net/bluetooth/mgmt.c:6643:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6643:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]
	  1 ../include/asm-generic/memory_model.h:52:52: warning: 'bvprv.bv_page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 1 warnings, 0 section mismatches

Errors:
	../scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
	../scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1304:2: warning: #warning syscall membarrier not implemented [-Wcpp]
	../block/blk-merge.c:91:9: warning: 'bvprv.bv_page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/blkdev.h:1368:21: warning: 'bvprv.bv_len' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/blkdev.h:1368:21: warning: 'bvprv.bv_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/dma/ipu/ipu_irq.c:305:22: warning: 'irq' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1304:2: warning: #warning syscall membarrier not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 14 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1304:2: warning: #warning syscall membarrier not implemented [-Wcpp]
	../block/blk-merge.c:91:9: warning: 'bvprv.bv_page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/blkdev.h:1368:21: warning: 'bvprv.bv_len' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/blkdev.h:1368:21: warning: 'bvprv.bv_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6643:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6643:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/tegra/tegra20_spdif.c:361:24: warning: unused variable 'spdif' [-Wunused-variable]
	../drivers/dma/ipu/ipu_irq.c:305:22: warning: 'irq' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1304:2: warning: #warning syscall membarrier not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../include/linux/blkdev.h:1368:21: warning: 'bvprv.bv_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/blkdev.h:1368:21: warning: 'bvprv.bv_len' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/asm-generic/memory_model.h:52:52: warning: 'bvprv.bv_page' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 3 warnings, 0 section mismatches

Errors:
	../scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
	../scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1304:2: warning: #warning syscall membarrier not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1301:2: warning: #warning syscall mlock2 not implemented [-Wcpp]
	<stdin>:1304:2: warning: #warning syscall membarrier not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
	<stdin>:1298:2: warning: #warning syscall userfaultfd not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
