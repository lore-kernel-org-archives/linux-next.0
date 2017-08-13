From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Sun, 13 Aug 2017 14:50:19 +0200
Message-ID: <20170813125019.ihqjud37ytgri7bn@hirez.programming.kicks-ass.net>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
 <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
 <20170811140450.irhxa2bhdpmmhhpv@hirez.programming.kicks-ass.net>
 <DE232310-8D7E-4074-ACFE-FE6416B13A3F@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57733 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750880AbdHMMub (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Aug 2017 08:50:31 -0400
Content-Disposition: inline
In-Reply-To: <DE232310-8D7E-4074-ACFE-FE6416B13A3F@vmware.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, "minchan@kernel.org" <minchan@kernel.org>

On Sun, Aug 13, 2017 at 06:06:32AM +0000, Nadav Amit wrote:
> > however mm_tlb_flush_nested() is a mystery, it appears to care about
> > anything inside the range. For now rely on it doing at least _a_ PTL
> > lock instead of taking  _the_ PTL lock.
> 
> It does not care about “anything” inside the range, but only on situations
> in which there is at least one (same) PT that was modified by one core and
> then read by the other. So, yes, it will always be _the_ same PTL, and not
> _a_ PTL - in the cases that flush is really needed.
> 
> The issue that might require additional barriers is that
> inc_tlb_flush_pending() and mm_tlb_flush_nested() are called when the PTL is
> not held. IIUC, since the release-acquire might not behave as a full memory
> barrier, this requires an explicit memory barrier.

So I'm not entirely clear about this yet.

How about:


	CPU0				CPU1

					tlb_gather_mmu()

					lock PTLn
					no mod
					unlock PTLn

	tlb_gather_mmu()

					lock PTLm
					mod
					include in tlb range
					unlock PTLm

	lock PTLn
	mod
	unlock PTLn

					tlb_finish_mmu()
					  force = mm_tlb_flush_nested(tlb->mm);
					  arch_tlb_finish_mmu(force);


	... more ...

	tlb_finish_mmu()



In this case you also want CPU1's mm_tlb_flush_nested() call to return
true, right?

But even with an smp_mb__after_atomic() at CPU0's tlg_bather_mmu()
you're not guaranteed CPU1 sees the increment. The only way to do that
is to make the PTL locks RCsc and that is a much more expensive
proposition.


What about:


	CPU0				CPU1

					tlb_gather_mmu()

					lock PTLn
					no mod
					unlock PTLn


					lock PTLm
					mod
					include in tlb range
					unlock PTLm

	tlb_gather_mmu()

	lock PTLn
	mod
	unlock PTLn

					tlb_finish_mmu()
					  force = mm_tlb_flush_nested(tlb->mm);
					  arch_tlb_finish_mmu(force);


	... more ...

	tlb_finish_mmu()

Do we want CPU1 to see it here? If so, where does it end?


	CPU0				CPU1

					tlb_gather_mmu()

					lock PTLn
					no mod
					unlock PTLn


					lock PTLm
					mod
					include in tlb range
					unlock PTLm

					tlb_finish_mmu()
					  force = mm_tlb_flush_nested(tlb->mm);

	tlb_gather_mmu()

	lock PTLn
	mod
	unlock PTLn

					  arch_tlb_finish_mmu(force);


	... more ...

	tlb_finish_mmu()


This?


Could you clarify under what exact condition mm_tlb_flush_nested() must
return true?
