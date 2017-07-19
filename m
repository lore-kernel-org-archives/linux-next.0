From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170719 build: 1 failures 4 warnings (next-20170719)
Date: Wed, 19 Jul 2017 07:39:02 +0100
Message-ID: <E1dXidS-0003rk-BD@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40970 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753096AbdGSGlT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Jul 2017 02:41:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170719
Git describe: next-20170719
Commit: c981f0b3fb Add linux-next specific files for 20170719

Build Time: 0 min 10 sec

Passed:    6 / 7   ( 85.71 %)
Failed:    1 / 7   ( 14.29 %)

Errors: 5
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1688:8: error: unknown type name 'irqreturn_t'
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1697:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1700:8: error: unknown type name 'irqreturn_t'
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1709:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
../drivers/net/ethernet/mediatek/mtk_eth_soc.c:2478:8: error: implicit declaration of function 'devm_request_irq' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : x86_64-allnoconfig
      3 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : x86_64-defconfig

-------------------------------------------------------------------------------

Errors summary: 5
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:2478:8: error: implicit declaration of function 'devm_request_irq' [-Werror=implicit-function-declaration]
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1709:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1700:8: error: unknown type name 'irqreturn_t'
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1697:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1688:8: error: unknown type name 'irqreturn_t'

Warnings Summary: 4
	  5 ../arch/x86/include/asm/mshyperv.h:181:15: warning: return type defaults to 'int' [-Wreturn-type]
	  1 ../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1710:1: warning: control reaches end of non-void function [-Wreturn-type]
	  1 ../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1698:1: warning: control reaches end of non-void function [-Wreturn-type]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../arch/x86/include/asm/mshyperv.h:181:15: warning: return type defaults to 'int' [-Wreturn-type]
	../arch/x86/include/asm/mshyperv.h:181:15: warning: return type defaults to 'int' [-Wreturn-type]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 5 errors, 3 warnings, 0 section mismatches

Errors:
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1688:8: error: unknown type name 'irqreturn_t'
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1697:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1700:8: error: unknown type name 'irqreturn_t'
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1709:9: error: 'IRQ_HANDLED' undeclared (first use in this function)
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:2478:8: error: implicit declaration of function 'devm_request_irq' [-Werror=implicit-function-declaration]

Warnings:
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1698:1: warning: control reaches end of non-void function [-Wreturn-type]
	../drivers/net/ethernet/mediatek/mtk_eth_soc.c:1710:1: warning: control reaches end of non-void function [-Wreturn-type]
	../drivers/staging/media/imx/imx-media-of.c:216:4: warning: 'remote_np' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../arch/x86/include/asm/mshyperv.h:181:15: warning: return type defaults to 'int' [-Wreturn-type]
	../arch/x86/include/asm/mshyperv.h:181:15: warning: return type defaults to 'int' [-Wreturn-type]
	../arch/x86/include/asm/mshyperv.h:181:15: warning: return type defaults to 'int' [-Wreturn-type]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v4t_defconfig
arm-multi_v7_defconfig
arm-allnoconfig
arm-multi_v5_defconfig
