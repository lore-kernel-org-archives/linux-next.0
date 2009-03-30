From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Mon, 30 Mar 2009 11:55:41 +1100
Message-ID: <20090330115541.eb051c80.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47970 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753631AbZC3Azs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 29 Mar 2009 20:55:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/kernel/cpu/cpufreq/p4-clockmod.c: In function 'cpufreq_p4_cpu_init':
arch/x86/kernel/cpu/cpufreq/p4-clockmod.c:232: error: implicit declaration of function 'recalibrate_cpu_khz'

Caused by a mismerge or arch/x86/include/asm/timer.h in
6e15cf04860074ad032e88c306bea656bbdd0f22 ("Merge branch 'core/percpu'
into percpu-cpumask-x86-for-linus-2") which then propogated back into
Linus' tree.

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Mar 2009 11:10:27 +1100
Subject: [PATCH] x86: fix mismerge in arch/x86/include/asm/timer.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/include/asm/timer.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index a81195e..bd37ed4 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -12,9 +12,9 @@ unsigned long native_calibrate_tsc(void);
 
 #ifdef CONFIG_X86_32
 extern int timer_ack;
-extern int recalibrate_cpu_khz(void);
 extern irqreturn_t timer_interrupt(int irq, void *dev_id);
 #endif /* CONFIG_X86_32 */
+extern int recalibrate_cpu_khz(void);
 
 extern int no_timer_check;
 
-- 
1.6.2.1
