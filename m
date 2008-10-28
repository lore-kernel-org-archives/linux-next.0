From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tree build warning
Date: Tue, 28 Oct 2008 18:13:40 +1100
Message-ID: <20081028181340.daec73cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58204 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751548AbYJ1HNq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 03:13:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Andrew Morton <akpm@linux-foundation.org>

Hi Christoph,

Today's linux-next build (powerpc ppc44x_config) produced many warnings like
this:

In file included from include/linux/rcupdate.h:39,
                 from include/linux/sem.h:81,
                 from include/linux/sched.h:69,
                 from arch/powerpc/include/asm/elf.h:5,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/mtd/chips/chipreg.c:7:
include/linux/percpu.h:177:1: warning: "per_cpu_offset" redefined
include/asm-generic/percpu.h:81:1: warning: this is the location of the previous definition

Probably caused by commit 66f2d2c531e755656a5481fb92a9d137404d9f44
("cpualloc: the allocator") from the cpu_alloc tree which adds the
definition to linux/percpu.h in the non-CONFIG_SMP case.

I applied the following patch (which may not be correct but made the
warnings go away).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 28 Oct 2008 17:56:26 +1100
Subject: [PATCH] cpu_alloc: per_cpu_offset is already defined for !CONFIG_SMP

in asm-generic/percpu.h which is included by asm/percpu.h on all
architectures except alpha.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/alpha/include/asm/percpu.h |    1 +
 include/linux/percpu.h          |    1 -
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/include/asm/percpu.h b/arch/alpha/include/asm/percpu.h
index 3495e8e..4d0f7f3 100644
--- a/arch/alpha/include/asm/percpu.h
+++ b/arch/alpha/include/asm/percpu.h
@@ -68,6 +68,7 @@ extern unsigned long __per_cpu_offset[NR_CPUS];
 #define per_cpu(var, cpu)		(*((void)(cpu), &per_cpu_var(var)))
 #define __get_cpu_var(var)		per_cpu_var(var)
 #define __raw_get_cpu_var(var)		per_cpu_var(var)
+#define per_cpu_offset(x) 0
 
 #define PER_CPU_ATTRIBUTES
 
diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index dd6693f..2eab4d5 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -174,7 +174,6 @@ static inline void cpu_free(void *cpu_pointer, unsigned long size)
 }
 
 #define SHIFT_PERCPU_PTR(__p, __offset)	(__p)
-#define per_cpu_offset(x) 0
 #endif
 
 /* Return a pointer to the instance of a object for a particular processor */
-- 
1.5.6.5
