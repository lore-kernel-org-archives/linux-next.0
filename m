From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170331 build: 3 failures 5 warnings (next-20170331)
Date: Fri, 31 Mar 2017 08:57:21 +0100
Message-ID: <E1ctrQv-0002hq-Jk@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46048 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752999AbdCaH53 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Mar 2017 03:57:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170331
Git describe: next-20170331
Commit: 6af2434b00 Add linux-next specific files for 20170331

Build Time: 1 min 31 sec

Passed:    7 / 10   ( 70.00 %)
Failed:    3 / 10   ( 30.00 %)

Errors: 4
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig
	arm64-defconfig

Errors:

	arm64-allmodconfig
../arch/arm64/include/asm/bug.h:62:29: error: implicit declaration of function '_BUG_FLAGS' [-Werror=implicit-function-declaration]

	arm-allmodconfig
../drivers/net/ethernet/faraday/ftgmac100.c:153:9: error: implicit declaration of function 'device_get_mac_address' [-Werror=implicit-function-declaration]
../drivers/net/ethernet/faraday/ftgmac100.c:1262:6: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]
../drivers/net/ethernet/faraday/ftgmac100.c:1406:6: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]

	arm64-defconfig
../arch/arm64/include/asm/bug.h:62:29: error: implicit declaration of function '_BUG_FLAGS' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 4
	  2 ../arch/arm64/include/asm/bug.h:62:29: error: implicit declaration of function '_BUG_FLAGS' [-Werror=implicit-function-declaration]
	  1 ../drivers/net/ethernet/faraday/ftgmac100.c:153:9: error: implicit declaration of function 'device_get_mac_address' [-Werror=implicit-function-declaration]
	  1 ../drivers/net/ethernet/faraday/ftgmac100.c:1406:6: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
	  1 ../drivers/net/ethernet/faraday/ftgmac100.c:1262:6: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]

Warnings Summary: 5
	  1 arch/arm/configs/multi_v7_defconfig:600:warning: symbol value 'm' invalid for ROCKCHIP_INNO_HDMI
	  1 arch/arm/configs/multi_v7_defconfig:599:warning: symbol value 'm' invalid for ROCKCHIP_DW_MIPI_DSI
	  1 arch/arm/configs/multi_v7_defconfig:598:warning: symbol value 'm' invalid for ROCKCHIP_DW_HDMI
	  1 arch/arm/configs/multi_v7_defconfig:597:warning: symbol value 'm' invalid for ROCKCHIP_ANALOGIX_DP
	  1 ../drivers/net/ethernet/faraday/ftgmac100.c:153:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/bug.h:62:29: error: implicit declaration of function '_BUG_FLAGS' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:597:warning: symbol value 'm' invalid for ROCKCHIP_ANALOGIX_DP
	arch/arm/configs/multi_v7_defconfig:598:warning: symbol value 'm' invalid for ROCKCHIP_DW_HDMI
	arch/arm/configs/multi_v7_defconfig:599:warning: symbol value 'm' invalid for ROCKCHIP_DW_MIPI_DSI
	arch/arm/configs/multi_v7_defconfig:600:warning: symbol value 'm' invalid for ROCKCHIP_INNO_HDMI

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 3 errors, 1 warnings, 0 section mismatches

Errors:
	../drivers/net/ethernet/faraday/ftgmac100.c:153:9: error: implicit declaration of function 'device_get_mac_address' [-Werror=implicit-function-declaration]
	../drivers/net/ethernet/faraday/ftgmac100.c:1262:6: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]
	../drivers/net/ethernet/faraday/ftgmac100.c:1406:6: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]

Warnings:
	../drivers/net/ethernet/faraday/ftgmac100.c:153:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/bug.h:62:29: error: implicit declaration of function '_BUG_FLAGS' [-Werror=implicit-function-declaration]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
