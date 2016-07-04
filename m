From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160704 build: 2 failures 7 warnings (next-20160704)
Date: Mon, 04 Jul 2016 12:50:46 +0100
Message-ID: <E1bK2Ok-0002jU-NX@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40666 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753170AbcGDLu7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jul 2016 07:50:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160704
Git describe: next-20160704
Commit: b2677d15eb Add linux-next specific files for 20160704

Build Time: 74 min 51 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 4
Warnings: 7
Section Mismatches: 11

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/gpu/drm/sti/sti_hdmi.c:1250:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/sti/sti_hdmi.c:1251:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/sti/sti_hdmi.c:1252:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/sti/sti_hdmi.c:1253:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    8 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      7 warnings    3 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 4
	  1 ../drivers/gpu/drm/sti/sti_hdmi.c:1253:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/sti/sti_hdmi.c:1252:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/sti/sti_hdmi.c:1251:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/sti/sti_hdmi.c:1250:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 7
	  5 ../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1824:4: warning: this decimal constant is unsigned only in ISO C90
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1822:4: warning: this decimal constant is unsigned only in ISO C90
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1817:4: warning: this decimal constant is unsigned only in ISO C90
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list

Section Mismatch Summary: 11
	  1 WARNING: vmlinux.o(.text+0x1dda2c): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: vmlinux.o(.text+0x1dda24): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/libftrace.o(.text+0x8eec): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/libftrace.o(.text+0x8ee4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/libftrace.o(.text+0x6784): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/built-in.o(.text+0x90ec): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/built-in.o(.text+0x90e4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/trace/built-in.o(.text+0x6974): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/built-in.o(.text+0x17fc2c): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/built-in.o(.text+0x17fc24): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	  1 WARNING: kernel/built-in.o(.text+0x117ffc): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 1 warnings, 8 section mismatches

Warnings:
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section Mismatches:
	WARNING: kernel/trace/libftrace.o(.text+0x8ee4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/trace/libftrace.o(.text+0x8eec): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/trace/built-in.o(.text+0x90e4): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/trace/built-in.o(.text+0x90ec): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/built-in.o(.text+0x17fc24): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/built-in.o(.text+0x17fc2c): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: vmlinux.o(.text+0x1dda24): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: vmlinux.o(.text+0x1dda2c): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 4 errors, 7 warnings, 3 section mismatches

Errors:
	../drivers/gpu/drm/sti/sti_hdmi.c:1250:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/sti/sti_hdmi.c:1251:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/sti/sti_hdmi.c:1252:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/sti/sti_hdmi.c:1253:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1817:4: warning: this decimal constant is unsigned only in ISO C90
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1822:4: warning: this decimal constant is unsigned only in ISO C90
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/polaris10_hwmgr.c:1824:4: warning: this decimal constant is unsigned only in ISO C90
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section Mismatches:
	WARNING: kernel/trace/libftrace.o(.text+0x6784): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/trace/built-in.o(.text+0x6974): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)
	WARNING: kernel/built-in.o(.text+0x117ffc): Section mismatch in reference from the function ftrace_init_tracefs() to the (unknown reference) .init.data:(unknown)

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/usb/host/xhci-ring.c:753:4: warning: 'ep_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
x86_64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
