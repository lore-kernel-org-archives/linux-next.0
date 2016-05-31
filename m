From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160531 build: 0 failures 3 warnings (next-20160531)
Date: Tue, 31 May 2016 07:24:43 +0100
Message-ID: <E1b7d6Z-0007G5-AH@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56792 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161972AbcEaGYw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 May 2016 02:24:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160531
Git describe: next-20160531
Commit: 05f29d5380 Add linux-next specific files for 20160531

Build Time: 79 min 38 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  1 ../sound/soc/codecs/wm5110.c:2246:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/codecs/cs47l24.c:1091:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../sound/soc/codecs/cs47l24.c:1091:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../sound/soc/codecs/wm5110.c:2246:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allmodconfig
arm-allnoconfig
x86_64-allnoconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
