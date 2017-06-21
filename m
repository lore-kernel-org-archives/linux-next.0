From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170621 build: 1 failures 7 warnings (next-20170621)
Date: Wed, 21 Jun 2017 10:56:07 +0100
Message-ID: <E1dNcMp-0005RN-1w@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56356 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751434AbdFUJ6Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jun 2017 05:58:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170621
Git describe: next-20170621
Commit: be285968cc Add linux-next specific files for 20170621

Build Time: 0 min 10 sec

Passed:    6 / 7   ( 85.71 %)
Failed:    1 / 7   ( 14.29 %)

Errors: 2
Warnings: 7
Section Mismatches: 14

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/pci/host/pcie-mediatek.c:485:8: error: implicit declaration of function 'pci_register_host_bridge' [-Werror=implicit-function-declaration]
../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      2 warnings    0 mismatches  : x86_64-defconfig
     10 warnings   14 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-allnoconfig
      2 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm-multi_v4t_defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  6 ../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
	  1 ../drivers/pci/host/pcie-mediatek.c:485:8: error: implicit declaration of function 'pci_register_host_bridge' [-Werror=implicit-function-declaration]

Warnings Summary: 7
	  7 ../mm/page-writeback.c:2380:15: warning: unused variable 'ret2' [-Wunused-variable]
	  5 ../include/linux/qed/qede_rdma.h:84:19: warning: 'qede_rdma_dev_add' declared 'static' but never defined [-Wunused-function]
	  4 ../kernel/cpu.c:1778:6: warning: unused variable 'cpu' [-Wunused-variable]
	  3 ../include/linux/printk.h:303:2: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/linux/qed/qede_rdma.h:84:19: warning: 'qede_rdma_dev_add' used but never defined
	  1 ../drivers/gpu/drm/arm/hdlcd_crtc.c:264:6: warning: unused variable 'src_x' [-Wunused-variable]
	  1 ../drivers/gpu/drm/arm/hdlcd_crtc.c:264:13: warning: unused variable 'src_y' [-Wunused-variable]

Section Mismatch Summary: 14
	  1 WARNING: drivers/clk/built-in.o(.text+0x150a4): Section mismatch in reference from the function sr_genpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/built-in.o(.text+0x15054): Section mismatch in reference from the function sr_genpll4_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/built-in.o(.text+0x14ffc): Section mismatch in reference from the function sr_genpll5_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/built-in.o(.text+0x14fa8): Section mismatch in reference from the function sr_lcpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/built-in.o(.text+0x14f58): Section mismatch in reference from the function sr_lcpll1_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/built-in.o(.text+0x14f08): Section mismatch in reference from the function sr_lcpll_pcie_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/built-in.o(.text+0x14ebc): Section mismatch in reference from the function sr_genpll3_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/bcm/built-in.o(.text+0x46c4): Section mismatch in reference from the function sr_genpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/bcm/built-in.o(.text+0x4674): Section mismatch in reference from the function sr_genpll4_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/bcm/built-in.o(.text+0x461c): Section mismatch in reference from the function sr_genpll5_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/bcm/built-in.o(.text+0x45c8): Section mismatch in reference from the function sr_lcpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/bcm/built-in.o(.text+0x4578): Section mismatch in reference from the function sr_lcpll1_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/bcm/built-in.o(.text+0x4528): Section mismatch in reference from the function sr_lcpll_pcie_clk_init() to the function .init.text:iproc_pll_clk_setup()
	  1 WARNING: drivers/clk/bcm/built-in.o(.text+0x44dc): Section mismatch in reference from the function sr_genpll3_clk_init() to the function .init.text:iproc_pll_clk_setup()



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../kernel/cpu.c:1778:6: warning: unused variable 'cpu' [-Wunused-variable]
	../mm/page-writeback.c:2380:15: warning: unused variable 'ret2' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../mm/page-writeback.c:2380:15: warning: unused variable 'ret2' [-Wunused-variable]
	../include/linux/printk.h:303:2: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../mm/page-writeback.c:2380:15: warning: unused variable 'ret2' [-Wunused-variable]
	../include/linux/printk.h:303:2: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 7 errors, 10 warnings, 14 section mismatches

