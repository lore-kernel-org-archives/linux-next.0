From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the Linus' tree
Date: Wed, 30 Mar 2011 11:00:45 +1100
Message-ID: <20110330110045.48fb0ccf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32900 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751683Ab1C3AAq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Mar 2011 20:00:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, ppc-dev <linuxppc-dev@lists.ozlabs.org>

Hi all,

After merging the Linus' tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/platforms/cell/interrupt.c: In function 'iic_host_map':
arch/powerpc/platforms/cell/interrupt.c:247: error: 'handle_iic_irq' undeclared (first use in this function)

Caused by commit f9ba4475f95b ("powerpc: cell: Use the core flow handler").

I applied the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 30 Mar 2011 10:48:28 +1100
Subject: [PATCH] powerpc/cell: fixup for removal of handle_iic_irq

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/cell/interrupt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/platforms/cell/interrupt.c b/arch/powerpc/platforms/cell/interrupt.c
index a19bec0..44cfd1b 100644
--- a/arch/powerpc/platforms/cell/interrupt.c
+++ b/arch/powerpc/platforms/cell/interrupt.c
@@ -244,7 +244,7 @@ static int iic_host_map(struct irq_host *h, unsigned int virq,
 		break;
 	case IIC_IRQ_TYPE_IOEXC:
 		irq_set_chip_and_handler(virq, &iic_ioexc_chip,
-					 handle_iic_irq);
+					 handle_edge_eoi_irq);
 		break;
 	default:
 		irq_set_chip_and_handler(virq, &iic_chip, handle_edge_eoi_irq);
-- 
1.7.4.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
