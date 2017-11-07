From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171107 build: 2 failures 11 warnings (next-20171107)
Date: Tue, 07 Nov 2017 08:53:50 +0000
Message-ID: <E1eBzdm-00035J-RW@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52850 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753113AbdKGIxx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Nov 2017 03:53:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171107
Git describe: next-20171107
Commit: 8b82a8a7ab Add linux-next specific files for 20171107

Build Time: 100 min 8 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 0
Warnings: 11
Section Mismatches: 0

Failed defconfigs:

Errors:

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      9 warnings    0 mismatches  : arm64-allmodconfig
     11 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 11
	  2 ../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]
	  1 ../arch/arm/probes/kprobes/test-core.c:398:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  1 ../arch/arm/probes/kprobes/test-core.c:390:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 11 warnings, 0 section mismatches

Warnings:
	../arch/arm/probes/kprobes/test-core.c:390:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../arch/arm/probes/kprobes/test-core.c:398:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
