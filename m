From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170525 build: 0 failures 3 warnings (next-20170525)
Date: Thu, 25 May 2017 09:30:41 +0100
Message-ID: <E1dDoAK-0002NJ-Da@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54950 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932486AbdEYIat (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 May 2017 04:30:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170525
Git describe: next-20170525
Commit: eb60b8cf83 Add linux-next specific files for 20170525

Build Time: 219 min 33 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  3 ../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/ipv4/arp.c:880:35: warning: 'addr_type' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/ipv4/arp.c:880:35: warning: 'addr_type' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
