From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [BUG -next] "futex: switch to USER_DS for futex test" breaks s390
Date: Fri, 3 Jan 2014 15:19:43 +0100
Message-ID: <20140103141943.GA4219@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:51048 "EHLO
	e06smtp13.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751085AbaACOTv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jan 2014 09:19:51 -0500
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Fri, 3 Jan 2014 14:19:49 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1E9641B08061
	for <linux-next@vger.kernel.org>; Fri,  3 Jan 2014 14:19:04 +0000 (GMT)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com [9.149.37.212])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id s03EJZ6G2294240
	for <linux-next@vger.kernel.org>; Fri, 3 Jan 2014 14:19:35 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id s03EJhIJ022382
	for <linux-next@vger.kernel.org>; Fri, 3 Jan 2014 07:19:47 -0700
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Tuxist <tuxist@tuxist.de>, Patrick McCarthy <patrickjmc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Finn Thain <fthain@telegraphics.com.au>, Rusty Russell <rusty@rustcorp.com.au>, Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@linux.intel.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org

Hi Geert,

your patch "futex: switch to USER_DS for futex test" in linux-next now causes
s390 to die on boot. As reference your patch:

    futex: switch to USER_DS for futex test
    
    Since e4f2dfbb5e92b ("m68k: implement futex.h to support userspace robust
    futexes and PI mutexes"), the kernel crashes during boot up on MC68030:
    
    Data read fault at 0x00000000 in Super Data (pc=0x3afec)
    BAD KERNEL BUSERR

[...]

     [<000020ac>] do_one_initcall+0xa4/0x144
     [<00001000>] kernel_pg_dir+0x0/0x1000
     [<00002008>] do_one_initcall+0x0/0x144
     [<002b3a56>] kernel_init_freeable+0xca/0x152
     [<002b8ca4>] futex_init+0x0/0x54
     [<001e316a>] kernel_init+0x0/0xc8
     [<001e3172>] kernel_init+0x8/0xc8
     [<001e316a>] kernel_init+0x0/0xc8
     [<000025d4>] ret_from_kernel_thread+0xc/0x14
    
    This happens because the futex test in futex_init() lacks a switch to the
    USER_DS address space, while cmpxchg_futex_value_locked() and
    futex_atomic_cmpxchg_inatomic() operate on userspace pointers (albeit NULL
    for this particular test).
    
    Fix this by switching to USER_DS before running the test, and restoring
    the old address space afterwards.

diff --git a/kernel/futex.c b/kernel/futex.c
index f6ff0191ecf7..66d23727c6ab 100644
--- a/kernel/futex.c
+++ b/kernel/futex.c
@@ -63,6 +63,7 @@
 #include <linux/sched/rt.h>
 #include <linux/hugetlb.h>
 #include <linux/freezer.h>
+#include <linux/uaccess.h>
 
 #include <asm/futex.h>
 
@@ -2733,6 +2734,7 @@ SYSCALL_DEFINE6(futex, u32 __user *, uaddr, int, op, u32, val,
 
 static int __init futex_init(void)
 {
+	mm_segment_t fs;
	u32 curval;
	int i;
 
@@ -2746,8 +2748,11 @@ static int __init futex_init(void)
	 * implementation, the non-functional ones will return
	 * -ENOSYS.
	 */
+	fs = get_fs();
+	set_fs(USER_DS);
	if (cmpxchg_futex_value_locked(&curval, NULL, 0, 0) == -EFAULT)
		futex_cmpxchg_enabled = 1;
+	set_fs(fs);
 
	for (i = 0; i < ARRAY_SIZE(futex_queues); i++) {
		plist_head_init(&futex_queues[i].chain);

Now, this seems to be wrong. It was intended to cause a fault while in kernel
space. When accessing user space current->mm must not be NULL, but it is, since
this is early code and we have no user space context to operate with.

Hence at least s390's page tables aren't setup yet to handle this correctly.
Actually our code dies when walking page tables and trying to acquire current's
mm->page_table_lock, which points to nowhere.

I'm wondering why m68k's exception handling for put/get_user doesn't fixup
the instruction pointers and these functions simply return -EFAULT?

Also m68k's futex_atomic_cmpxchg_inatomic() implementation seems to miss a
page_fault_disable()/page_fault_enable() pair.

Since this is already the second or third time this specific futex code causes
problems on s390, it would be nice if we could get rid of it. E.g. with the
following patch:

>From d3b5585ebc302a7b94edff7267f9ec7f63b57141 Mon Sep 17 00:00:00 2001
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Fri, 3 Jan 2014 14:16:19 +0100
Subject: [PATCH] futex: allow architectures to skip
 futex_atomic_cmpxchg_inatomic() test

If an architecture has futex_atomic_cmpxchg_inatomic() implemented and there
is no runtume check necessary if it is working allow to skip the test within
futex_init().
This allows to get rid of some code which would always give the same result.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 arch/s390/Kconfig     |  1 +
 include/linux/futex.h |  4 ++++
 init/Kconfig          |  6 ++++++
 kernel/futex.c        | 14 ++++++++++++--
 4 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 1e1a03d2d19f..e00a76224537 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -117,6 +117,7 @@ config S390
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_TRACE_MCOUNT_TEST
+	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZ4
diff --git a/include/linux/futex.h b/include/linux/futex.h
index b0d95cac826e..6435f46d6e13 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -55,7 +55,11 @@ union futex_key {
 #ifdef CONFIG_FUTEX
 extern void exit_robust_list(struct task_struct *curr);
 extern void exit_pi_state_list(struct task_struct *curr);
+#ifdef CONFIG_HAVE_FUTEX_CMPXCHG
+#define futex_cmpxchg_enabled 1
+#else
 extern int futex_cmpxchg_enabled;
+#endif
 #else
 static inline void exit_robust_list(struct task_struct *curr)
 {
diff --git a/init/Kconfig b/init/Kconfig
index 8d402e33b7fc..5699a638e1ca 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1398,6 +1398,12 @@ config FUTEX
 	  support for "fast userspace mutexes".  The resulting kernel may not
 	  run glibc-based applications correctly.
 
+config HAVE_FUTEX_CMPXCHG
+	bool
+	help
+	  Architectures should select this if futex_atomic_cmpxchg_inatomic()
+	  is implemented and always working.
+
 config EPOLL
 	bool "Enable eventpoll support" if EXPERT
 	default y
diff --git a/kernel/futex.c b/kernel/futex.c
index 66d23727c6ab..7c7dfb233515 100644
--- a/kernel/futex.c
+++ b/kernel/futex.c
@@ -69,7 +69,9 @@
 
 #include "locking/rtmutex_common.h"
 
+#ifndef CONFIG_HAVE_FUTEX_CMPXCHG
 int __read_mostly futex_cmpxchg_enabled;
+#endif
 
 #define FUTEX_HASHBITS (CONFIG_BASE_SMALL ? 4 : 8)
 
@@ -2732,11 +2734,11 @@ SYSCALL_DEFINE6(futex, u32 __user *, uaddr, int, op, u32, val,
 	return do_futex(uaddr, op, val, tp, uaddr2, val2, val3);
 }
 
-static int __init futex_init(void)
+static void __init futex_detect_cmpxchg(void)
 {
+#ifndef CONFIG_HAVE_FUTEX_CMPXCHG
 	mm_segment_t fs;
 	u32 curval;
-	int i;
 
 	/*
 	 * This will fail and we want it. Some arch implementations do
@@ -2753,6 +2755,14 @@ static int __init futex_init(void)
 	if (cmpxchg_futex_value_locked(&curval, NULL, 0, 0) == -EFAULT)
 		futex_cmpxchg_enabled = 1;
 	set_fs(fs);
+#endif /* CONFIG_HAVE_FUTEX_CMPXCHG */
+}
+
+static int __init futex_init(void)
+{
+	int i;
+
+	futex_detect_cmpxchg();
 
 	for (i = 0; i < ARRAY_SIZE(futex_queues); i++) {
 		plist_head_init(&futex_queues[i].chain);
-- 
1.8.4.5
