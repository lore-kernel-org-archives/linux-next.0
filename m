From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160824 build: 0 failures 3 warnings (next-20160824)
Date: Wed, 24 Aug 2016 08:33:03 +0100
Message-ID: <E1bcSgI-00028u-Ur@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53564 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751710AbcHXHdO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Aug 2016 03:33:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160824
Git describe: next-20160824
Commit: 0e055ad950 Add linux-next specific files for 20160824

Build Time: 92 min 47 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  2 ../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:5: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:5: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]
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
