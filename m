From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170608 build: 1 failures 4 warnings (next-20170608)
Date: Thu, 08 Jun 2017 10:57:50 +0100
Message-ID: <E1dIuCM-0000cQ-QM@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53598 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750914AbdFHJ56 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Jun 2017 05:57:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170608
Git describe: next-20170608
Commit: e4689b9aad Add linux-next specific files for 20170608

Build Time: 0 min 12 sec

Passed:    6 / 7   ( 85.71 %)
Failed:    1 / 7   ( 14.29 %)

Errors: 1
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/hsi/clients/ssi_protocol.c:1069:5: error: 'struct net_device' has no member named 'destructor'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ../drivers/hsi/clients/ssi_protocol.c:1069:5: error: 'struct net_device' has no member named 'destructor'

Warnings Summary: 4
	  1 ../drivers/scsi/qla2xxx/qla_init.c:6709:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	  1 ../drivers/scsi/qla2xxx/qla_init.c:6407:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	  1 ../drivers/mtd/nand/fsl_ifc_nand.c:696:7: warning: unused variable 'res' [-Wunused-variable]
	  1 ../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 4 warnings, 0 section mismatches

Errors:
	../drivers/hsi/clients/ssi_protocol.c:1069:5: error: 'struct net_device' has no member named 'destructor'

Warnings:
	../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
	../drivers/mtd/nand/fsl_ifc_nand.c:696:7: warning: unused variable 'res' [-Wunused-variable]
	../drivers/scsi/qla2xxx/qla_init.c:6407:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	../drivers/scsi/qla2xxx/qla_init.c:6709:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
