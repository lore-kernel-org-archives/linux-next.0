From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the rr tree
Date: Thu, 3 Sep 2009 18:25:45 +1000
Message-ID: <20090903182545.46dcd1d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58116 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753287AbZICIZq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Sep 2009 04:25:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

Hi all,

Today's linux-next merge of the tip tree got a conflict in
arch/x86/kernel/setup.c between commit
212eddcdef19bfbe9c2178257708eb7cf17931be
("cpumask:remove-last-remaining-irqaction-mask") from the rr tree and
commit 845b3944bbdf9e9247849bf037f27ff3a3f26d87 ("x86: Add timer_init to
x86_init_ops") from the tip tree.

The latter moves the code that the former removes.  I fixed it up using
the following patch (which I can carry as necessary).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: tip: fix merge for cupmask update

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/arch/x86/kernel/time.c b/arch/x86/kernel/time.c
index fcece00..7883cf9 100644
--- a/arch/x86/kernel/time.c
+++ b/arch/x86/kernel/time.c
@@ -93,7 +93,6 @@ static struct irqaction irq0  = {
 
 void __init setup_default_timer_irq(void)
 {
-	irq0.mask = cpumask_of_cpu(0);
 	setup_irq(0, &irq0);
 }
 

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
