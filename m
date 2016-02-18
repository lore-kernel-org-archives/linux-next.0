From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160218 build: 4 failures 20 warnings (next-20160218)
Date: Thu, 18 Feb 2016 10:19:04 +0000
Message-ID: <E1aWLfs-00033s-5y@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44568 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1425207AbcBRKTN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2016 05:19:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160218
Git describe: next-20160218
Commit: 3ab40ddf03 Add linux-next specific files for 20160218

Build Time: 73 min 6 sec

Passed:    5 / 9   ( 55.56 %)
Failed:    4 / 9   ( 44.44 %)

Errors: 8
Warnings: 20
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig
	arm-allnoconfig
	arm64-defconfig

Errors:

	arm64-allmodconfig
../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
../drivers/watchdog/orion_wdt.c:109:2: error: implicit declaration of function 'atomic_io_modify' [-Werror=implicit-function-declaration]

	arm-allmodconfig
../arch/arm/kernel/hyp-stub.S:168: Error: selected processor does not support ARM mode `ubfx r7,r7,#28,#4'
../arch/arm/kernel/hyp-stub.S:176: Error: selected processor does not support ARM mode `isb'

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     11 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      6 warnings    0 mismatches  : arm-multi_v7_defconfig
      8 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      6 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 8
	  1 ../drivers/watchdog/orion_wdt.c:109:2: error: implicit declaration of function 'atomic_io_modify' [-Werror=implicit-function-declaration]
	  1 ../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
	  1 ../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
	  1 ../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	  1 ../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	  1 ../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
	  1 ../arch/arm/kernel/hyp-stub.S:176: Error: selected processor does not support ARM mode `isb'
	  1 ../arch/arm/kernel/hyp-stub.S:168: Error: selected processor does not support ARM mode `ubfx r7,r7,#28,#4'

Warnings Summary: 20
	  6 <stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	  4 ../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	  2 ../net/ipv4/igmp.c:1665:14: warning: unused variable 'net' [-Wunused-variable]
	  2 ../net/ipv4/igmp.c:1646:14: warning: unused variable 'net' [-Wunused-variable]
	  2 ../net/ipv4/igmp.c:1319:14: warning: unused variable 'net' [-Wunused-variable]
	  2 ../net/ipv4/igmp.c:1227:14: warning: unused variable 'net' [-Wunused-variable]
	  2 ../include/linux/kernel.h:754:17: warning: comparison of distinct pointer types lacks a cast
	  2 ../drivers/spi/spi.c:2279:9: warning: format '%i' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/pci/host/pci-mvebu.c:904:16: warning: unused variable 'hw' [-Wunused-variable]
	  1 ../drivers/pci/host/pci-mvebu.c:841:40: warning: passing argument 1 of 'sys_to_pcie' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../drivers/pci/host/pci-mvebu.c:839:44: warning: 'struct pci_sys_data' declared inside parameter list
	  1 ../drivers/pci/host/pci-mvebu.c:753:53: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../drivers/pci/host/pci-mvebu.c:753:53: warning: 'struct pci_sys_data' declared inside parameter list
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 6 errors, 11 warnings, 0 section mismatches

Errors:
	../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
	../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
	../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
	../drivers/watchdog/orion_wdt.c:109:2: error: implicit declaration of function 'atomic_io_modify' [-Werror=implicit-function-declaration]

Warnings:
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../drivers/pci/host/pci-mvebu.c:753:53: warning: 'struct pci_sys_data' declared inside parameter list
	../drivers/pci/host/pci-mvebu.c:753:53: warning: its scope is only this definition or declaration, which is probably not what you want
	../drivers/pci/host/pci-mvebu.c:839:44: warning: 'struct pci_sys_data' declared inside parameter list
	../drivers/pci/host/pci-mvebu.c:841:40: warning: passing argument 1 of 'sys_to_pcie' from incompatible pointer type [-Wincompatible-pointer-types]
	../drivers/pci/host/pci-mvebu.c:904:16: warning: unused variable 'hw' [-Wunused-variable]
	../drivers/spi/spi.c:2279:9: warning: format '%i' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../include/linux/kernel.h:754:17: warning: comparison of distinct pointer types lacks a cast

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	../net/ipv4/igmp.c:1227:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1319:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1646:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1665:14: warning: unused variable 'net' [-Wunused-variable]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 8 warnings, 0 section mismatches

Errors:
	../arch/arm/kernel/hyp-stub.S:168: Error: selected processor does not support ARM mode `ubfx r7,r7,#28,#4'
	../arch/arm/kernel/hyp-stub.S:176: Error: selected processor does not support ARM mode `isb'

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-------------------------------------------------------------------------------
arm-allnoconfig : FAIL, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../net/ipv4/igmp.c:1227:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1319:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1646:14: warning: unused variable 'net' [-Wunused-variable]
	../net/ipv4/igmp.c:1665:14: warning: unused variable 'net' [-Wunused-variable]
	../drivers/spi/spi.c:2279:9: warning: format '%i' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
	../include/linux/kernel.h:754:17: warning: comparison of distinct pointer types lacks a cast
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
