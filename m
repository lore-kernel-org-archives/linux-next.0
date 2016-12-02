From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161202 build: 1 failures 1 warnings (next-20161202)
Date: Fri, 02 Dec 2016 07:13:54 +0000
Message-ID: <E1cCi2c-00071b-En@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57604 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751789AbcLBHOS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Dec 2016 02:14:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161202
Git describe: next-20161202
Commit: e05f574a0b Add linux-next specific files for 20161202

Build Time: 90 min 7 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 4
Warnings: 1
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "cpdma_chan_set_weight" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!
ERROR: "cpdma_chan_get_rate" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!
ERROR: "cpdma_chan_get_min_rate" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!
ERROR: "cpdma_chan_set_rate" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 4
	  1 ERROR: "cpdma_chan_set_weight" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!
	  1 ERROR: "cpdma_chan_set_rate" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!
	  1 ERROR: "cpdma_chan_get_rate" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!
	  1 ERROR: "cpdma_chan_get_min_rate" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!

Warnings Summary: 1
	  1 ../fs/btrfs/inode.c:1198:31: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 4 errors, 0 warnings, 0 section mismatches

Errors:
	ERROR: "cpdma_chan_set_weight" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!
	ERROR: "cpdma_chan_get_rate" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!
	ERROR: "cpdma_chan_get_min_rate" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!
	ERROR: "cpdma_chan_set_rate" [drivers/net/ethernet/ti/ti_cpsw.ko] undefined!

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/inode.c:1198:31: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
