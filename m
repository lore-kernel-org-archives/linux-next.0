From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160712 build: 0 failures 7 warnings (next-20160712)
Date: Tue, 12 Jul 2016 11:17:18 +0100
Message-ID: <E1bMukf-0001XL-KM@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39118 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208AbcGLKR1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Jul 2016 06:17:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160712
Git describe: next-20160712
Commit: 355d5fc3c5 Add linux-next specific files for 20160712

Build Time: 143 min 12 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 7
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      6 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 7
	  1 arch/arm64/configs/defconfig:352:warning: override: reassigning to symbol PWM
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/media/platform/mtk-vcodec/venc_vpu_if.c:40:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:40:12: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:40:12: warning: format '%lx' expects argument of type 'long unsigned int', but argument 10 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:40:12: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'size_t {aka unsigned int}' [-Wformat=]
	../drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:40:12: warning: format '%lx' expects argument of type 'long unsigned int', but argument 10 has type 'size_t {aka unsigned int}' [-Wformat=]
	../drivers/media/platform/mtk-vcodec/venc_vpu_if.c:40:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	arch/arm64/configs/defconfig:352:warning: override: reassigning to symbol PWM
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
