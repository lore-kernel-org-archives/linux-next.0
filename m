From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161206 build: 0 failures 3 warnings (next-20161206)
Date: Tue, 06 Dec 2016 07:38:35 +0000
Message-ID: <E1cEAKh-0000Mt-Co@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38914 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752262AbcLFHin (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2016 02:38:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161206
Git describe: next-20161206
Commit: efe90db21f Add linux-next specific files for 20161206

Build Time: 98 min 51 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  2 ../net/netfilter/nft_payload.c:261:15: warning: 'tsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/net/checksum.h:71:9: warning: 'fsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/apm/xgene/xgene_enet_cle.c:836:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../net/netfilter/nft_payload.c:261:15: warning: 'tsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/net/checksum.h:71:9: warning: 'fsum' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../net/netfilter/nft_payload.c:261:15: warning: 'tsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/net/checksum.h:71:9: warning: 'fsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
