From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170329 build: 0 failures 6 warnings (next-20170329)
Date: Wed, 29 Mar 2017 11:14:58 +0100
Message-ID: <E1ctAd0-0005hl-SG@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55798 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755414AbdC2KPL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Mar 2017 06:15:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170329
Git describe: next-20170329
Commit: 8f8ab14f44 Add linux-next specific files for 20170329

Build Time: 114 min 50 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 6
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig

-------------------------------------------------------------------------------

Warnings Summary: 6
	  1 arch/arm/configs/multi_v7_defconfig:600:warning: symbol value 'm' invalid for ROCKCHIP_INNO_HDMI
	  1 arch/arm/configs/multi_v7_defconfig:599:warning: symbol value 'm' invalid for ROCKCHIP_DW_MIPI_DSI
	  1 arch/arm/configs/multi_v7_defconfig:598:warning: symbol value 'm' invalid for ROCKCHIP_DW_HDMI
	  1 arch/arm/configs/multi_v7_defconfig:597:warning: symbol value 'm' invalid for ROCKCHIP_ANALOGIX_DP
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:597:warning: symbol value 'm' invalid for ROCKCHIP_ANALOGIX_DP
	arch/arm/configs/multi_v7_defconfig:598:warning: symbol value 'm' invalid for ROCKCHIP_DW_HDMI
	arch/arm/configs/multi_v7_defconfig:599:warning: symbol value 'm' invalid for ROCKCHIP_DW_MIPI_DSI
	arch/arm/configs/multi_v7_defconfig:600:warning: symbol value 'm' invalid for ROCKCHIP_INNO_HDMI
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allmodconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
