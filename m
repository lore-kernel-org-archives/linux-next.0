From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170606 build: 0 failures 3 warnings (next-20170606)
Date: Tue, 06 Jun 2017 11:31:56 +0100
Message-ID: <E1dIBmE-0001L6-Oh@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51506 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751437AbdFFKcI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Jun 2017 06:32:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170606
Git describe: next-20170606
Commit: 19ce14199a Add linux-next specific files for 20170606

Build Time: 159 min 16 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  2 ../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
	  1 ../drivers/scsi/qla2xxx/qla_init.c:6709:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	  1 ../drivers/scsi/qla2xxx/qla_init.c:6407:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
	../drivers/scsi/qla2xxx/qla_init.c:6407:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	../drivers/scsi/qla2xxx/qla_init.c:6709:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
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
