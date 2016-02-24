From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160224 build: 1 failures 14 warnings (next-20160224)
Date: Wed, 24 Feb 2016 10:52:46 +0000
Message-ID: <E1aYX3l-00023h-56@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60706 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756385AbcBXKwy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2016 05:52:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160224
Git describe: next-20160224
Commit: 96aa08682d Add linux-next specific files for 20160224

Build Time: 137 min 26 sec

Passed:    8 / 9   ( 88.89 %)
Failed:    1 / 9   ( 11.11 %)

Errors: 7
Warnings: 14
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig

Errors:

	arm64-allmodconfig
../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
../drivers/watchdog/orion_wdt.c:109:2: error: implicit declaration of function 'atomic_io_modify' [-Werror=implicit-function-declaration]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      9 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      9 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig

-------------------------------------------------------------------------------

Errors summary: 7
	  4 drivers/gpio/Kconfig:34:error: recursive dependency detected!
	  1 ../drivers/watchdog/orion_wdt.c:109:2: error: implicit declaration of function 'atomic_io_modify' [-Werror=implicit-function-declaration]
	  1 ../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
	  1 ../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
	  1 ../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	  1 ../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	  1 ../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]

Warnings Summary: 14
	  7 <stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	  4 ../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
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
arm64-allmodconfig : FAIL, 6 errors, 9 warnings, 0 section mismatches

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
arm-allmodconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-allnoconfig : PASS, 2 errors, 0 warnings, 0 section mismatches

Errors:
	drivers/gpio/Kconfig:34:error: recursive dependency detected!
	drivers/gpio/Kconfig:34:error: recursive dependency detected!
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm64-defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
