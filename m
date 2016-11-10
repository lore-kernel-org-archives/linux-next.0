From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20161110 build: 0 failures 1 warnings (next-20161110)
Date: Thu, 10 Nov 2016 06:48:36 +0000
Message-ID: <E1c4jA4-0002cc-Bz@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34852 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752621AbcKJGsq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2016 01:48:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20161110
Git describe: next-20161110
Commit: 6e637d6fd5 Add linux-next specific files for 20161110

Build Time: 88 min 18 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 1
Section Mismatches: 4

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      0 warnings    2 mismatches  : arm64-allmodconfig
      1 warnings    2 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 1
	  1 ../drivers/tty/serial/pxa.c:944:1: warning: 'serial_pxa_init' is deprecated [-Wdeprecated-declarations]

Section Mismatch Summary: 4
	  1 WARNING: vmlinux.o(.text+0x78c114): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: vmlinux.o(.text+0x544400): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x1a2564): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	  1 WARNING: drivers/built-in.o(.text+0x10fa98): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 0 warnings, 2 section mismatches

Section Mismatches:
	WARNING: drivers/built-in.o(.text+0x1a2564): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x78c114): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 1 warnings, 2 section mismatches

Warnings:
	../drivers/tty/serial/pxa.c:944:1: warning: 'serial_pxa_init' is deprecated [-Wdeprecated-declarations]

Section Mismatches:
	WARNING: drivers/built-in.o(.text+0x10fa98): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
	WARNING: vmlinux.o(.text+0x544400): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
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
