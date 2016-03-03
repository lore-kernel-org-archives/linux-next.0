From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20160303 build: 2 failures 18 warnings (next-20160303)
Date: Thu, 03 Mar 2016 08:53:53 +0000
Message-ID: <E1abP17-0002pw-3c@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56504 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756681AbcCCIyD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2016 03:54:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20160303
Git describe: next-20160303
Commit: 2c925d4309 Add linux-next specific files for 20160303

Build Time: 76 min 30 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 22
Warnings: 18
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

	arm64-allmodconfig
../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
../mm/debug_page_ref.c:8:21: error: passing argument 1 of 'trace_page_ref_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
../mm/debug_page_ref.c:15:21: error: passing argument 1 of 'trace_page_ref_mod' from incompatible pointer type [-Werror=incompatible-pointer-types]
../mm/debug_page_ref.c:22:30: error: passing argument 1 of 'trace_page_ref_mod_and_test' from incompatible pointer type [-Werror=incompatible-pointer-types]
../mm/debug_page_ref.c:29:32: error: passing argument 1 of 'trace_page_ref_mod_and_return' from incompatible pointer type [-Werror=incompatible-pointer-types]
../mm/debug_page_ref.c:36:28: error: passing argument 1 of 'trace_page_ref_mod_unless' from incompatible pointer type [-Werror=incompatible-pointer-types]
../mm/debug_page_ref.c:43:24: error: passing argument 1 of 'trace_page_ref_freeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
../mm/debug_page_ref.c:50:26: error: passing argument 1 of 'trace_page_ref_unfreeze' from incompatible pointer type [-Werror=incompatible-pointer-types]

	arm-allmodconfig
../include/asm-generic/div64.h:224:22: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
     48 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      9 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Errors summary: 22
	  1 ../mm/debug_page_ref.c:8:21: error: passing argument 1 of 'trace_page_ref_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:50:26: error: passing argument 1 of 'trace_page_ref_unfreeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:43:24: error: passing argument 1 of 'trace_page_ref_freeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:36:28: error: passing argument 1 of 'trace_page_ref_mod_unless' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:29:32: error: passing argument 1 of 'trace_page_ref_mod_and_return' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:22:30: error: passing argument 1 of 'trace_page_ref_mod_and_test' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../mm/debug_page_ref.c:15:21: error: passing argument 1 of 'trace_page_ref_mod' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../include/asm-generic/div64.h:224:22: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 18
	  6 <stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	  6 ../include/trace/events/page_ref.h:97:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:54:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:47:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:125:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:118:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:111:18: warning: 'struct page' declared inside parameter list
	  6 ../include/trace/events/page_ref.h:104:18: warning: 'struct page' declared inside parameter list
	  4 ../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	  2 ../drivers/platform/goldfish/goldfish_pipe.c:312:3: warning: 'get_user_pages8' is deprecated [-Wdeprecated-declarations]
	  1 ../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../include/trace/events/page_ref.h:47:18: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	  1 ../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	  1 ../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	  1 ../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 21 errors, 48 warnings, 0 section mismatches

Errors:
	../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/trace_events.h:703:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_test' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_and_return' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_mod_unless' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_freeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../mm/debug_page_ref.c:8:21: error: passing argument 1 of 'trace_page_ref_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../mm/debug_page_ref.c:15:21: error: passing argument 1 of 'trace_page_ref_mod' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../mm/debug_page_ref.c:22:30: error: passing argument 1 of 'trace_page_ref_mod_and_test' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../mm/debug_page_ref.c:29:32: error: passing argument 1 of 'trace_page_ref_mod_and_return' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../mm/debug_page_ref.c:36:28: error: passing argument 1 of 'trace_page_ref_mod_unless' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../mm/debug_page_ref.c:43:24: error: passing argument 1 of 'trace_page_ref_freeze' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../mm/debug_page_ref.c:50:26: error: passing argument 1 of 'trace_page_ref_unfreeze' from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
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
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
	../drivers/platform/goldfish/goldfish_pipe.c:312:3: warning: 'get_user_pages8' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 9 warnings, 0 section mismatches

Errors:
	../include/asm-generic/div64.h:224:22: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
	../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/platform/goldfish/goldfish_pipe.c:312:3: warning: 'get_user_pages8' is deprecated [-Wdeprecated-declarations]
	../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
x86_64-defconfig
arm64-defconfig
