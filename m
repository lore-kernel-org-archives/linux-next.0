From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170406 build: 0 failures 3 warnings (next-20170406)
Date: Thu, 06 Apr 2017 11:48:40 +0100
Message-ID: <E1cw4y0-0004ej-Op@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59020 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754993AbdDFKsr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Apr 2017 06:48:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170406
Git describe: next-20170406
Commit: d203084e69 Add linux-next specific files for 20170406

Build Time: 115 min 38 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 3
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      2 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 3
	  6 ../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast
	  4 ../drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:608:13: warning: 'hdmi_bus_fmt_is_yuv420' defined but not used [-Wunused-function]
	  1 ../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:608:13: warning: 'hdmi_bus_fmt_is_yuv420' defined but not used [-Wunused-function]
	../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:608:13: warning: 'hdmi_bus_fmt_is_yuv420' defined but not used [-Wunused-function]
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:608:13: warning: 'hdmi_bus_fmt_is_yuv420' defined but not used [-Wunused-function]
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:608:13: warning: 'hdmi_bus_fmt_is_yuv420' defined but not used [-Wunused-function]
	../include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v4t_defconfig
