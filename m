From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171114 build: 4 failures 5 warnings (next-20171114)
Date: Tue, 14 Nov 2017 08:35:46 +0000
Message-ID: <E1eEWh8-0005hK-AY@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50388 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751759AbdKNIft (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Nov 2017 03:35:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171114
Git describe: next-20171114
Commit: c9b945f2a7 Add linux-next specific files for 20171114

Build Time: 19 min 13 sec

Passed:    6 / 10   ( 60.00 %)
Failed:    4 / 10   ( 40.00 %)

Errors: 1
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	x86_64-defconfig
	arm-allmodconfig
	x86_64-allnoconfig

Errors:

	arm64-allmodconfig
../scripts/insert-sys-cert.c:28:18: fatal error: gelf.h: No such file or directory

	arm-allmodconfig
../scripts/insert-sys-cert.c:28:18: fatal error: gelf.h: No such file or directory

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allnoconfig
      2 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      2 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm-multi_v4t_defconfig
      4 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  2 ../scripts/insert-sys-cert.c:28:18: fatal error: gelf.h: No such file or directory

Warnings Summary: 5
	 19 drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	  1 ../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	  1 ../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	  1 ../include/linux/irqchip/arm-gic-v4.h:112:57: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../include/linux/irqchip/arm-gic-v4.h:112:57: warning: 'struct irq_domain_ops' declared inside parameter list



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	../include/linux/irqchip/arm-gic-v4.h:112:57: warning: 'struct irq_domain_ops' declared inside parameter list
	../include/linux/irqchip/arm-gic-v4.h:112:57: warning: its scope is only this definition or declaration, which is probably not what you want

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	../scripts/insert-sys-cert.c:28:18: fatal error: gelf.h: No such file or directory

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported

-------------------------------------------------------------------------------
x86_64-defconfig : FAIL, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	../scripts/insert-sys-cert.c:28:18: fatal error: gelf.h: No such file or directory

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported

-------------------------------------------------------------------------------
x86_64-allnoconfig : FAIL, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported
	../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:
