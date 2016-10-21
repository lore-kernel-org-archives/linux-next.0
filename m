From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161021 build: 2 failures 4 warnings (next-20161021)
Date: Fri, 21 Oct 2016 14:51:41 +0100
Message-ID: <E1bxaEV-0006Hk-JL@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52774 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754584AbcJUNvx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Oct 2016 09:51:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161021
Git describe: next-20161021
Commit: 4a764da294 Add linux-next specific files for 20161021

Build Time: 298 min 20 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 1
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

	arm-allmodconfig
ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : x86_64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings Summary: 4
	  1 ../include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
	  1 ../fs/nfs/nfs4proc.c:1548:2: warning: missing braces around initializer [-Wmissing-braces]
	  1 ../fs/nfs/nfs4proc.c:1548:2: warning: (near initialization for 'freeme.<anonymous>') [-Wmissing-braces]
	  1 ../drivers/scsi/lpfc/lpfc_logmsg.h:56:45: warning: format '%ld' expects argument of type 'long int', but argument 9 has type 'size_t {aka const unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings:
	../include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

Warnings:
	../drivers/scsi/lpfc/lpfc_logmsg.h:56:45: warning: format '%ld' expects argument of type 'long int', but argument 9 has type 'size_t {aka const unsigned int}' [-Wformat=]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/nfs/nfs4proc.c:1548:2: warning: missing braces around initializer [-Wmissing-braces]
	../fs/nfs/nfs4proc.c:1548:2: warning: (near initialization for 'freeme.<anonymous>') [-Wmissing-braces]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
