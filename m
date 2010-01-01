From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: origin tree build warnings
Date: Thu, 31 Dec 2009 16:50:39 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0912311649070.3630@localhost.localdomain>
References: <20100101114238.83108321.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:47138 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751199Ab0AAAu6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2009 19:50:58 -0500
In-Reply-To: <20100101114238.83108321.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@linux.intel.com>, Tony Lindgren <tony@atomide.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Balaji T K <balajitk@ti.com>, Rajendra Nayak <rnayak@ti.com>



On Fri, 1 Jan 2010, Stephen Rothwell wrote:
>
> Today's linux-next build (powerpc allyesconfig) produced these warnings:
> 
> drivers/mfd/twl4030-irq.c: In function 'twl4030_sih_do_edge':
> drivers/mfd/twl4030-irq.c:571: warning: passing argument 1 of 'spin_lock_irq' from incompatible pointer type
> include/linux/spinlock.h:304: note: expected 'struct spinlock_t *' but argument is of type 'struct raw_spinlock_t *'
> drivers/mfd/twl4030-irq.c:576: warning: passing argument 1 of 'spin_unlock_irq' from incompatible pointer type
> include/linux/spinlock.h:329: note: expected 'struct spinlock_t *' but argument is of type 'struct raw_spinlock_t *'
> 
> Introduced by commit 239007b8440abff689632f50cdf0f2b9e895b534 ("genirq:
> Convert irq_desc.lock to raw_spinlock").  I guess that this file was
> missed in the conversion.

Ok, I tested and committed the other warning you pointed out, but this one 
I can't test since I no longer do powerpc builds. I assume the trivial fix 
below fixes it, but without testing I won't be committing it.

		Linus
---
 drivers/mfd/twl4030-irq.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 20d29ba..9df9a5a 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -568,12 +568,12 @@ static void twl4030_sih_do_edge(struct work_struct *work)
 
 		bytes[byte] &= ~(0x03 << off);
 
-		spin_lock_irq(&d->lock);
+		raw_spin_lock_irq(&d->lock);
 		if (d->status & IRQ_TYPE_EDGE_RISING)
 			bytes[byte] |= BIT(off + 1);
 		if (d->status & IRQ_TYPE_EDGE_FALLING)
 			bytes[byte] |= BIT(off + 0);
-		spin_unlock_irq(&d->lock);
+		raw_spin_unlock_irq(&d->lock);
 
 		edge_change &= ~BIT(i);
 	}
