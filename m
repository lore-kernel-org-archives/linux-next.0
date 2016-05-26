From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160526 build: 0 failures 4 warnings (next-20160526)
Date: Thu, 26 May 2016 10:46:16 +0100
Message-ID: <E1b5rrr-0000Q1-8W@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40796 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990AbcEZJqX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 May 2016 05:46:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160526
Git describe: next-20160526
Commit: 71e75a2df0 Add linux-next specific files for 20160526

Build Time: 151 min 55 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 4
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 4
	  1 ../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
