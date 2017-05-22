From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170522 build: 2 failures 7 warnings (next-20170522)
Date: Mon, 22 May 2017 13:39:11 +0100
Message-ID: <E1dCmcB-0007CC-3W@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34828 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751318AbdEVMjY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 May 2017 08:39:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170522
Git describe: next-20170522
Commit: c696b4419e Add linux-next specific files for 20170522

Build Time: 196 min 53 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 2
Warnings: 7
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
ERROR: "renesas_sdhi_remove" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
ERROR: "renesas_sdhi_probe" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!

	arm-allmodconfig
ERROR: "renesas_sdhi_remove" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
ERROR: "renesas_sdhi_probe" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      3 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      1 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  2 ERROR: "renesas_sdhi_remove" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
	  2 ERROR: "renesas_sdhi_probe" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!

Warnings Summary: 7
	  4 ../mm/vmstat.c:1230:8: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/mm.h:783:14: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/tty/serial/meson_uart.c:127:13: warning: 'meson_uart_enable_tx_engine' defined but not used [-Wunused-function]
	  1 ../net/ipv4/arp.c:880:35: warning: 'addr_type' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../mm/vmstat.c:1224:16: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 4 warnings, 0 section mismatches

Errors:
	ERROR: "renesas_sdhi_remove" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
	ERROR: "renesas_sdhi_probe" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!

Warnings:
	../mm/vmstat.c:1230:8: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/ipv4/arp.c:880:35: warning: 'addr_type' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/meson_uart.c:127:13: warning: 'meson_uart_enable_tx_engine' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/mm.h:783:14: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/vmstat.c:1230:8: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/vmstat.c:1224:16: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 3 warnings, 0 section mismatches

Errors:
	ERROR: "renesas_sdhi_remove" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
	ERROR: "renesas_sdhi_probe" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!

Warnings:
	../mm/vmstat.c:1230:8: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/meson_uart.c:127:13: warning: 'meson_uart_enable_tx_engine' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/mm.h:783:14: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../mm/vmstat.c:1230:8: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-allnoconfig
