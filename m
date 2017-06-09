From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170609 build: 0 failures 5 warnings (next-20170609)
Date: Fri, 09 Jun 2017 10:10:43 +0100
Message-ID: <E1dJFwJ-0004qo-LG@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38376 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751531AbdFIJKv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jun 2017 05:10:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170609
Git describe: next-20170609
Commit: fc11440fe1 Add linux-next specific files for 20170609

Build Time: 0 min 10 sec

Passed:    7 / 7   (100.00 %)
Failed:    0 / 7   (  0.00 %)

Errors: 0
Warnings: 5
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : x86_64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 5
	  1 ../drivers/scsi/qla2xxx/qla_init.c:6709:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	  1 ../drivers/scsi/qla2xxx/qla_init.c:6407:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	  1 ../drivers/mtd/nand/fsl_ifc_nand.c:696:7: warning: unused variable 'res' [-Wunused-variable]
	  1 ../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
	  1 ../drivers/block/loop.c:1149:3: warning: this 'if' clause does not guard... [-Wmisleading-indentation]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
	../drivers/mtd/nand/fsl_ifc_nand.c:696:7: warning: unused variable 'res' [-Wunused-variable]
	../drivers/scsi/qla2xxx/qla_init.c:6407:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	../drivers/scsi/qla2xxx/qla_init.c:6709:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/block/loop.c:1149:3: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-multi_v7_defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
arm-multi_v5_defconfig
