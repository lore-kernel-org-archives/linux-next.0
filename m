From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH linux-next] Add module.h include to stacktrace.c.
Date: Fri, 11 Jul 2008 12:39:25 +0200
Message-ID: <20080711103925.GA20589@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.de.ibm.com ([195.212.29.154]:60355 "EHLO
	mtagate5.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753118AbYGKKlD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2008 06:41:03 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate5.de.ibm.com (8.13.8/8.13.8) with ESMTP id m6BAdQj5062746
	for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 10:39:26 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m6BAdQEw3813460
	for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 12:39:26 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m6BAdQgI002902
	for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 12:39:26 +0200
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

From: Heiko Carstens <heiko.carstens@de.ibm.com>

Fixes this:

  CC      arch/s390/kernel/stacktrace.o
arch/s390/kernel/stacktrace.c:84: warning: data definition has no type or storage class
arch/s390/kernel/stacktrace.c:84: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
arch/s390/kernel/stacktrace.c:84: warning: parameter names (without types) in function declaration
arch/s390/kernel/stacktrace.c:97: warning: data definition has no type or storage class
arch/s390/kernel/stacktrace.c:97: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
arch/s390/kernel/stacktrace.c:97: warning: parameter names (without types) in function declaration

caused by "stacktrace: export save_stack_trace[_tsk]"

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---

Ingo, the patch which causes this came in via one of your trees.
Please merge/apply. Thanks.

 arch/avr32/kernel/stacktrace.c   |    1 +
 arch/mips/kernel/stacktrace.c    |    1 +
 arch/powerpc/kernel/stacktrace.c |    1 +
 arch/s390/kernel/stacktrace.c    |    1 +
 arch/sh/kernel/stacktrace.c      |    1 +
 5 files changed, 5 insertions(+)

Index: linux-next/arch/s390/kernel/stacktrace.c
===================================================================
--- linux-next.orig/arch/s390/kernel/stacktrace.c
+++ linux-next/arch/s390/kernel/stacktrace.c
@@ -10,6 +10,7 @@
 #include <linux/sched.h>
 #include <linux/stacktrace.h>
 #include <linux/kallsyms.h>
+#include <linux/module.h>
 
 static unsigned long save_context_stack(struct stack_trace *trace,
 					unsigned long sp,
Index: linux-next/arch/avr32/kernel/stacktrace.c
===================================================================
--- linux-next.orig/arch/avr32/kernel/stacktrace.c
+++ linux-next/arch/avr32/kernel/stacktrace.c
@@ -10,6 +10,7 @@
 #include <linux/sched.h>
 #include <linux/stacktrace.h>
 #include <linux/thread_info.h>
+#include <linux/module.h>
 
 register unsigned long current_frame_pointer asm("r7");
 
Index: linux-next/arch/mips/kernel/stacktrace.c
===================================================================
--- linux-next.orig/arch/mips/kernel/stacktrace.c
+++ linux-next/arch/mips/kernel/stacktrace.c
@@ -7,6 +7,7 @@
  */
 #include <linux/sched.h>
 #include <linux/stacktrace.h>
+#include <linux/module.h
 #include <asm/stacktrace.h>
 
 /*
Index: linux-next/arch/powerpc/kernel/stacktrace.c
===================================================================
--- linux-next.orig/arch/powerpc/kernel/stacktrace.c
+++ linux-next/arch/powerpc/kernel/stacktrace.c
@@ -12,6 +12,7 @@
 
 #include <linux/sched.h>
 #include <linux/stacktrace.h>
+#include <linux/module.h>
 #include <asm/ptrace.h>
 
 /*
Index: linux-next/arch/sh/kernel/stacktrace.c
===================================================================
--- linux-next.orig/arch/sh/kernel/stacktrace.c
+++ linux-next/arch/sh/kernel/stacktrace.c
@@ -12,6 +12,7 @@
 #include <linux/sched.h>
 #include <linux/stacktrace.h>
 #include <linux/thread_info.h>
+#include <linux/module.h>
 #include <asm/ptrace.h>
 
 /*
