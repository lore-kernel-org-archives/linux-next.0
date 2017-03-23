From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170323 build: 2 failures 4 warnings (next-20170323)
Date: Thu, 23 Mar 2017 07:56:49 +0000
Message-ID: <E1cqxc1-0004Cs-Lx@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37162 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751252AbdCWH45 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Mar 2017 03:56:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170323
Git describe: next-20170323
Commit: 6ec9c2f129 Add linux-next specific files for 20170323

Build Time: 93 min 20 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 3
Warnings: 4
Section Mismatches: 0

Failed defconfigs:
	arm64-allmodconfig
	arm64-defconfig

Errors:

	arm64-allmodconfig
ERROR (phandle_references): Reference to non-existent node or label "pwm_f_clk_pins"
ERROR (phandle_references): Reference to non-existent node or label "pwm_ao_a_3_pins"
ERROR: Input tree has errors, aborting (use -f to force output)
ERROR (phandle_references): Reference to non-existent node or label "pwm_f_clk_pins"
ERROR (phandle_references): Reference to non-existent node or label "pwm_ao_a_3_pins"
ERROR: Input tree has errors, aborting (use -f to force output)

	arm64-defconfig
ERROR (phandle_references): Reference to non-existent node or label "pwm_f_clk_pins"
ERROR (phandle_references): Reference to non-existent node or label "pwm_ao_a_3_pins"
ERROR: Input tree has errors, aborting (use -f to force output)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
      5 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      4 warnings    0 mismatches  : arm-allmodconfig
      1 warnings    0 mismatches  : arm-allnoconfig
      1 warnings    0 mismatches  : arm-multi_v4t_defconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 3
	  3 ERROR: Input tree has errors, aborting (use -f to force output)
	  3 ERROR (phandle_references): Reference to non-existent node or label "pwm_f_clk_pins"
	  3 ERROR (phandle_references): Reference to non-existent node or label "pwm_ao_a_3_pins"

Warnings Summary: 4
	 11 <stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	  4 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	  3 <stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	  1 ../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 6 errors, 5 warnings, 0 section mismatches

Errors:
	ERROR (phandle_references): Reference to non-existent node or label "pwm_f_clk_pins"
	ERROR (phandle_references): Reference to non-existent node or label "pwm_ao_a_3_pins"
	ERROR: Input tree has errors, aborting (use -f to force output)
	ERROR (phandle_references): Reference to non-existent node or label "pwm_f_clk_pins"
	ERROR (phandle_references): Reference to non-existent node or label "pwm_ao_a_3_pins"
	ERROR: Input tree has errors, aborting (use -f to force output)

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	../drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 3 errors, 2 warnings, 0 section mismatches

Errors:
	ERROR (phandle_references): Reference to non-existent node or label "pwm_f_clk_pins"
	ERROR (phandle_references): Reference to non-existent node or label "pwm_ao_a_3_pins"
	ERROR: Input tree has errors, aborting (use -f to force output)

Warnings:
	<stdin>:1325:2: warning: #warning syscall statx not implemented [-Wcpp]
	<stdin>:1328:2: warning: #warning syscall arch_prctl not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
