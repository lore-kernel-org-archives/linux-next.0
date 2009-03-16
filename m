From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] powerpc/cell: fix unused variable warning in interrupt.c
Date: Mon, 16 Mar 2009 18:52:56 +1100
Message-ID: <20090316185256.4a160374.sfr@canb.auug.org.au>
References: <20090202174817.dd4a26f0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56704 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751656AbZCPHxA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 03:53:00 -0400
In-Reply-To: <20090202174817.dd4a26f0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, LKML <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@ozlabs.org>


arch/powerpc/platforms/cell/interrupt.c: In function 'handle_iic_irq':
arch/powerpc/platforms/cell/interrupt.c:240: warning: unused variable 'cpu'

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/cell/interrupt.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

On Mon, 2 Feb 2009 17:48:17 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> arch/powerpc/platforms/cell/interrupt.c: In function 'handle_iic_irq':
> arch/powerpc/platforms/cell/interrupt.c:240: warning: unused variable 'cpu'
> 
> Caused by commit dee4102a9a5882b4f7d5cc165ba29e8cc63cf92e ("sparseirq:
> use kstat_irqs_cpu instead").

This patch is relative to next-20090312 and updates the sparseirq tree.

diff --git a/arch/powerpc/platforms/cell/interrupt.c b/arch/powerpc/platforms/cell/interrupt.c
index 1f0d774..882e470 100644
--- a/arch/powerpc/platforms/cell/interrupt.c
+++ b/arch/powerpc/platforms/cell/interrupt.c
@@ -237,8 +237,6 @@ extern int noirqdebug;
 
 static void handle_iic_irq(unsigned int irq, struct irq_desc *desc)
 {
-	const unsigned int cpu = smp_processor_id();
-
 	spin_lock(&desc->lock);
 
 	desc->status &= ~(IRQ_REPLAY | IRQ_WAITING);
-- 
1.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
