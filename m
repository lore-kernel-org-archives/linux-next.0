From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tip-core tree build wanings
Date: Fri, 12 Sep 2008 15:07:53 +1000
Message-ID: <20080912150753.1ce5002c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44629 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751126AbYILFIB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 01:08:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

Hi all,

Today's linux-next build (powerpc_ppc64_defconfig) produced lots of
warnings like this:

In file included from arch/powerpc/platforms/powermac/smp.c:24:
include/linux/kernel.h:498:1: warning: "BUILD_BUG_ON" redefined
In file included from include/linux/linkage.h:4,
                 from include/linux/kernel.h:11,
                 from arch/powerpc/platforms/powermac/smp.c:24:
include/linux/compiler.h:209:1: warning: this is the location of the previous definition

Introduced by commit 3cff9a338bd3ace9cfb501e08aeb69913b47c53d ("manual
merge of core/debug") which recreated the definition of the BUILD_BUG_ON
macro in kernel.h.

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 12 Sep 2008 15:04:37 +1000
Subject: [PATCH] tip-core: fix for mismerge of kernel.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/kernel.h |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 0af82d5..74605be 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -494,18 +494,6 @@ struct sysinfo {
 	char _f[20-2*sizeof(long)-sizeof(int)];	/* Padding: libc5 uses this.. */
 };
 
-/* Force a compilation error if condition is true */
-#define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
-
-/* Force a compilation error if condition is true, but also produce a
-   result (of value 0 and type size_t), so the expression can be used
-   e.g. in a structure initializer (or where-ever else comma expressions
-   aren't permitted). */
-#define BUILD_BUG_ON_ZERO(e) (sizeof(char[1 - 2 * !!(e)]) - 1)
-
-/* Trap pasters of __FUNCTION__ at compile-time */
-#define __FUNCTION__ (__func__)
-
 /* This helps us to avoid #ifdef CONFIG_NUMA */
 #ifdef CONFIG_NUMA
 #define NUMA_BUILD 1
-- 
1.5.6.3
