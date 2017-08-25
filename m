From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170825 build: 0 failures 5 warnings (next-20170825)
Date: Fri, 25 Aug 2017 19:55:35 +0100
Message-ID: <E1dlJlX-00010y-CK@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40394 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755792AbdHYSzh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Aug 2017 14:55:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170825
Git describe: next-20170825
Commit: 7159188b70 Add linux-next specific files for 20170825

Build Time: 101 min 30 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 5
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 5
	  2 ../net/ipv6/route.c:1368:43: warning: 'rt_cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../fs/ocfs2/dlm/dlmrecovery.c:2306:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../fs/ocfs2/dlm/dlmrecovery.c:2305:20: warning: unused variable 'queue' [-Wunused-variable]
	  1 ../include/linux/dynamic_debug.h:134:3: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/ocfs2/dlm/dlmrecovery.c:2306:6: warning: unused variable 'i' [-Wunused-variable]
	../fs/ocfs2/dlm/dlmrecovery.c:2305:20: warning: unused variable 'queue' [-Wunused-variable]
	../net/ipv6/route.c:1368:43: warning: 'rt_cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/ipv6/route.c:1368:43: warning: 'rt_cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/ocfs2/dlm/dlmrecovery.c:2306:6: warning: unused variable 'i' [-Wunused-variable]
	../fs/ocfs2/dlm/dlmrecovery.c:2305:20: warning: unused variable 'queue' [-Wunused-variable]
	../include/linux/dynamic_debug.h:134:3: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
