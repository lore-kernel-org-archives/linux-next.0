From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Thu, 23 Oct 2008 20:51:51 +1100
Message-ID: <20081023205151.33eda8ad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33270 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754118AbYJWJwT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 05:52:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

Hi Rusty,

Today's linux-next build (sparc defconfig) failed like this:

In file included from arch/sparc/include/asm/smp_32.h:15,
                 from arch/sparc/include/asm/smp.h:6,
                 from arch/sparc/include/asm/system_32.h:12,
                 from arch/sparc/include/asm/system.h:6,
                 from include/linux/list.h:7,
                 from include/linux/preempt.h:11,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:57,
                 from include/linux/sched.h:54,
                 from arch/sparc/kernel/asm-offsets.c:13:
include/linux/cpumask.h:110: error: `CONFIG_NR_CPUS' undeclared here (not in a function)

and it went on ...

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 23 Oct 2008 20:48:36 +1100
Subject: [PATCH] sparc: fallout from cpumask CONFIG_NR_CPUS changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 6b4970e..7b1a000 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -66,7 +66,7 @@ config SMP
 config NR_CPUS
 	int "Maximum number of CPUs (2-32)" if SMP
 	range 2 32 if SMP
-	default "1" if SMP
+	default "1" if !SMP
 	default "32" if SMP
 
 config SPARC
-- 
1.5.6.5
