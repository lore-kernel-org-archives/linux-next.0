From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Mon, 2 Feb 2009 20:02:54 +1100
Message-ID: <20090202200254.b89614d8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36451 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751502AbZBBJC6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2009 04:02:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>

Hi Dave, Ingo,

Today's linux-next build (sparc64 defconfig) failed like this:

arch/sparc/kernel/nmi.c: In function 'perfctr_irq':
arch/sparc/kernel/nmi.c:97: error: 'struct kernel_stat' has no member named 'irqs'

Probably caused by commit e5553a6d04421eec326a629571d696e8e745a0e4
("sparc64: Implement NMI watchdog on capable cpus") from the
sparc-current tree interacting with commit
d7e51e66899f95dabc89b4d4c6674a6e50fa37fc ("sparseirq: make some func to
be used with genirq") from the sparseirq tree.

I have temporarily applied the patch below.  I don't know if it is
correct (but it fixes the build).  If it is, it should be applicable to
the sparc-current tree as the needed interface exists in Linus' current
tree.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Feb 2009 20:00:15 +1100
Subject: [PATCH] sparc: fixup for sparseirq changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/kernel/nmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/sparc/kernel/nmi.c b/arch/sparc/kernel/nmi.c
index ffc6900..09f088e 100644
--- a/arch/sparc/kernel/nmi.c
+++ b/arch/sparc/kernel/nmi.c
@@ -94,7 +94,7 @@ notrace __kprobes void perfctr_irq(int irq, struct pt_regs *regs)
 		       pt_regs_trap_type(regs), SIGINT) == NOTIFY_STOP)
 		touched = 1;
 
-	sum = kstat_cpu(cpu).irqs[0];
+	sum = kstat_irqs_cpu(0, cpu);
 	if (__get_cpu_var(nmi_touch)) {
 		__get_cpu_var(nmi_touch) = 0;
 		touched = 1;
-- 
1.6.0.5
