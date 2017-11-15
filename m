From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171115 build: 1 failures 5 warnings (next-20171115)
Date: Wed, 15 Nov 2017 09:29:00 +0000
Message-ID: <E1eEu0C-0002LU-9a@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42662 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757052AbdKOJ3D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Nov 2017 04:29:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171115
Git describe: next-20171115
Commit: 63fb091c80 Add linux-next specific files for 20171115

Build Time: 100 min 33 sec

Passed:    9 / 10   ( 90.00 %)
Failed:    1 / 10   ( 10.00 %)

Errors: 1
Warnings: 5
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_ldivmod" [net/sched/sch_netem.ko] undefined!

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
      6 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : x86_64-defconfig
      1 warnings    0 mismatches  : arm-allmodconfig
      6 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 ERROR: "__aeabi_ldivmod" [net/sched/sch_netem.ko] undefined!

Warnings Summary: 5
	  5 <stdin>:1335:2: warning: #warning syscall cpu_opv not implemented [-Wcpp]
	  5 <stdin>:1332:2: warning: #warning syscall rseq not implemented [-Wcpp]
	  3 ../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	  3 ../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	  1 ../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	<stdin>:1332:2: warning: #warning syscall rseq not implemented [-Wcpp]
	<stdin>:1335:2: warning: #warning syscall cpu_opv not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1332:2: warning: #warning syscall rseq not implemented [-Wcpp]
	<stdin>:1335:2: warning: #warning syscall cpu_opv not implemented [-Wcpp]
	../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	<stdin>:1332:2: warning: #warning syscall rseq not implemented [-Wcpp]
	<stdin>:1335:2: warning: #warning syscall cpu_opv not implemented [-Wcpp]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 1 errors, 1 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_ldivmod" [net/sched/sch_netem.ko] undefined!

Warnings:
	../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	<stdin>:1332:2: warning: #warning syscall rseq not implemented [-Wcpp]
	<stdin>:1335:2: warning: #warning syscall cpu_opv not implemented [-Wcpp]
	../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	<stdin>:1332:2: warning: #warning syscall rseq not implemented [-Wcpp]
	<stdin>:1335:2: warning: #warning syscall cpu_opv not implemented [-Wcpp]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm-multi_v7_defconfig
arm-allnoconfig
arm-multi_v4t_defconfig
arm-multi_v5_defconfig
