From: Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH percpu/for-3.18-consistent-ops] Revert "powerpc: Replace
 __get_cpu_var uses"
Date: Wed, 27 Aug 2014 16:54:55 -0500 (CDT)
Message-ID: <alpine.DEB.2.11.1408271653510.20761@gentwo.org>
References: <20140827142243.6277eaff@canb.auug.org.au> <20140827152609.GA379@htj.dyndns.org> <20140828074349.10e86372@canb.auug.org.au> <20140827214946.GA21396@mtj.dyndns.org>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140827214946.GA21396@mtj.dyndns.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: linux-next.vger.kernel.org

On Wed, 27 Aug 2014, Tejun Heo wrote:

> Weird, the build-bot reported success on all powerpc configs on the
> percpu branches w/o the revert.  I wonder what's going on.

I think this will fix it but I have no way of verifying it.


Subject: Define __ARCH_SET_SOFTIRQ_PENDING to avoid duplicate defs

Signed-off-by: Christoph Lameter <cl@linux.com>

Index: linux/arch/powerpc/include/asm/hardirq.h
===================================================================
--- linux.orig/arch/powerpc/include/asm/hardirq.h
+++ linux/arch/powerpc/include/asm/hardirq.h
@@ -20,6 +20,7 @@ typedef struct {
 DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);

 #define __ARCH_IRQ_STAT
+#define __ARCH_SET_SOFTIRQ_PENDING

 #define local_softirq_pending()	__this_cpu_read(irq_stat.__softirq_pending)
 #define set_softirq_pending(x) __this_cpu_write(irq_stat._softirq_pending, (x))
