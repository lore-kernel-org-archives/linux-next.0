From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161109 build: 0 failures 2 warnings (next-20161109)
Date: Wed, 09 Nov 2016 10:36:59 +0000
Message-ID: <E1c4QFW-0005Tj-1Z@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37330 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751425AbcKIKhJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Nov 2016 05:37:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161109
Git describe: next-20161109
Commit: 6b9ac964c2 Add linux-next specific files for 20161109

Build Time: 159 min 43 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 2
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : x86_64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 2
	  1 ../mm/hugetlb.c:1166:21: warning: 'alloc_gigantic_page' defined but not used [-Wunused-function]
	  1 ../drivers/tty/serial/pxa.c:944:1: warning: 'serial_pxa_init' is deprecated [-Wdeprecated-declarations]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/tty/serial/pxa.c:944:1: warning: 'serial_pxa_init' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/hugetlb.c:1166:21: warning: 'alloc_gigantic_page' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-allmodconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
