From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161207 build: 1 failures 4 warnings (next-20161207)
Date: Wed, 07 Dec 2016 09:37:44 +0000
Message-ID: <E1cEYfY-00054O-2w@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33382 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752103AbcLGJhv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2016 04:37:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161207
Git describe: next-20161207
Commit: 7677a1fb12 Add linux-next specific files for 20161207

Build Time: 98 min 50 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__bad_xchg" [net/netfilter/nft_counter.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      4 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__bad_xchg" [net/netfilter/nft_counter.ko] undefined!

Warnings Summary: 4
	  2 ../net/netfilter/nf_tables_api.c:3011:15: warning: 'objtype' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/netfilter/nft_counter.c:129:16: warning: 'bytes' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/netfilter/nft_counter.c:128:18: warning: 'packets' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/apm/xgene/xgene_enet_cle.c:836:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../net/netfilter/nf_tables_api.c:3011:15: warning: 'objtype' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 4 warnings, 0 section mismatches

Errors:
	ERROR: "__bad_xchg" [net/netfilter/nft_counter.ko] undefined!

Warnings:
	../net/netfilter/nf_tables_api.c:3011:15: warning: 'objtype' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/netfilter/nft_counter.c:128:18: warning: 'packets' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/netfilter/nft_counter.c:129:16: warning: 'bytes' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
