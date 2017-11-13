From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171113 build: 2 failures 12 warnings (next-20171113)
Date: Mon, 13 Nov 2017 09:46:49 +0000
Message-ID: <E1eEBKL-0002xy-2s@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:39898 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751190AbdKMJqv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2017 04:46:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171113
Git describe: next-20171113
Commit: c348a99ee5 Add linux-next specific files for 20171113

Build Time: 100 min 47 sec

Passed:    8 / 10   ( 80.00 %)
Failed:    2 / 10   ( 20.00 %)

Errors: 0
Warnings: 12
Section Mismatches: 0

Failed defconfigs:

Errors:

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : arm64-allnoconfig
     10 warnings    0 mismatches  : arm64-allmodconfig
      8 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 12
	  2 ../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	  2 ../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	  2 ../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	  1 ../include/linux/irqchip/arm-gic-v4.h:112:57: warning: its scope is only this definition or declaration, which is probably not what you want
	  1 ../include/linux/irqchip/arm-gic-v4.h:112:57: warning: 'struct irq_domain_ops' declared inside parameter list



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/linux/irqchip/arm-gic-v4.h:112:57: warning: 'struct irq_domain_ops' declared inside parameter list
	../include/linux/irqchip/arm-gic-v4.h:112:57: warning: its scope is only this definition or declaration, which is probably not what you want

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
	../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
	../include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
