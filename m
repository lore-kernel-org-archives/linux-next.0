From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: User Mode Linux broken
Date: Fri, 22 Oct 2010 15:27:18 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1010221526080.29540@localhost6.localdomain6>
References: <201010211315.26679.richard@nod.at> <201010212122.38437.richard@nod.at> <alpine.LFD.2.00.1010212143300.3467@localhost6.localdomain6> <201010212227.12919.richard@nod.at> <alpine.LFD.2.00.1010220900230.3467@localhost6.localdomain6>
 <ed248baebfad9b050f53a6832435a9a5@radon2.swed.at> <alpine.LFD.2.00.1010221309370.3345@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.1010221309370.3345@localhost6.localdomain6>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Weinberger <richard@nod.at>
Cc: peterz@infradead.org, hpa@zytor.com, mingo@elte.hu, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 22 Oct 2010, Thomas Gleixner wrote:
> On Fri, 22 Oct 2010, Richard Weinberger wrote:
> Well, nothing is supposed to call enable_irq() before an interrupt is
> installed with request_irq() or setup_irq().
> 
> Patch below should fix your problem.

Yuck. Missed the second instance. Updated patch below.

Thanks,
 
 	tglx
---
diff --git a/arch/um/kernel/irq.c b/arch/um/kernel/irq.c
index a746e30..97e204b 100644
--- a/arch/um/kernel/irq.c
+++ b/arch/um/kernel/irq.c
@@ -395,13 +395,11 @@ void __init init_IRQ(void)
 	irq_desc[TIMER_IRQ].action = NULL;
 	irq_desc[TIMER_IRQ].depth = 1;
 	irq_desc[TIMER_IRQ].chip = &SIGVTALRM_irq_type;
-	enable_irq(TIMER_IRQ);
 	for (i = 1; i < NR_IRQS; i++) {
 		irq_desc[i].status = IRQ_DISABLED;
 		irq_desc[i].action = NULL;
 		irq_desc[i].depth = 1;
 		irq_desc[i].chip = &normal_irq_type;
-		enable_irq(i);
 	}
 }
 
