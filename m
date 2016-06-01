From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160601 build: 0 failures 1 warnings (next-20160601)
Date: Wed, 01 Jun 2016 07:28:35 +0100
Message-ID: <E1b7zdq-000666-IA@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60134 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750697AbcFAG2o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jun 2016 02:28:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160601
Git describe: next-20160601
Commit: e98f2ba416 Add linux-next specific files for 20160601

Build Time: 98 min 20 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
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
