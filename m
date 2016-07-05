From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160705 build: 2 failures 6 warnings (next-20160705)
Date: Tue, 05 Jul 2016 10:15:03 +0100
Message-ID: <E1bKMRb-0005l2-N2@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44378 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754341AbcGEJPO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jul 2016 05:15:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160705
Git describe: next-20160705
Commit: 5786869c1b Add linux-next specific files for 20160705

Build Time: 75 min 0 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 0
Warnings: 6
Section Mismatches: 12

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      0 warnings    8 mismatches  : arm64-allmodconfig
      6 warnings    4 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 6
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1824:4: warning: this decimal constant is unsigned only in ISO C90
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1822:4: warning: this decimal constant is unsigned only in ISO C90
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1817:4: warning: this decimal constant is unsigned only in ISO C90
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list

Section Mismatch Summary: 12
	  1 WARNING: vmlinux.o(.text+0x1ddacc): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: vmlinux.o(.text+0x1ddac4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: vmlinux.o(.text+0x18486c): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/libftrace.o(.text+0x8eec): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/libftrace.o(.text+0x8ee4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/libftrace.o(.text+0x6784): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/built-in.o(.text+0x90ec): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/built-in.o(.text+0x90e4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/built-in.o(.text+0x6974): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/built-in.o(.text+0x17fccc): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/built-in.o(.text+0x17fcc4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/built-in.o(.text+0x118074): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 0 warnings, 8 section mismatches

Section Mismatches:
	WARNING: kernel/trace/libftrace.o(.text+0x8ee4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/trace/libftrace.o(.text+0x8eec): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/trace/built-in.o(.text+0x90e4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/trace/built-in.o(.text+0x90ec): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/built-in.o(.text+0x17fcc4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/built-in.o(.text+0x17fccc): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: vmlinux.o(.text+0x1ddac4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: vmlinux.o(.text+0x1ddacc): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 0 errors, 6 warnings, 4 section mismatches

Warnings:
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1817:4: warning: this decimal constant is unsigned only in ISO C90
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1822:4: warning: this decimal constant is unsigned only in ISO C90
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1824:4: warning: this decimal constant is unsigned only in ISO C90
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined

Section Mismatches:
	WARNING: kernel/trace/libftrace.o(.text+0x6784): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/trace/built-in.o(.text+0x6974): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/built-in.o(.text+0x118074): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: vmlinux.o(.text+0x18486c): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm64-defconfig
