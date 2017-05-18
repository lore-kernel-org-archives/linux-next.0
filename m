From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170518 build: 1 failures 4 warnings (next-20170518)
Date: Thu, 18 May 2017 08:15:19 +0100
Message-ID: <E1dBFeZ-0004Qr-Jp@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44290 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753809AbdERHPc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 May 2017 03:15:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170518
Git describe: next-20170518
Commit: db55616926 Add linux-next specific files for 20170518

Build Time: 117 min 33 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
Error: ../arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts:69.17-18 syntax error

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : x86_64-allnoconfig
      3 warnings    0 mismatches  : arm64-allmodconfig
      3 warnings    0 mismatches  : arm-allmodconfig
      3 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 Error: ../arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts:69.17-18 syntax error

Warnings Summary: 4
	  3 ../fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../arch/x86/kernel/tsc.c:189:13: warning: 'set_cyc2ns_scale' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 3 warnings, 0 section mismatches

Errors:
	Error: ../arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts:69.17-18 syntax error

Warnings:
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