Errors:
	../drivers/pci/host/pcie-mediatek.c:485:8: error: implicit declaration of function 'pci_register_host_bridge' [-Werror=implicit-function-declaration]
	../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
	../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
	../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
	../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
	../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token
	../include/linux/qed/qede_rdma.h:85:1: error: expected identifier or '(' before '{' token

Warnings:
	../mm/page-writeback.c:2380:15: warning: unused variable 'ret2' [-Wunused-variable]
	../include/linux/printk.h:303:2: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/arm/hdlcd_crtc.c:264:13: warning: unused variable 'src_y' [-Wunused-variable]
	../drivers/gpu/drm/arm/hdlcd_crtc.c:264:6: warning: unused variable 'src_x' [-Wunused-variable]
	../include/linux/qed/qede_rdma.h:84:19: warning: 'qede_rdma_dev_add' used but never defined
	../include/linux/qed/qede_rdma.h:84:19: warning: 'qede_rdma_dev_add' declared 'static' but never defined [-Wunused-function]
	../include/linux/qed/qede_rdma.h:84:19: warning: 'qede_rdma_dev_add' declared 'static' but never defined [-Wunused-function]
	../include/linux/qed/qede_rdma.h:84:19: warning: 'qede_rdma_dev_add' declared 'static' but never defined [-Wunused-function]
	../include/linux/qed/qede_rdma.h:84:19: warning: 'qede_rdma_dev_add' declared 'static' but never defined [-Wunused-function]
	../include/linux/qed/qede_rdma.h:84:19: warning: 'qede_rdma_dev_add' declared 'static' but never defined [-Wunused-function]

Section Mismatches:
	WARNING: drivers/clk/bcm/built-in.o(.text+0x44dc): Section mismatch in reference from the function sr_genpll3_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/bcm/built-in.o(.text+0x4528): Section mismatch in reference from the function sr_lcpll_pcie_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/bcm/built-in.o(.text+0x4578): Section mismatch in reference from the function sr_lcpll1_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/bcm/built-in.o(.text+0x45c8): Section mismatch in reference from the function sr_lcpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/bcm/built-in.o(.text+0x461c): Section mismatch in reference from the function sr_genpll5_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/bcm/built-in.o(.text+0x4674): Section mismatch in reference from the function sr_genpll4_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/bcm/built-in.o(.text+0x46c4): Section mismatch in reference from the function sr_genpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/built-in.o(.text+0x14ebc): Section mismatch in reference from the function sr_genpll3_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/built-in.o(.text+0x14f08): Section mismatch in reference from the function sr_lcpll_pcie_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/built-in.o(.text+0x14f58): Section mismatch in reference from the function sr_lcpll1_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/built-in.o(.text+0x14fa8): Section mismatch in reference from the function sr_lcpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/built-in.o(.text+0x14ffc): Section mismatch in reference from the function sr_genpll5_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/built-in.o(.text+0x15054): Section mismatch in reference from the function sr_genpll4_clk_init() to the function .init.text:iproc_pll_clk_setup()
	WARNING: drivers/clk/built-in.o(.text+0x150a4): Section mismatch in reference from the function sr_genpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../kernel/cpu.c:1778:6: warning: unused variable 'cpu' [-Wunused-variable]
	../mm/page-writeback.c:2380:15: warning: unused variable 'ret2' [-Wunused-variable]

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../kernel/cpu.c:1778:6: warning: unused variable 'cpu' [-Wunused-variable]
	../mm/page-writeback.c:2380:15: warning: unused variable 'ret2' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../kernel/cpu.c:1778:6: warning: unused variable 'cpu' [-Wunused-variable]
	../mm/page-writeback.c:2380:15: warning: unused variable 'ret2' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:
