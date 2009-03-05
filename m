From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the x86 tree
Date: Thu, 5 Mar 2009 14:59:56 +1100
Message-ID: <20090305145956.a62826c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33383 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753332AbZCEEYn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Mar 2009 23:24:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/mach-default/setup.c between commit
6bda2c8b32febeb38ee128047253751e080bad52 ("x86: remove subarchitecture
support") from the x86 tree and commit
cafecba4dd4e08412d1141a260c38e35ca597710
("cpumask:irqaction-remove-unnecessary-initializers") from the rr tree.

The former moved the code that the latter changed.  I removed the
file and added the following patch.  I can carry this as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/arch/x86/kernel/irqinit_32.c b/arch/x86/kernel/irqinit_32.c
index e4630e2..eabdd9a 100644
--- a/arch/x86/kernel/irqinit_32.c
+++ b/arch/x86/kernel/irqinit_32.c
@@ -82,7 +82,6 @@ void __init init_ISA_irqs(void)
  */
 static struct irqaction irq2 = {
 	.handler = no_action,
-	.mask = CPU_MASK_NONE,
 	.name = "cascade",
 };
 
diff --git a/arch/x86/kernel/probe_32.c b/arch/x86/kernel/probe_32.c
index 31493c5..55150b1 100644
--- a/arch/x86/kernel/probe_32.c
+++ b/arch/x86/kernel/probe_32.c
@@ -334,7 +334,6 @@ void __init trap_init_hook(void)
 static struct irqaction irq0  = {
 	.handler = timer_interrupt,
 	.flags = IRQF_DISABLED | IRQF_NOBALANCING | IRQF_IRQPOLL | IRQF_TIMER,
-	.mask = CPU_MASK_NONE,
 	.name = "timer"
 };
 
@@ -367,7 +366,6 @@ void __init time_init_hook(void)
 			return;
 	}
 
-	irq0.mask = cpumask_of_cpu(0);
 	setup_irq(0, &irq0);
 }
 
