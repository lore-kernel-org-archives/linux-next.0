From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170330 build: 2 failures 8 warnings (next-20170330)
Date: Thu, 30 Mar 2017 13:50:39 +0100
Message-ID: <E1ctZXC-0008DB-4g@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37324 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933551AbdC3Mur (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Mar 2017 08:50:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170330
Git describe: next-20170330
Commit: 6fd3fc13b3 Add linux-next specific files for 20170330

Build Time: 213 min 40 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 7
Warnings: 8
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1384:15: error: implicit declaration of function 'of_parse_phandle' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1389:22: error: dereferencing pointer to incomplete type 'struct device_node'

	arm-allmodconfig
../drivers/mtd/nand/atmel/nand-controller.c:2126:25: error: 'atmel_nc_id_table' undeclared here (not in a function)
../include/linux/module.h:212:27: error: '__mod_of__atmel_nc_id_table_device_table' aliased to undefined symbol 'atmel_nc_id_table'
../drivers/net/ethernet/faraday/ftgmac100.c:153:9: error: implicit declaration of function 'device_get_mac_address' [-Werror=implicit-function-declaration]
../drivers/net/ethernet/faraday/ftgmac100.c:1262:6: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]
../drivers/net/ethernet/faraday/ftgmac100.c:1406:6: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 7
	  1 ../include/linux/module.h:212:27: error: '__mod_of__atmel_nc_id_table_device_table' aliased to undefined symbol 'atmel_nc_id_table'
	  1 ../drivers/net/ethernet/faraday/ftgmac100.c:153:9: error: implicit declaration of function 'device_get_mac_address' [-Werror=implicit-function-declaration]
	  1 ../drivers/net/ethernet/faraday/ftgmac100.c:1406:6: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
	  1 ../drivers/net/ethernet/faraday/ftgmac100.c:1262:6: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]
	  1 ../drivers/mtd/nand/atmel/nand-controller.c:2126:25: error: 'atmel_nc_id_table' undeclared here (not in a function)
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1389:22: error: dereferencing pointer to incomplete type 'struct device_node'
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1384:15: error: implicit declaration of function 'of_parse_phandle' [-Werror=implicit-function-declaration]

Warnings Summary: 8
	  1 arch/arm/configs/multi_v7_defconfig:600:warning: symbol value 'm' invalid for ROCKCHIP_INNO_HDMI
	  1 arch/arm/configs/multi_v7_defconfig:599:warning: symbol value 'm' invalid for ROCKCHIP_DW_MIPI_DSI
	  1 arch/arm/configs/multi_v7_defconfig:598:warning: symbol value 'm' invalid for ROCKCHIP_DW_HDMI
	  1 arch/arm/configs/multi_v7_defconfig:597:warning: symbol value 'm' invalid for ROCKCHIP_ANALOGIX_DP
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/net/ethernet/faraday/ftgmac100.c:153:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
	  1 ../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1384:13: warning: assignment makes pointer from integer without a cast [-Wint-conversion]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 3 warnings, 0 section mismatches

Errors:
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1384:15: error: implicit declaration of function 'of_parse_phandle' [-Werror=implicit-function-declaration]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1389:22: error: dereferencing pointer to incomplete type 'struct device_node'

Warnings:
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1384:13: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
	../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:597:warning: symbol value 'm' invalid for ROCKCHIP_ANALOGIX_DP
	arch/arm/configs/multi_v7_defconfig:598:warning: symbol value 'm' invalid for ROCKCHIP_DW_HDMI
	arch/arm/configs/multi_v7_defconfig:599:warning: symbol value 'm' invalid for ROCKCHIP_DW_MIPI_DSI
	arch/arm/configs/multi_v7_defconfig:600:warning: symbol value 'm' invalid for ROCKCHIP_INNO_HDMI

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 5 errors, 1 warnings, 0 section mismatches

Errors:
	../drivers/mtd/nand/atmel/nand-controller.c:2126:25: error: 'atmel_nc_id_table' undeclared here (not in a function)
	../include/linux/module.h:212:27: error: '__mod_of__atmel_nc_id_table_device_table' aliased to undefined symbol 'atmel_nc_id_table'
	../drivers/net/ethernet/faraday/ftgmac100.c:153:9: error: implicit declaration of function 'device_get_mac_address' [-Werror=implicit-function-declaration]
	../drivers/net/ethernet/faraday/ftgmac100.c:1262:6: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]
	../drivers/net/ethernet/faraday/ftgmac100.c:1406:6: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]

Warnings:
	../drivers/net/ethernet/faraday/ftgmac100.c:153:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
