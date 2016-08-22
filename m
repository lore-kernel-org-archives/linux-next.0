From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160822 build: 0 failures 5 warnings (next-20160822)
Date: Mon, 22 Aug 2016 09:49:03 +0100
Message-ID: <E1bbkul-0006LE-NT@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59804 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752429AbcHVItN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Aug 2016 04:49:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160822
Git describe: next-20160822
Commit: d18b09e429 Add linux-next specific files for 20160822

Build Time: 93 min 5 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 5
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
     30 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 5
	 26 ../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	  2 ../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../include/linux/qed/common_hsi.h:28:48: warning: left shift count >= width of type [-Wshift-count-overflow]
	  1 ../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:5: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 30 warnings, 0 section mismatches

Warnings:
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:28:48: warning: left shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/qlogic/qede/qede_ethtool.c:63:5: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../include/linux/qed/common_hsi.h:17:58: warning: right shift count >= width of type [-Wshift-count-overflow]
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
