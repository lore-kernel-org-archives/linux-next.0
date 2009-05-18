From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the genirq tree with Linus' tree
Date: Mon, 18 May 2009 11:25:14 +1000
Message-ID: <20090518112514.c3ec8ea3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34165 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750774AbZERBZR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 May 2009 21:25:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ralf Baechle <ralf@linux-mips.org>

Hi all,

Today's linux-next merge of the genirq tree got a conflict in
arch/mips/sibyte/bcm1480/irq.c and arch/mips/sibyte/sb1250/irq.c between
commit 5d81b83d03eb32085c569854695e102dde7af544 ("MIPS: Sibyte: Fix
locking in set_irq_affinity") from Linus' tree and commit
d5dedd4507d307eb3f35f21b6e16f336fdc0d82a ("irq: change ->set_affinity()
to return status") from the genirq tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/mips/sibyte/bcm1480/irq.c
index c147c4b,4f256a1..0000000
--- a/arch/mips/sibyte/bcm1480/irq.c
+++ b/arch/mips/sibyte/bcm1480/irq.c
@@@ -151,7 -153,10 +151,9 @@@ static int bcm1480_set_affinity(unsigne
  			____raw_writeq(cur_ints, IOADDR(A_BCM1480_IMR_MAPPER(cpu) + R_BCM1480_IMR_INTERRUPT_MASK_H + (k*BCM1480_IMR_HL_SPACING)));
  		}
  	}
 -	spin_unlock(&bcm1480_imr_lock);
 -	spin_unlock_irqrestore(&desc->lock, flags);
 +	spin_unlock_irqrestore(&bcm1480_imr_lock, flags);
+ 
+ 	return 0;
  }
  #endif
  
diff --cc arch/mips/sibyte/sb1250/irq.c
index 38cb998,e389507..0000000
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@@ -142,7 -144,10 +142,9 @@@ static int sb1250_set_affinity(unsigne
  		____raw_writeq(cur_ints, IOADDR(A_IMR_MAPPER(cpu) +
  					R_IMR_INTERRUPT_MASK));
  	}
 -	spin_unlock(&sb1250_imr_lock);
 -	spin_unlock_irqrestore(&desc->lock, flags);
 +	spin_unlock_irqrestore(&sb1250_imr_lock, flags);
+ 
+ 	return 0;
  }
  #endif
  
