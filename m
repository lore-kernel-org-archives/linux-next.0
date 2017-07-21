From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170721 build: 1 failures 3 warnings (next-20170721)
Date: Fri, 21 Jul 2017 09:00:04 +0100
Message-ID: <E1dYSqy-0005pF-1U@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38160 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752871AbdGUIAK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jul 2017 04:00:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170721
Git describe: next-20170721
Commit: 83d9512f12 Add linux-next specific files for 20170721

Build Time: 0 min 13 sec

Passed:    6 / 7   ( 85.71 %)
Failed:    1 / 7   ( 14.29 %)

Errors: 5
Warnings: 3
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1685:8: error: unknown type name 'irqreturn_t'
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1694:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1697:8: error: unknown type name 'irqreturn_t'
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1706:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:2475:8: error: implicit declaration of function 'devm_request_irq' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 5
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:2475:8: error: implicit declaration of function 'devm_request_irq' [-Werror=implicit-function-declaration]
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1706:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1697:8: error: unknown type name 'irqreturn_t'
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1694:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1685:8: error: unknown type name 'irqreturn_t'

Warnings Summary: 3
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1707:1: warning: control reaches end of non-void function [-Wreturn-type]
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1695:1: warning: control reaches end of non-void function [-Wreturn-type]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 5 errors, 3 warnings, 0 section mismatches

Errors:
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1685:8: error: unknown type name 'irqreturn_t'
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1694:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1697:8: error: unknown type name 'irqreturn_t'
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1706:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:2475:8: error: implicit declaration of function 'devm_request_irq' [-Werror=implicit-function-declaration]

Warnings:
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1695:1: warning: control reaches end of non-void function [-Wreturn-type]
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1707:1: warning: control reaches end of non-void function [-Wreturn-type]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
