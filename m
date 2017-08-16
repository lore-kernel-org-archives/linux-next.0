From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170816 build: 2 failures 5 warnings (next-20170816)
Date: Wed, 16 Aug 2017 09:47:16 +0100
Message-ID: <E1dhtyu-0006Pc-LX@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:39080 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751454AbdHPIrT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Aug 2017 04:47:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170816
Git describe: next-20170816
Commit: 5d51332f20 Add linux-next specific files for 20170816

Build Time: 78 min 59 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 11
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm64-defconfig

Errors:

	arm64-allmodconfig
../drivers/acpi/spcr.c:165:3: error: label 'done' used but not defined
../drivers/acpi/spcr.c:201:4: error: expected identifier or '(' before 'else'
../include/linux/kern_levels.h:4:18: error: expected declaration specifiers or '...' before string constant
../drivers/acpi/spcr.c:206:27: error: unknown type name 'opts'
../drivers/acpi/spcr.c:208:2: error: expected identifier or '(' before 'if'
../drivers/acpi/spcr.c:211:2: error: type defaults to 'int' in declaration of 'err' [-Werror=implicit-int]
../drivers/acpi/spcr.c:211:30: error: 'uart' undeclared here (not in a function)
../drivers/acpi/spcr.c:211:39: error: 'opts' undeclared here (not in a function)
../drivers/acpi/spcr.c:213:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
../drivers/acpi/spcr.c:215:2: error: expected identifier or '(' before 'return'
../drivers/acpi/spcr.c:216:1: error: expected identifier or '(' before '}' token

	arm64-defconfig
../drivers/acpi/spcr.c:165:3: error: label 'done' used but not defined
../drivers/acpi/spcr.c:201:4: error: expected identifier or '(' before 'else'
../include/linux/kern_levels.h:4:18: error: expected declaration specifiers or '...' before string constant
../drivers/acpi/spcr.c:206:27: error: unknown type name 'opts'
../drivers/acpi/spcr.c:208:2: error: expected identifier or '(' before 'if'
../drivers/acpi/spcr.c:211:2: error: type defaults to 'int' in declaration of 'err' [-Werror=implicit-int]
../drivers/acpi/spcr.c:211:30: error: 'uart' undeclared here (not in a function)
../drivers/acpi/spcr.c:211:39: error: 'opts' undeclared here (not in a function)
../drivers/acpi/spcr.c:213:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
../drivers/acpi/spcr.c:215:2: error: expected identifier or '(' before 'return'
../drivers/acpi/spcr.c:216:1: error: expected identifier or '(' before '}' token

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 11
	  2 ../include/linux/kern_levels.h:4:18: error: expected declaration specifiers or '...' before string constant
	  2 ../drivers/acpi/spcr.c:216:1: error: expected identifier or '(' before '}' token
	  2 ../drivers/acpi/spcr.c:215:2: error: expected identifier or '(' before 'return'
	  2 ../drivers/acpi/spcr.c:213:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
	  2 ../drivers/acpi/spcr.c:211:39: error: 'opts' undeclared here (not in a function)
	  2 ../drivers/acpi/spcr.c:211:30: error: 'uart' undeclared here (not in a function)
	  2 ../drivers/acpi/spcr.c:211:2: error: type defaults to 'int' in declaration of 'err' [-Werror=implicit-int]
	  2 ../drivers/acpi/spcr.c:208:2: error: expected identifier or '(' before 'if'
	  2 ../drivers/acpi/spcr.c:206:27: error: unknown type name 'opts'
	  2 ../drivers/acpi/spcr.c:201:4: error: expected identifier or '(' before 'else'
	  2 ../drivers/acpi/spcr.c:165:3: error: label 'done' used but not defined

Warnings Summary: 5
	  2 ../drivers/acpi/spcr.c:211:2: warning: data definition has no type or storage class
	  2 ../drivers/acpi/spcr.c:201:2: warning: control reaches end of non-void function [-Wreturn-type]
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
arm64-allmodconfig : FAIL, 11 errors, 2 warnings, 0 section mismatches

Errors:
	../drivers/acpi/spcr.c:165:3: error: label 'done' used but not defined
	../drivers/acpi/spcr.c:201:4: error: expected identifier or '(' before 'else'
	../include/linux/kern_levels.h:4:18: error: expected declaration specifiers or '...' before string constant
	../drivers/acpi/spcr.c:206:27: error: unknown type name 'opts'
	../drivers/acpi/spcr.c:208:2: error: expected identifier or '(' before 'if'
	../drivers/acpi/spcr.c:211:2: error: type defaults to 'int' in declaration of 'err' [-Werror=implicit-int]
	../drivers/acpi/spcr.c:211:30: error: 'uart' undeclared here (not in a function)
	../drivers/acpi/spcr.c:211:39: error: 'opts' undeclared here (not in a function)
	../drivers/acpi/spcr.c:213:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
	../drivers/acpi/spcr.c:215:2: error: expected identifier or '(' before 'return'
	../drivers/acpi/spcr.c:216:1: error: expected identifier or '(' before '}' token

Warnings:
	../drivers/acpi/spcr.c:211:2: warning: data definition has no type or storage class
	../drivers/acpi/spcr.c:201:2: warning: control reaches end of non-void function [-Wreturn-type]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/md/dm-integrity.c:827:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/mmc/core/mmc_test.c:883:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 11 errors, 2 warnings, 0 section mismatches

Errors:
	../drivers/acpi/spcr.c:165:3: error: label 'done' used but not defined
	../drivers/acpi/spcr.c:201:4: error: expected identifier or '(' before 'else'
	../include/linux/kern_levels.h:4:18: error: expected declaration specifiers or '...' before string constant
	../drivers/acpi/spcr.c:206:27: error: unknown type name 'opts'
	../drivers/acpi/spcr.c:208:2: error: expected identifier or '(' before 'if'
	../drivers/acpi/spcr.c:211:2: error: type defaults to 'int' in declaration of 'err' [-Werror=implicit-int]
	../drivers/acpi/spcr.c:211:30: error: 'uart' undeclared here (not in a function)
	../drivers/acpi/spcr.c:211:39: error: 'opts' undeclared here (not in a function)
	../drivers/acpi/spcr.c:213:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
	../drivers/acpi/spcr.c:215:2: error: expected identifier or '(' before 'return'
	../drivers/acpi/spcr.c:216:1: error: expected identifier or '(' before '}' token

Warnings:
	../drivers/acpi/spcr.c:211:2: warning: data definition has no type or storage class
	../drivers/acpi/spcr.c:201:2: warning: control reaches end of non-void function [-Wreturn-type]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
