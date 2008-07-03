From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: linux-next: generic helpers for arch IPI function calls build bug
	/ s390
Date: Thu, 3 Jul 2008 21:37:50 +0200
Message-ID: <20080703193750.GB8958@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate8.uk.ibm.com ([195.212.29.141]:4490 "EHLO
	mtagate8.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753804AbYGCTjf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 15:39:35 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate8.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m63JbpCD285778
	for <linux-next@vger.kernel.org>; Thu, 3 Jul 2008 19:37:51 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com [9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m63JbpRJ1405170
	for <linux-next@vger.kernel.org>; Thu, 3 Jul 2008 20:37:51 +0100
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m63Jbpbx008716
	for <linux-next@vger.kernel.org>; Thu, 3 Jul 2008 20:37:51 +0100
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org

Jens,

you forgot to remove #include <linux/spinlock.h> from linux/smp.h while
fixing the original s390 build bug.

Patch below fixes this build bug caused by header inclusion dependencies:

  CC      kernel/timer.o
In file included from include/linux/spinlock.h:87,
                 from include/linux/smp.h:11,
                 from include/linux/kernel_stat.h:4,
                 from kernel/timer.c:22:
include/asm/spinlock.h: In function '__raw_spin_lock':
include/asm/spinlock.h:69: error: implicit declaration of function 'smp_processor_id'

Please merge the patch below with

"Add generic helpers for arch IPI function calls"

Thanks.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 include/linux/smp.h |    1 -
 1 file changed, 1 deletion(-)

Index: linux-next/include/linux/smp.h
===================================================================
--- linux-next.orig/include/linux/smp.h
+++ linux-next/include/linux/smp.h
@@ -8,7 +8,6 @@
 
 #include <linux/errno.h>
 #include <linux/list.h>
-#include <linux/spinlock.h>
 #include <linux/cpumask.h>
 
 extern void cpu_idle(void);
