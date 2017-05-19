From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170519 build: 0 failures 6 warnings (next-20170519)
Date: Fri, 19 May 2017 09:49:24 +0100
Message-ID: <E1dBdbA-0003Xv-Jg@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49776 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750805AbdESItc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 May 2017 04:49:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170519
Git describe: next-20170519
Commit: 5666af8ae4 Add linux-next specific files for 20170519

Build Time: 117 min 10 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 6
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      3 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      1 warnings    0 mismatches  : x86_64-allnoconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 6
	  4 ../mm/vmstat.c:1230:8: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../include/linux/mm.h:783:14: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/tty/serial/meson_uart.c:127:13: warning: 'meson_uart_enable_tx_engine' defined but not used [-Wunused-function]
	  1 ../mm/vmstat.c:1224:16: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../mm/vmstat.c:1230:8: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
arm-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

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
