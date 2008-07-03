From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: linux-next: zero based percpu build error on s390
Date: Thu, 3 Jul 2008 21:30:09 +0200
Message-ID: <20080703193009.GA8958@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate3.de.ibm.com ([195.212.29.152]:59958 "EHLO
	mtagate3.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753682AbYGCTab (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 15:30:31 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate3.de.ibm.com (8.13.8/8.13.8) with ESMTP id m63JUB98032070
	for <linux-next@vger.kernel.org>; Thu, 3 Jul 2008 19:30:11 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com [9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m63JUASp1773768
	for <linux-next@vger.kernel.org>; Thu, 3 Jul 2008 21:30:10 +0200
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m63JUAcQ003869
	for <linux-next@vger.kernel.org>; Thu, 3 Jul 2008 21:30:10 +0200
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

The patch:
"Zero based percpu: infrastructure to rebase the per cpu area to zero"

causes this build error on !CONFIG_SMP on linux-next / s390:

  CC      arch/s390/kernel/asm-offsets.s
In file included from include/asm/percpu.h:35,
                 from include/linux/percpu.h:9,
                 from include/linux/rcupdate.h:39,
                 from include/linux/pid.h:4,
                 from include/linux/sched.h:74,
                 from arch/s390/kernel/asm-offsets.c:7:
include/asm-generic/percpu.h:78:1: warning: "SHIFT_PERCPU_PTR" redefined
In file included from include/linux/percpu.h:9,
                 from include/linux/rcupdate.h:39,
                 from include/linux/pid.h:4,
                 from include/linux/sched.h:74,
                 from arch/s390/kernel/asm-offsets.c:7:
include/asm/percpu.h:25:1: warning: this is the location of the previous definition

Fix below. Please merge with original patch.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 include/asm-generic/percpu.h |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux-next/include/asm-generic/percpu.h
===================================================================
--- linux-next.orig/include/asm-generic/percpu.h
+++ linux-next/include/asm-generic/percpu.h
@@ -75,7 +75,9 @@ extern void setup_per_cpu_areas(void);
 #define per_cpu(var, cpu)			(*((void)(cpu), &per_cpu_var(var)))
 #define __get_cpu_var(var)			per_cpu_var(var)
 #define __raw_get_cpu_var(var)			per_cpu_var(var)
-#define SHIFT_PERCPU_PTR(__p, __offset)		(__p)
+#ifndef SHIFT_PERCPU_PTR
+# define SHIFT_PERCPU_PTR(__p, __offset)		(__p)
+#endif
 #define per_cpu_offset(x)			0L
 
 #endif	/* SMP */
