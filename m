From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170815 build: 2 failures 4 warnings (next-20170815)
Date: Tue, 15 Aug 2017 11:49:36 +0100
Message-ID: <E1dhZPk-0002d9-9k@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:51698 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750997AbdHOLSh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Aug 2017 07:18:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170815
Git describe: next-20170815
Commit: 497247033e Add linux-next specific files for 20170815

Build Time: 78 min 48 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 2
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm64-defconfig

Errors:

	arm64-allmodconfig
../drivers/acpi/spcr.c:168:1: error: expected expression before '<<' token
../drivers/acpi/spcr.c:198:1: error: expected expression before '>>' token

	arm64-defconfig
../drivers/acpi/spcr.c:168:1: error: expected expression before '<<' token
../drivers/acpi/spcr.c:198:1: error: expected expression before '>>' token

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : x86_64-allnoconfig
      1 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  2 ../drivers/acpi/spcr.c:198:1: error: expected expression before '>>' token
	  2 ../drivers/acpi/spcr.c:168:1: error: expected expression before '<<' token

Warnings Summary: 4
	  2 ../drivers/acpi/spcr.c:34:13: warning: 'qdf2400_erratum_44_present' defined but not used [-Wunused-function]
	  1 ../drivers/mmc/core/mmc_test.c:883:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/x86/kernel/cpu/amd.c:305:13: warning: 'legacy_fixup_core_id' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/cpu/amd.c:305:13: warning: 'legacy_fixup_core_id' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 1 warnings, 0 section mismatches

Errors:
	../drivers/acpi/spcr.c:168:1: error: expected expression before '<<' token
	../drivers/acpi/spcr.c:198:1: error: expected expression before '>>' token

Warnings:
	../drivers/acpi/spcr.c:34:13: warning: 'qdf2400_erratum_44_present' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/mmc/core/mmc_test.c:883:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 2 errors, 1 warnings, 0 section mismatches

Errors:
	../drivers/acpi/spcr.c:168:1: error: expected expression before '<<' token
	../drivers/acpi/spcr.c:198:1: error: expected expression before '>>' token

Warnings:
	../drivers/acpi/spcr.c:34:13: warning: 'qdf2400_erratum_44_present' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
