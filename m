From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160222 build: 5 failures 9 warnings (next-20160222)
Date: Mon, 22 Feb 2016 08:36:46 +0000
Message-ID: <E1aXlz4-000486-Pb@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55148 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453AbcBVIg6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2016 03:36:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160222
Git describe: next-20160222
Commit: 1615dc93be Add linux-next specific files for 20160222

Build Time: 0 min 32 sec

Passed:    4 / 9   ( 44.44 %)
Failed:    5 / 9   ( 55.56 %)

Errors: 9
Warnings: 9
Section Mismatches: 0

Failed defconfigs:
	arm64-allnoconfig
	arm64-allmodconfig
	arm-allmodconfig
	arm-allnoconfig
	arm64-defconfig

Errors:

	arm64-allnoconfig
../arch/arm64/include/asm/kvm_host.h:338:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

	arm64-allmodconfig
../arch/arm64/include/asm/kvm_host.h:338:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

	arm-allmodconfig
../arch/arm/kernel/hyp-stub.S:168: Error: selected processor does not support ARM mode `ubfx r7,r7,#28,#4'
../arch/arm/kernel/hyp-stub.S:176: Error: selected processor does not support ARM mode `isb'
../drivers/net/ethernet/ti/netcp_core.c:1846:31: error: invalid type argument of '->' (have 'struct tc_to_netdev')
../drivers/net/ethernet/ti/netcp_core.c:1851:35: error: invalid type argument of '->' (have 'struct tc_to_netdev')
../drivers/net/ethernet/ti/netcp_core.c:1855:8: error: invalid type argument of '->' (have 'struct tc_to_netdev')
../drivers/net/ethernet/ti/netcp_core.c:1856:28: error: invalid type argument of '->' (have 'struct tc_to_netdev')
../drivers/net/ethernet/ti/netcp_core.c:1857:21: error: invalid type argument of '->' (have 'struct tc_to_netdev')

	arm64-defconfig
../arch/arm64/include/asm/kvm_host.h:338:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      9 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 9
	  4 drivers/gpio/Kconfig:34:error: recursive dependency detected!
	  3 ../arch/arm64/include/asm/kvm_host.h:338:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]
	  1 ../drivers/net/ethernet/ti/netcp_core.c:1857:21: error: invalid type argument of '->' (have 'struct tc_to_netdev')
	  1 ../drivers/net/ethernet/ti/netcp_core.c:1856:28: error: invalid type argument of '->' (have 'struct tc_to_netdev')
	  1 ../drivers/net/ethernet/ti/netcp_core.c:1855:8: error: invalid type argument of '->' (have 'struct tc_to_netdev')
	  1 ../drivers/net/ethernet/ti/netcp_core.c:1851:35: error: invalid type argument of '->' (have 'struct tc_to_netdev')
	  1 ../drivers/net/ethernet/ti/netcp_core.c:1846:31: error: invalid type argument of '->' (have 'struct tc_to_netdev')
	  1 ../arch/arm/kernel/hyp-stub.S:176: Error: selected processor does not support ARM mode `isb'
	  1 ../arch/arm/kernel/hyp-stub.S:168: Error: selected processor does not support ARM mode `ubfx r7,r7,#28,#4'

Warnings Summary: 9
	  6 <stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/net/ethernet/ti/netcp_core.c:1879:19: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/kvm_host.h:338:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/kvm_host.h:338:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/gpio/Kconfig:34:error: recursive dependency detected!
	drivers/gpio/Kconfig:34:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 7 errors, 9 warnings, 0 section mismatches

Errors:
	../arch/arm/kernel/hyp-stub.S:168: Error: selected processor does not support ARM mode `ubfx r7,r7,#28,#4'
	../arch/arm/kernel/hyp-stub.S:176: Error: selected processor does not support ARM mode `isb'
	../drivers/net/ethernet/ti/netcp_core.c:1846:31: error: invalid type argument of '->' (have 'struct tc_to_netdev')
	../drivers/net/ethernet/ti/netcp_core.c:1851:35: error: invalid type argument of '->' (have 'struct tc_to_netdev')
	../drivers/net/ethernet/ti/netcp_core.c:1855:8: error: invalid type argument of '->' (have 'struct tc_to_netdev')
	../drivers/net/ethernet/ti/netcp_core.c:1856:28: error: invalid type argument of '->' (have 'struct tc_to_netdev')
	../drivers/net/ethernet/ti/netcp_core.c:1857:21: error: invalid type argument of '->' (have 'struct tc_to_netdev')

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/ti/netcp_core.c:1879:19: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/gpio/Kconfig:34:error: recursive dependency detected!
	drivers/gpio/Kconfig:34:error: recursive dependency detected!

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 1 errors, 0 warnings, 0 section mismatches

Errors:
	../arch/arm64/include/asm/kvm_host.h:338:2: error: implicit declaration of function 'kvm_call_hyp' [-Werror=implicit-function-declaration]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:
