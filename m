From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170117 build: 0 failures 3 warnings (next-20170117)
Date: Tue, 17 Jan 2017 07:54:14 +0000
Message-ID: <E1cTOar-0004qp-TJ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46460 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbdAQHzJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Jan 2017 02:55:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170117
Git describe: next-20170117
Commit: a65f0161f4 Add linux-next specific files for 20170117

Build Time: 101 min 43 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  1 ../drivers/rtc/rtc-stm32.c:673:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/rtc/rtc-stm32.c:651:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../drivers/net/wireless/marvell/mwifiex/pcie.c:303:5: warning: 'fw_status' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/rtc/rtc-stm32.c:651:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../drivers/rtc/rtc-stm32.c:673:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/net/wireless/marvell/mwifiex/pcie.c:303:5: warning: 'fw_status' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
