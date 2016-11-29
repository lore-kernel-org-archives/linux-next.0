From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161129 build: 0 failures 2 warnings (next-20161129)
Date: Tue, 29 Nov 2016 07:55:37 +0000
Message-ID: <E1cBdGL-0002ZQ-7r@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51180 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754507AbcK2Hzr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Nov 2016 02:55:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161129
Git describe: next-20161129
Commit: 4030ddad30 Add linux-next specific files for 20161129

Build Time: 84 min 40 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 2
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 2
	  1 ../include/linux/kern_levels.h:4:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	  1 ../fs/btrfs/inode.c:1198:31: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kern_levels.h:4:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/inode.c:1198:31: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
