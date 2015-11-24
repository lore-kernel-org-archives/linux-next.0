From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151124 build: 2 failures 17 warnings (next-20151124)
Date: Tue, 24 Nov 2015 07:53:38 +0000
Message-ID: <E1a18Py-0002XR-Jb@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45961 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751616AbbKXHxq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2015 02:53:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151124
Git describe: next-20151124
Commit: 073ae1dcef Add linux-next specific files for 20151124

Build Time: 64 min 12 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 2
Warnings: 17
Section Mismatches: 2

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/net/ethernet/freescale/gianfar.c:650:33: error: 'NO_IRQ' undeclared (first use in this function)
../drivers/net/ethernet/freescale/gianfar_ptp.c:470:22: error: 'NO_IRQ' undeclared (first use in this function)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allnoconfig
      6 warnings    2 mismatches  : arm64-allmodconfig
      7 warnings    0 mismatches  : arm-multi_v7_defconfig
      6 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : x86_64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  1 ../drivers/net/ethernet/freescale/gianfar_ptp.c:470:22: error: 'NO_IRQ' undeclared (first use in this function)
	  1 ../drivers/net/ethernet/freescale/gianfar.c:650:33: error: 'NO_IRQ' undeclared (first use in this function)

Warnings Summary: 17
	  3 ../drivers/gpu/drm/tegra/gem.c:73:21: warning: unused variable 'drm' [-Wunused-variable]
	  3 ../drivers/gpu/drm/tegra/gem.c:31:21: warning: unused variable 'drm' [-Wunused-variable]
	  1 ../sound/soc/sh/rcar/mix.c:127:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/dvc.c:315:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6320:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6320:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../mm/page_alloc.c:4166:16: warning: comparison between 'enum zone_type' and 'enum <anonymous>' [-Wenum-compare]
	  1 ../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/qlogic/qed/qed_dev.c:1676:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/net/ethernet/freescale/fsl_pq_mdio.c:468:6: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long int' [-Wformat=]
	  1 ../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:6: warning: unused variable 'i' [-Wunused-variable]
	  1 ../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:380:6: warning: unused variable 'ret' [-Wunused-variable]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Section Mismatch Summary: 2
	  1 WARNING: drivers/pci/host/built-in.o(.data+0x1948): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	  1 WARNING: drivers/pci/built-in.o(.data+0x12ac8): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../kernel/sched/rt.c:68:13: warning: 'push_irq_work_func' declared 'static' but never defined [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 6 warnings, 2 section mismatches

Errors:
	../drivers/net/ethernet/freescale/gianfar.c:650:33: error: 'NO_IRQ' undeclared (first use in this function)
	../drivers/net/ethernet/freescale/gianfar_ptp.c:470:22: error: 'NO_IRQ' undeclared (first use in this function)

Warnings:
	../drivers/gpu/drm/tegra/gem.c:31:21: warning: unused variable 'drm' [-Wunused-variable]
	../drivers/gpu/drm/tegra/gem.c:73:21: warning: unused variable 'drm' [-Wunused-variable]
	../drivers/net/ethernet/freescale/fsl_pq_mdio.c:468:6: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long int' [-Wformat=]
	../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Section Mismatches:
	WARNING: drivers/pci/host/built-in.o(.data+0x1948): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()
	WARNING: drivers/pci/built-in.o(.data+0x12ac8): Section mismatch in reference from the variable hisi_pcie_driver to the function .init.text:hisi_pcie_probe()

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	../net/bluetooth/mgmt.c:6320:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6320:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/ctu.c:88:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/mix.c:127:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../sound/soc/sh/rcar/dvc.c:315:13: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/tegra/gem.c:31:21: warning: unused variable 'drm' [-Wunused-variable]
	../drivers/gpu/drm/tegra/gem.c:73:21: warning: unused variable 'drm' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/gpu/drm/exynos/exynos5433_drm_decon.c:380:6: warning: unused variable 'ret' [-Wunused-variable]
	../drivers/gpu/drm/tegra/gem.c:31:21: warning: unused variable 'drm' [-Wunused-variable]
	../drivers/gpu/drm/tegra/gem.c:73:21: warning: unused variable 'drm' [-Wunused-variable]
	../drivers/net/ethernet/qlogic/qed/qed_dev.c:1676:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:4166:16: warning: comparison between 'enum zone_type' and 'enum <anonymous>' [-Wenum-compare]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-allnoconfig
arm-multi_v5_defconfig
arm64-defconfig
