From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160603 build: 0 failures 2 warnings (next-20160603)
Date: Fri, 03 Jun 2016 07:55:06 +0100
Message-ID: <E1b8j0b-0004pD-Ui@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37136 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377AbcFCGzM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jun 2016 02:55:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160603
Git describe: next-20160603
Commit: 64289ca05e Add linux-next specific files for 20160603

Build Time: 79 min 41 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 2
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 2
	  2 ../drivers/dma-buf/sync_file.c:85:53: warning: format '%d' expects argument of type 'int', but argument 6 has type 'u64 {aka long long unsigned int}' [-Wformat=]
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/dma-buf/sync_file.c:85:53: warning: format '%d' expects argument of type 'int', but argument 6 has type 'u64 {aka long long unsigned int}' [-Wformat=]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/dma-buf/sync_file.c:85:53: warning: format '%d' expects argument of type 'int', but argument 6 has type 'u64 {aka long long unsigned int}' [-Wformat=]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm64-defconfig
