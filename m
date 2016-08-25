From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160825 build: 0 failures 4 warnings (next-20160825)
Date: Thu, 25 Aug 2016 09:18:31 +0100
Message-ID: <E1bcprr-0005vM-BV@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39398 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755631AbcHYITI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Aug 2016 04:19:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160825
Git describe: next-20160825
Commit: 0f98f121e1 Add linux-next specific files for 20160825

Build Time: 93 min 1 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 4
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 4
	  3 ../crypto/xor.c:156:1: warning: label 'out' defined but not used [-Wunused-label]
	  2 ../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:5: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../crypto/xor.c:156:1: warning: label 'out' defined but not used [-Wunused-label]
	../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../crypto/xor.c:156:1: warning: label 'out' defined but not used [-Wunused-label]
	../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:5: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../crypto/xor.c:156:1: warning: label 'out' defined but not used [-Wunused-label]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
