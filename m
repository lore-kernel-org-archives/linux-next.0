From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161208 build: 0 failures 3 warnings (next-20161208)
Date: Thu, 08 Dec 2016 08:03:45 +0000
Message-ID: <E1cEtg8-0000wU-VC@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56264 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750729AbcLHIDw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Dec 2016 03:03:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161208
Git describe: next-20161208
Commit: 6c6ea1d836 Add linux-next specific files for 20161208

Build Time: 98 min 37 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  1 ../drivers/net/ethernet/apm/xgene/xgene_enet_cle.c:836:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../crypto/algif_aead.c:539:9: warning: 'outlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../crypto/algif_aead.c:539:19: warning: 'outlen' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../crypto/algif_aead.c:539:19: warning: 'outlen' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../crypto/algif_aead.c:539:9: warning: 'outlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/net/ethernet/apm/xgene/xgene_enet_cle.c:836:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
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
