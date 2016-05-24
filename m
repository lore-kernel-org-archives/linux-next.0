From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160524 build: 1 failures 11 warnings (next-20160524)
Date: Tue, 24 May 2016 10:42:59 +0100
Message-ID: <E1b58ra-0008G2-4W@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33330 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752419AbcEXJnM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 May 2016 05:43:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160524
Git describe: next-20160524
Commit: 66c198deda Add linux-next specific files for 20160524

Build Time: 221 min 17 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 12
Warnings: 11
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
../include/linux/page_idle.h:55:1: error: expected expression before '}' token
../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
../include/linux/page_idle.h:65:1: error: expected expression before '}' token
../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
../include/linux/page_idle.h:75:1: error: expected expression before '}' token
../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
../include/linux/page_idle.h:85:1: error: expected expression before '}' token
../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
../include/linux/page_idle.h:95:1: error: expected expression before '}' token
../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
../include/linux/page_idle.h:105:1: error: expected expression before '}' token
../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
../include/linux/page_idle.h:55:1: error: expected expression before '}' token
../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
../include/linux/page_idle.h:65:1: error: expected expression before '}' token
../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
../include/linux/page_idle.h:75:1: error: expected expression before '}' token
../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
../include/linux/page_idle.h:85:1: error: expected expression before '}' token
../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
../include/linux/page_idle.h:95:1: error: expected expression before '}' token
../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
../include/linux/page_idle.h:105:1: error: expected expression before '}' token
../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
../include/linux/page_idle.h:55:1: error: expected expression before '}' token
../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
../include/linux/page_idle.h:65:1: error: expected expression before '}' token
../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
../include/linux/page_idle.h:75:1: error: expected expression before '}' token
../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
../include/linux/page_idle.h:85:1: error: expected expression before '}' token
../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
../include/linux/page_idle.h:95:1: error: expected expression before '}' token
../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
../include/linux/page_idle.h:105:1: error: expected expression before '}' token
../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
../include/linux/page_idle.h:55:1: error: expected expression before '}' token
../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
../include/linux/page_idle.h:65:1: error: expected expression before '}' token
../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
../include/linux/page_idle.h:75:1: error: expected expression before '}' token
../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
../include/linux/page_idle.h:85:1: error: expected expression before '}' token
../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
../include/linux/page_idle.h:95:1: error: expected expression before '}' token
../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
../include/linux/page_idle.h:105:1: error: expected expression before '}' token
../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
../include/linux/page_idle.h:55:1: error: expected expression before '}' token
../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
../include/linux/page_idle.h:65:1: error: expected expression before '}' token
../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
../include/linux/page_idle.h:75:1: error: expected expression before '}' token
../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
../include/linux/page_idle.h:85:1: error: expected expression before '}' token
../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
../include/linux/page_idle.h:95:1: error: expected expression before '}' token
../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
../include/linux/page_idle.h:105:1: error: expected expression before '}' token
../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
../include/linux/page_idle.h:55:1: error: expected expression before '}' token
../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
../include/linux/page_idle.h:65:1: error: expected expression before '}' token
../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
../include/linux/page_idle.h:75:1: error: expected expression before '}' token
../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
../include/linux/page_idle.h:85:1: error: expected expression before '}' token
../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
../include/linux/page_idle.h:95:1: error: expected expression before '}' token
../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
../include/linux/page_idle.h:105:1: error: expected expression before '}' token
../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
../include/linux/page_idle.h:55:1: error: expected expression before '}' token
../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
../include/linux/page_idle.h:65:1: error: expected expression before '}' token
../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
../include/linux/page_idle.h:75:1: error: expected expression before '}' token
../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
../include/linux/page_idle.h:85:1: error: expected expression before '}' token
../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
../include/linux/page_idle.h:95:1: error: expected expression before '}' token
../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
../include/linux/page_idle.h:105:1: error: expected expression before '}' token

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      8 warnings    0 mismatches  : arm64-allmodconfig
     24 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 12
	  7 ../include/linux/page_idle.h:95:1: error: expected expression before '}' token
	  7 ../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
	  7 ../include/linux/page_idle.h:85:1: error: expected expression before '}' token
	  7 ../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
	  7 ../include/linux/page_idle.h:75:1: error: expected expression before '}' token
	  7 ../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
	  7 ../include/linux/page_idle.h:65:1: error: expected expression before '}' token
	  7 ../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
	  7 ../include/linux/page_idle.h:55:1: error: expected expression before '}' token
	  7 ../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
	  7 ../include/linux/page_idle.h:105:1: error: expected expression before '}' token
	  7 ../include/linux/page_idle.h:102:3: error: expected ')' before 'return'

