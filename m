From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160520 build: 0 failures 11 warnings (next-20160520)
Date: Fri, 20 May 2016 08:39:55 +0100
Message-ID: <E1b3f2J-0007Uj-69@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49466 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751667AbcETHkF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 May 2016 03:40:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160520
Git describe: next-20160520
Commit: 89949abc7f Add linux-next specific files for 20160520

Build Time: 78 min 17 sec

Passed:    9 / 9   (100.00 %)
Failed:    0 / 9   (  0.00 %)

Errors: 0
Warnings: 11
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     11 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      5 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 11
	  4 ../drivers/net/usb/pegasus.c:475:1: warning: label 'goon' defined but not used [-Wunused-label]
	  4 ../drivers/net/usb/pegasus.c:446:8: warning: unused variable 'pkt_len' [-Wunused-variable]
	  4 ../drivers/net/usb/pegasus.c:445:6: warning: unused variable 'buf' [-Wunused-variable]
	  4 ../drivers/net/usb/pegasus.c:443:17: warning: unused variable 'count' [-Wunused-variable]
	  2 ../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]
	  1 ../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 11 warnings, 0 section mismatches

Warnings:
	../fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/usb/pegasus.c:475:1: warning: label 'goon' defined but not used [-Wunused-label]
	../drivers/net/usb/pegasus.c:446:8: warning: unused variable 'pkt_len' [-Wunused-variable]
	../drivers/net/usb/pegasus.c:445:6: warning: unused variable 'buf' [-Wunused-variable]
	../drivers/net/usb/pegasus.c:443:17: warning: unused variable 'count' [-Wunused-variable]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../drivers/net/usb/pegasus.c:475:1: warning: label 'goon' defined but not used [-Wunused-label]
	../drivers/net/usb/pegasus.c:446:8: warning: unused variable 'pkt_len' [-Wunused-variable]
	../drivers/net/usb/pegasus.c:445:6: warning: unused variable 'buf' [-Wunused-variable]
	../drivers/net/usb/pegasus.c:443:17: warning: unused variable 'count' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../drivers/net/usb/pegasus.c:475:1: warning: label 'goon' defined but not used [-Wunused-label]
	../drivers/net/usb/pegasus.c:446:8: warning: unused variable 'pkt_len' [-Wunused-variable]
	../drivers/net/usb/pegasus.c:445:6: warning: unused variable 'buf' [-Wunused-variable]
	../drivers/net/usb/pegasus.c:443:17: warning: unused variable 'count' [-Wunused-variable]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../drivers/net/usb/pegasus.c:475:1: warning: label 'goon' defined but not used [-Wunused-label]
	../drivers/net/usb/pegasus.c:446:8: warning: unused variable 'pkt_len' [-Wunused-variable]
	../drivers/net/usb/pegasus.c:445:6: warning: unused variable 'buf' [-Wunused-variable]
	../drivers/net/usb/pegasus.c:443:17: warning: unused variable 'count' [-Wunused-variable]
	../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
