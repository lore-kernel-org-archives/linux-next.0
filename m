From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160818 build: 0 failures 4 warnings (next-20160818)
Date: Thu, 18 Aug 2016 09:02:31 +0100
Message-ID: <E1baIHX-0001YN-DZ@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33038 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751387AbcHRIEZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Aug 2016 04:04:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160818
Git describe: next-20160818
Commit: 5d466494df Add linux-next specific files for 20160818

Build Time: 92 min 40 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 4
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      3 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Warnings Summary: 4
	  3 ../drivers/net/dsa/mv88e6xxx/chip.c:3253:12: warning: 'mv88e6xxx_port_to_mdio_addr' defined but not used [-Wunused-function]
	  2 ../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 arch/arm/configs/multi_v7_defconfig:139:warning: symbol value 'm' invalid for CPU_FREQ_GOV_SCHEDUTIL
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/net/dsa/mv88e6xxx/chip.c:3253:12: warning: 'mv88e6xxx_port_to_mdio_addr' defined but not used [-Wunused-function]
	../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:139:warning: symbol value 'm' invalid for CPU_FREQ_GOV_SCHEDUTIL

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/net/dsa/mv88e6xxx/chip.c:3253:12: warning: 'mv88e6xxx_port_to_mdio_addr' defined but not used [-Wunused-function]
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/net/dsa/mv88e6xxx/chip.c:3253:12: warning: 'mv88e6xxx_port_to_mdio_addr' defined but not used [-Wunused-function]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