Warnings Summary: 11
	  7 ../include/linux/page_idle.h:85:1: warning: no return statement in function returning non-void [-Wreturn-type]
	  7 ../include/linux/page_idle.h:75:1: warning: no return statement in function returning non-void [-Wreturn-type]
	  7 ../include/linux/page_idle.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
	  2 ../mm/page_owner.c:71:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
	  2 ../mm/page_owner.c:212:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
	  2 ../mm/page_owner.c:118:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
	  2 ../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]
	  1 ../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	../mm/page_owner.c:71:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
	../mm/page_owner.c:118:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
	../mm/page_owner.c:212:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
	../fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 84 errors, 24 warnings, 0 section mismatches

Errors:
	../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:55:1: error: expected expression before '}' token
	../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:65:1: error: expected expression before '}' token
	../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:75:1: error: expected expression before '}' token
	../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:85:1: error: expected expression before '}' token
	../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:95:1: error: expected expression before '}' token
	../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:105:1: error: expected expression before '}' token
	../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:55:1: error: expected expression before '}' token
	../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:65:1: error: expected expression before '}' token
	../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:75:1: error: expected expression before '}' token
	../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:85:1: error: expected expression before '}' token
	../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:95:1: error: expected expression before '}' token
	../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:105:1: error: expected expression before '}' token
	../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:55:1: error: expected expression before '}' token
	../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:65:1: error: expected expression before '}' token
	../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:75:1: error: expected expression before '}' token
	../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:85:1: error: expected expression before '}' token
	../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:95:1: error: expected expression before '}' token
	../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:105:1: error: expected expression before '}' token
	../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:55:1: error: expected expression before '}' token
	../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:65:1: error: expected expression before '}' token
	../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:75:1: error: expected expression before '}' token
	../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:85:1: error: expected expression before '}' token
	../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:95:1: error: expected expression before '}' token
	../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:105:1: error: expected expression before '}' token
	../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:55:1: error: expected expression before '}' token
	../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:65:1: error: expected expression before '}' token
	../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:75:1: error: expected expression before '}' token
	../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:85:1: error: expected expression before '}' token
	../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:95:1: error: expected expression before '}' token
	../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:105:1: error: expected expression before '}' token
	../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:55:1: error: expected expression before '}' token
	../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:65:1: error: expected expression before '}' token
	../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:75:1: error: expected expression before '}' token
	../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:85:1: error: expected expression before '}' token
	../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:95:1: error: expected expression before '}' token
	../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:105:1: error: expected expression before '}' token
	../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:55:1: error: expected expression before '}' token
	../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:65:1: error: expected expression before '}' token
	../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:75:1: error: expected expression before '}' token
	../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:85:1: error: expected expression before '}' token
	../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:95:1: error: expected expression before '}' token
	../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
	../include/linux/page_idle.h:105:1: error: expected expression before '}' token

Warnings:
	../include/linux/page_idle.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:75:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:85:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:75:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:85:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:75:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:85:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../mm/page_owner.c:71:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
	../mm/page_owner.c:118:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
	../mm/page_owner.c:212:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
	../include/linux/page_idle.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:75:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:85:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:75:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:85:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:75:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:85:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:75:1: warning: no return statement in function returning non-void [-Wreturn-type]
	../include/linux/page_idle.h:85:1: warning: no return statement in function returning non-void [-Wreturn-type]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
