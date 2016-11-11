From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161111 build: 0 failures 0 warnings (next-20161111)
Date: Fri, 11 Nov 2016 07:10:23 +0000
Message-ID: <E1c55yh-0006MQ-Ch@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56280 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935017AbcKKHKb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Nov 2016 02:10:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161111
Git describe: next-20161111
Commit: 37634f05ef Add linux-next specific files for 20161111

Build Time: 87 min 29 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 0
Section Mismatches: 4

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      0 warnings    2 mismatches  : arm64-allmodconfig
      0 warnings    2 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.text+0x79ba1c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: vmlinux.o(.text+0x548320): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x1a356c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x1105d8): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 0 warnings, 2 section mismatches

Section Mismatches:
	WARNING: drivers/built-in.o(.text+0x1a356c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x79ba1c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 0 warnings, 2 section mismatches

Section Mismatches:
	WARNING: drivers/built-in.o(.text+0x1105d8): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x548320): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
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
