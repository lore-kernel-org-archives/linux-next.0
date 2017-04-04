From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170404 build: 1 failures 3 warnings (next-20170404)
Date: Tue, 04 Apr 2017 12:32:08 +0100
Message-ID: <E1cvMgy-00057J-Hs@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44532 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753215AbdDDLcP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Apr 2017 07:32:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170404
Git describe: next-20170404
Commit: b6937029f6 Add linux-next specific files for 20170404

Build Time: 102 min 12 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 2
Warnings: 3
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1384:15: error: implicit declaration of function 'of_parse_phandle' [-Werror=implicit-function-declaration]
../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1389:22: error: dereferencing pointer to incomplete type 'struct device_node'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1389:22: error: dereferencing pointer to incomplete type 'struct device_node'
	  1 ../drivers/infiniband/hw/hns/hns_roce_hw_v1.c:1384:15: error: implicit declaration of function 'of_parse_phandle' [-Werror=implicit-function-declaration]

Warnings Summary: 3
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
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

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allmodconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
