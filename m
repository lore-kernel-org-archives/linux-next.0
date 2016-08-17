From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160817 build: 2 failures 5 warnings (next-20160817)
Date: Wed, 17 Aug 2016 08:28:17 +0100
Message-ID: <E1bZvGr-0000Fe-Gg@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:47386 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753682AbcHQH22 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Aug 2016 03:28:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160817
Git describe: next-20160817
Commit: 0fc0b836f3 Add linux-next specific files for 20160817

Build Time: 82 min 51 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 6
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../include/linux/kernel.h:831:48: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c:140:18: error: passing argument 1 of 'dc_ops->cleanup' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:994:52: error: 'dev' undeclared (first use in this function)
../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1055:52: error: 'dev' undeclared (first use in this function)
../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1065:1: error: expected '}' before ';' token

	arm-allmodconfig
../drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:300:61: error: 'outb' undeclared (first use in this function)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Errors summary: 6
	  1 ../include/linux/kernel.h:831:48: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:300:61: error: 'outb' undeclared (first use in this function)
	  1 ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c:140:18: error: passing argument 1 of 'dc_ops->cleanup' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:994:52: error: 'dev' undeclared (first use in this function)
	  1 ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1065:1: error: expected '}' before ';' token
	  1 ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1055:52: error: 'dev' undeclared (first use in this function)

Warnings Summary: 5
	  3 ../drivers/net/dsa/mv88e6xxx/chip.c:3253:12: warning: 'mv88e6xxx_port_to_mdio_addr' defined but not used [-Wunused-function]
	  2 ../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:994:21: warning: unused variable 'drm_dev' [-Wunused-variable]
	  1 ../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1055:21: warning: unused variable 'drm_dev' [-Wunused-variable]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 5 errors, 4 warnings, 0 section mismatches

Errors:
	../include/linux/kernel.h:831:48: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c:140:18: error: passing argument 1 of 'dc_ops->cleanup' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:994:52: error: 'dev' undeclared (first use in this function)
	../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1055:52: error: 'dev' undeclared (first use in this function)
	../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1065:1: error: expected '}' before ';' token

Warnings:
	../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:994:21: warning: unused variable 'drm_dev' [-Wunused-variable]
	../drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c:1055:21: warning: unused variable 'drm_dev' [-Wunused-variable]
	../drivers/net/dsa/mv88e6xxx/chip.c:3253:12: warning: 'mv88e6xxx_port_to_mdio_addr' defined but not used [-Wunused-function]
	../drivers/video/fbdev/mb862xx/mb862xx-i2c.c:160:6: warning: unused variable 'ret' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 3 warnings, 0 section mismatches

Errors:
	../drivers/net/ethernet/mellanox/mlx5/core/debugfs.c:300:61: error: 'outb' undeclared (first use in this function)

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
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
