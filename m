From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with Linus' tree
Date: Mon, 18 Jan 2010 15:06:03 +1100
Message-ID: <20100118150603.7bfde023.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54683 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753212Ab0AREGE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jan 2010 23:06:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roland Dreier <rdreier@cisco.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
include/linux/kernel.h between commit
cc8ef6eb21e964b1c5eb97b2d0e8ac9893e1bf86 ("kernel.h: add
BUILD_BUG_ON_NOT_POWER_OF_2()") from Linus' tree and commit
eb586ef779665b558aeafa9b948c0b005c5caadf
("misc:move-BUILD_BUG-et-al-inside-__KERNEL__") from the rr tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/kernel.h
index 328bca6,57ffaa0..0000000
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@@ -702,13 -702,59 +702,63 @@@ static inline void ftrace_dump(void) { 
  struct sysinfo;
  extern int do_sysinfo(struct sysinfo *info);
  
- #endif /* __KERNEL__ */
+ /* Force a compilation error if condition is true, but also produce a
+    result (of value 0 and type size_t), so the expression can be used
+    e.g. in a structure initializer (or where-ever else comma expressions
+    aren't permitted). */
+ #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
+ #define BUILD_BUG_ON_NULL(e) ((void *)sizeof(struct { int:-!!(e); }))
+ 
+ /**
+  * BUILD_BUG_ON - break compile if a condition is true.
+  * @cond: the condition which the compiler should know is false.
+  *
+  * If you have some code which relies on certain constants being equal, or
+  * other compile-time-evaluated condition, you should use BUILD_BUG_ON to
+  * detect if someone changes it.
+  *
+  * The implementation uses gcc's reluctance to create a negative array, but
+  * gcc (as of 4.4) only emits that error for obvious cases (eg. not arguments
+  * to inline functions).  So as a fallback we use the optimizer; if it can't
+  * prove the condition is false, it will cause a link error on the undefined
+  * "__build_bug_on_failed".  This error message can be harder to track down
+  * though, hence the two different methods.
+  */
+ #ifndef __OPTIMIZE__
+ #define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
+ #else
+ extern int __build_bug_on_failed;
+ #define BUILD_BUG_ON(condition)					\
+ 	do {							\
+ 		((void)sizeof(char[1 - 2*!!(condition)]));	\
+ 		if (condition) __build_bug_on_failed = 1;	\
+ 	} while(0)
+ #endif
+ 
++/* Force a compilation error if a constant expression is not a power of 2 */
++#define BUILD_BUG_ON_NOT_POWER_OF_2(n)			\
++	BUILD_BUG_ON((n) == 0 || (((n) & ((n) - 1)) != 0))
++
+ /* Trap pasters of __FUNCTION__ at compile-time */
+ #define __FUNCTION__ (__func__)
+ 
+ /* This helps us to avoid #ifdef CONFIG_NUMA */
+ #ifdef CONFIG_NUMA
+ #define NUMA_BUILD 1
+ #else
+ #define NUMA_BUILD 0
+ #endif
+ 
+ /* Rebuild everything on CONFIG_FTRACE_MCOUNT_RECORD */
+ #ifdef CONFIG_FTRACE_MCOUNT_RECORD
+ # define REBUILD_DUE_TO_FTRACE_MCOUNT_RECORD
+ #endif
  
+ #else /* __KERNEL__ */
  #ifndef __EXPORTED_HEADERS__
- #ifndef __KERNEL__
  #warning Attempt to use kernel headers from user space, see http://kernelnewbies.org/KernelHeaders
- #endif /* __KERNEL__ */
  #endif /* __EXPORTED_HEADERS__ */
+ #endif /* !__KERNEL__ */
  
  #define SI_LOAD_SHIFT	16
  struct sysinfo {
