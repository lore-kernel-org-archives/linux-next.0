From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160811 build: 0 failures 1 warnings (next-20160811)
Date: Thu, 11 Aug 2016 07:47:34 +0100
Message-ID: <E1bXjmA-0002Zw-EF@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53336 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932211AbcHKGro (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Aug 2016 02:47:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160811
Git describe: next-20160811
Commit: c0a5420a2e Add linux-next specific files for 20160811

Build Time: 90 min 0 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
