From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sparseirq tree
Date: Mon, 25 Aug 2008 19:32:43 +1000
Message-ID: <20080825193243.fdf24fcc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60364 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753299AbYHYJcx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 05:32:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>, Jeremy Fitzhardinge <jeremy@goop.org>

[Ingo, thanks for the heads up about this ...]

Hi Ingo,

Today's linux-next merge of the sparseirq tree got a conflict in
arch/x86/xen/spinlock.c between commit
168d2f464ab9860f0d1e66cf1f9684973222f1c6 ("xen: save previous spinlock
when blocking") from the x86 tree and commit
fb6dc57946f9ebfeac546dd0698d9f065c191668 ("x86: move kstat_irqs from
kstat to irq_desc") from the sparseirq tree.

I fixed it up (see below) and can carry it.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/xen/spinlock.c
index d072823,5a48aba..0000000
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@@ -194,60 -73,24 +194,60 @@@ static noinline int xen_spin_lock_slow(
  	if (irq == -1)
  		return 0;
  
 +	start = spin_time_start();
 +
  	/* announce we're spinning */
 -	spinning_lock(xl);
 +	prev = spinning_lock(xl);
 +
 +	flags = __raw_local_save_flags();
 +	if (irq_enable) {
 +		ADD_STATS(taken_slow_irqenable, 1);
 +		raw_local_irq_enable();
 +	}
 +
 +	ADD_STATS(taken_slow, 1);
 +	ADD_STATS(taken_slow_nested, prev != NULL);
  
 -	/* clear pending */
 -	xen_clear_irq_pending(irq);
 +	do {
 +		/* clear pending */
 +		xen_clear_irq_pending(irq);
 +
 +		/* check again make sure it didn't become free while
 +		   we weren't looking  */
 +		ret = xen_spin_trylock(lock);
 +		if (ret) {
 +			ADD_STATS(taken_slow_pickup, 1);
 +
 +			/*
 +			 * If we interrupted another spinlock while it
 +			 * was blocking, make sure it doesn't block
 +			 * without rechecking the lock.
 +			 */
 +			if (prev != NULL)
 +				xen_set_irq_pending(irq);
 +			goto out;
 +		}
  
 -	/* check again make sure it didn't become free while
 -	   we weren't looking  */
 -	ret = xen_spin_trylock(lock);
 -	if (ret)
 -		goto out;
 +		/*
 +		 * Block until irq becomes pending.  If we're
 +		 * interrupted at this point (after the trylock but
 +		 * before entering the block), then the nested lock
 +		 * handler guarantees that the irq will be left
 +		 * pending if there's any chance the lock became free;
 +		 * xen_poll_irq() returns immediately if the irq is
 +		 * pending.
 +		 */
 +		xen_poll_irq(irq);
 +		ADD_STATS(taken_slow_spurious, !xen_test_irq_pending(irq));
 +	} while (!xen_test_irq_pending(irq)); /* check for spurious wakeups */
  
- 	kstat_this_cpu.irqs[irq]++;
 -	/* block until irq becomes pending */
 -	xen_poll_irq(irq);
+ 	kstat_irqs_this_cpu(irq_to_desc(irq))++;
  
  out:
 -	unspinning_lock(xl);
 +	raw_local_irq_restore(flags);
 +	unspinning_lock(xl, prev);
 +	spin_time_accum_blocked(start);
 +
  	return ret;
  }
  
