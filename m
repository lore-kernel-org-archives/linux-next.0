From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160225 build: 2 failures 44 warnings (next-20160225)
Date: Thu, 25 Feb 2016 10:04:29 +0000
Message-ID: <E1aYsmb-0006qb-76@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35152 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760128AbcBYKEo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2016 05:04:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160225
Git describe: next-20160225
Commit: 6cbc4fe7dd Add linux-next specific files for 20160225

Build Time: 93 min 8 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 9
Warnings: 44
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm64-defconfig

Errors:

	arm64-allmodconfig
../arch/arm64/mm/hugetlbpage.c:127:42: error: macro "pte_alloc_map" passed 4 arguments, but takes just 3
../arch/arm64/mm/hugetlbpage.c:127:9: error: 'pte_alloc_map' undeclared (first use in this function)
../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
../drivers/watchdog/orion_wdt.c:109:2: error: implicit declaration of function 'atomic_io_modify' [-Werror=implicit-function-declaration]

	arm64-defconfig
../arch/arm64/mm/hugetlbpage.c:127:42: error: macro "pte_alloc_map" passed 4 arguments, but takes just 3
../arch/arm64/mm/hugetlbpage.c:127:9: error: 'pte_alloc_map' undeclared (first use in this function)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     74 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      9 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 9
	  4 drivers/gpio/Kconfig:34:error: recursive dependency detected!
	  2 ../arch/arm64/mm/hugetlbpage.c:127:9: error: 'pte_alloc_map' undeclared (first use in this function)
	  2 ../arch/arm64/mm/hugetlbpage.c:127:42: error: macro "pte_alloc_map" passed 4 arguments, but takes just 3
	  1 ../drivers/watchdog/orion_wdt.c:109:2: error: implicit declaration of function 'atomic_io_modify' [-Werror=implicit-function-declaration]
	  1 ../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
	  1 ../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
	  1 ../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	  1 ../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	  1 ../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]

Warnings Summary: 44
	  7 <stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	  6 ../include/trace/events/page_ref.h:97:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:54:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:47:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:125:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:118:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:111:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:104:18: warning: 'struct page' declared inside parameter list
	  4 ../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	  2 ../arch/arm64/mm/hugetlbpage.c:117:10: warning: unused variable 'pmd' [-Wunused-variable]
	  1 ../mm/debug_page_ref.c:8:21: warning: passing argument 1 of 'trace_page_ref_set' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:50:26: warning: passing argument 1 of 'trace_page_ref_unfreeze' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:43:24: warning: passing argument 1 of 'trace_page_ref_freeze' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:36:28: warning: passing argument 1 of 'trace_page_ref_mod_unless' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:29:32: warning: passing argument 1 of 'trace_page_ref_mod_and_return' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:22:30: warning: passing argument 1 of 'trace_page_ref_mod_and_test' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:15:21: warning: passing argument 1 of 'trace_page_ref_mod' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Wincompatible-pointer-types]
	  1 ../include/trace/events/page_ref.h:47:18: warning: its scope is only this definition or declaration, which is probably not what you want
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
arm64-allmodconfig : FAIL, 8 errors, 74 warnings, 0 section mismatches

Errors:
	../arch/arm64/mm/hugetlbpage.c:127:42: error: macro "pte_alloc_map" passed 4 arguments, but takes just 3
	../arch/arm64/mm/hugetlbpage.c:127:9: error: 'pte_alloc_map' undeclared (first use in this function)
	../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
	../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
	../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
	../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
	../drivers/watchdog/orion_wdt.c:109:2: error: implicit declaration of function 'atomic_io_modify' [-Werror=implicit-function-declaration]

Warnings:
	../arch/arm64/mm/hugetlbpage.c:117:10: warning: unused variable 'pmd' [-Wunused-variable]
	../include/trace/events/page_ref.h:47:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:47:18: warning: its scope is only this definition or declaration, which is probably not what you want
	../include/trace/events/page_ref.h:47:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:47:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:47:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:47:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:47:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:54:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:54:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:54:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:54:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:54:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:54:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:97:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:97:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:97:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:97:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:97:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:97:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:104:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:104:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:104:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:104:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:104:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:104:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:111:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:111:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:111:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:111:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:111:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:111:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:118:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:118:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:118:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:118:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:118:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:118:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:125:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:125:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:125:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:125:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:125:18: warning: 'struct page' declared inside parameter list
	../include/trace/events/page_ref.h:125:18: warning: 'struct page' declared inside parameter list
	../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/trace_events.h:703:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Wincompatible-pointer-types]
	../include/trace/perf.h:83:35: warning: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Wincompatible-pointer-types]
	../mm/debug_page_ref.c:8:21: warning: passing argument 1 of 'trace_page_ref_set' from incompatible pointer type [-Wincompatible-pointer-types]
	../mm/debug_page_ref.c:15:21: warning: passing argument 1 of 'trace_page_ref_mod' from incompatible pointer type [-Wincompatible-pointer-types]
	../mm/debug_page_ref.c:22:30: warning: passing argument 1 of 'trace_page_ref_mod_and_test' from incompatible pointer type [-Wincompatible-pointer-types]
	../mm/debug_page_ref.c:29:32: warning: passing argument 1 of 'trace_page_ref_mod_and_return' from incompatible pointer type [-Wincompatible-pointer-types]
	../mm/debug_page_ref.c:36:28: warning: passing argument 1 of 'trace_page_ref_mod_unless' from incompatible pointer type [-Wincompatible-pointer-types]
	../mm/debug_page_ref.c:43:24: warning: passing argument 1 of 'trace_page_ref_freeze' from incompatible pointer type [-Wincompatible-pointer-types]
	../mm/debug_page_ref.c:50:26: warning: passing argument 1 of 'trace_page_ref_unfreeze' from incompatible pointer type [-Wincompatible-pointer-types]
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
arm64-defconfig : FAIL, 2 errors, 1 warnings, 0 section mismatches

Errors:
	../arch/arm64/mm/hugetlbpage.c:127:42: error: macro "pte_alloc_map" passed 4 arguments, but takes just 3
	../arch/arm64/mm/hugetlbpage.c:127:9: error: 'pte_alloc_map' undeclared (first use in this function)

Warnings:
	../arch/arm64/mm/hugetlbpage.c:117:10: warning: unused variable 'pmd' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
