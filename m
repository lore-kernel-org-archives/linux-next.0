From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170824 build: 0 failures 7 warnings (next-20170824)
Date: Thu, 24 Aug 2017 12:56:11 +0100
Message-ID: <E1dkqk7-0007FZ-FW@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46616 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdHXL4N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Aug 2017 07:56:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170824
Git describe: next-20170824
Commit: 9506597de2 Add linux-next specific files for 20170824

Build Time: 100 min 1 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 7
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      5 warnings    0 mismatches  : arm64-allmodconfig
      6 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 7
	  2 ../net/ipv6/route.c:1322:43: warning: 'rt_cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../fs/ocfs2/dlm/dlmrecovery.c:2306:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../fs/ocfs2/dlm/dlmrecovery.c:2305:20: warning: unused variable 'queue' [-Wunused-variable]
	  1 ../include/linux/dynamic_debug.h:134:3: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/rtlwifi/base.c:2546:34: warning: 'ht_cap_ie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/phy/ralink/phy-ralink-usb.c:195:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/ipv6/route.c:1322:43: warning: 'rt_cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/ocfs2/dlm/dlmrecovery.c:2306:6: warning: unused variable 'i' [-Wunused-variable]
	../fs/ocfs2/dlm/dlmrecovery.c:2305:20: warning: unused variable 'queue' [-Wunused-variable]
	../drivers/phy/ralink/phy-ralink-usb.c:195:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../include/linux/cpumask.h:24:29: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/ipv6/route.c:1322:43: warning: 'rt_cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/ocfs2/dlm/dlmrecovery.c:2306:6: warning: unused variable 'i' [-Wunused-variable]
	../fs/ocfs2/dlm/dlmrecovery.c:2305:20: warning: unused variable 'queue' [-Wunused-variable]
	../include/linux/dynamic_debug.h:134:3: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/rtlwifi/base.c:2546:34: warning: 'ht_cap_ie' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
