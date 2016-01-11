From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160111 build: 2 failures 11 warnings (next-20160111)
Date: Mon, 11 Jan 2016 12:13:16 +0000
Message-ID: <E1aIbLY-0004jS-9h@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46687 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932471AbcAKMNW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jan 2016 07:13:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160111
Git describe: next-20160111
Commit: bf976ab690 Add linux-next specific files for 20160111

Build Time: 65 min 25 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 2
Warnings: 11
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../sound/soc/amd/acp-pcm-dma.c:83:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
../sound/soc/amd/acp-pcm-dma.c:88:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]

	arm-allmodconfig
../sound/soc/amd/acp-pcm-dma.c:83:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
../sound/soc/amd/acp-pcm-dma.c:88:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-multi_v5_defconfig
      8 warnings    0 mismatches  : arm-multi_v7_defconfig
      6 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  2 ../sound/soc/amd/acp-pcm-dma.c:88:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
	  2 ../sound/soc/amd/acp-pcm-dma.c:83:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]

Warnings Summary: 11
	  6 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  3 ../drivers/pci/host/pcie-designware.c:683:6: warning: unused variable 'ret' [-Wunused-variable]
	  2 ../sound/soc/codecs/hdac_hdmi.c:313:12: warning: 'hdac_hdmi_query_pin_connlist' defined but not used [-Wunused-function]
	  2 ../fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
	  1 arch/arm/configs/multi_v7_defconfig:440:warning: symbol value 'm' invalid for MFD_DA9063
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 4 warnings, 0 section mismatches

Errors:
	../sound/soc/amd/acp-pcm-dma.c:83:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
	../sound/soc/amd/acp-pcm-dma.c:88:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]

Warnings:
	../sound/soc/codecs/hdac_hdmi.c:313:12: warning: 'hdac_hdmi_query_pin_connlist' defined but not used [-Wunused-function]
	../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	../drivers/pci/host/pcie-designware.c:683:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:440:warning: symbol value 'm' invalid for MFD_DA9063
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
	../net/bluetooth/mgmt.c:5493:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5493:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pci/host/pcie-designware.c:683:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 6 warnings, 0 section mismatches

Errors:
	../sound/soc/amd/acp-pcm-dma.c:83:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
	../sound/soc/amd/acp-pcm-dma.c:88:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../sound/soc/codecs/hdac_hdmi.c:313:12: warning: 'hdac_hdmi_query_pin_connlist' defined but not used [-Wunused-function]
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	../drivers/pci/host/pcie-designware.c:683:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
