From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160711 build: 3 failures 10 warnings (next-20160711)
Date: Mon, 11 Jul 2016 12:51:57 +0100
Message-ID: <E1bMZki-0001u7-VI@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36650 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932166AbcGKLwG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jul 2016 07:52:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160711
Git describe: next-20160711
Commit: dd27435af1 Add linux-next specific files for 20160711

Build Time: 72 min 51 sec

Passed:    6 / 9   ( 66.67 %)
Failed:    3 / 9   ( 33.33 %)

Errors: 1
Warnings: 10
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm64-defconfig

Errors:

	arm64-allnoconfig
../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory
../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory

	arm64-allmodconfig
../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory
../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory

	arm64-defconfig
../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory
../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      9 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  6 ../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory

Warnings Summary: 10
	  3 ../net/ipv4/tunnel4.c:223:1: warning: label 'err_mpls' defined but not used [-Wunused-label]
	  2 ../drivers/rtc/rtc-isl12057.c:249:26: warning: unused variable 'alarm_secs' [-Wunused-variable]
	  2 ../drivers/rtc/rtc-isl12057.c:249:16: warning: unused variable 'rtc_secs' [-Wunused-variable]
	  2 ../drivers/rtc/rtc-isl12057.c:248:18: warning: unused variable 'rtc_tm' [-Wunused-variable]
	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
	  1 ../drivers/media/platform/mtk-vcodec/venc_vpu_if.c:40:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:40:12: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:40:12: warning: format '%lx' expects argument of type 'long unsigned int', but argument 10 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 2 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory
	../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 2 errors, 3 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory
	../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory

Warnings:
	../drivers/rtc/rtc-isl12057.c:249:26: warning: unused variable 'alarm_secs' [-Wunused-variable]
	../drivers/rtc/rtc-isl12057.c:249:16: warning: unused variable 'rtc_secs' [-Wunused-variable]
	../drivers/rtc/rtc-isl12057.c:248:18: warning: unused variable 'rtc_tm' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../net/ipv4/tunnel4.c:223:1: warning: label 'err_mpls' defined but not used [-Wunused-label]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../net/ipv4/tunnel4.c:223:1: warning: label 'err_mpls' defined but not used [-Wunused-label]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../net/ipv4/tunnel4.c:223:1: warning: label 'err_mpls' defined but not used [-Wunused-label]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list
	../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:40:12: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'size_t {aka unsigned int}' [-Wformat=]
	../drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:40:12: warning: format '%lx' expects argument of type 'long unsigned int', but argument 10 has type 'size_t {aka unsigned int}' [-Wformat=]
	../drivers/media/platform/mtk-vcodec/venc_vpu_if.c:40:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/rtc/rtc-isl12057.c:249:26: warning: unused variable 'alarm_secs' [-Wunused-variable]
	../drivers/rtc/rtc-isl12057.c:249:16: warning: unused variable 'rtc_secs' [-Wunused-variable]
	../drivers/rtc/rtc-isl12057.c:248:18: warning: unused variable 'rtc_tm' [-Wunused-variable]
	../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 2 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory
	../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offsets.h: No such file or directory
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-allnoconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
