From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Mon, 14 Aug 2017 21:57:23 +0200
Message-ID: <20170814195723.GO6524@worktop.programming.kicks-ass.net>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
 <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
 <20170811140450.irhxa2bhdpmmhhpv@hirez.programming.kicks-ass.net>
 <DE232310-8D7E-4074-ACFE-FE6416B13A3F@vmware.com>
 <20170813125019.ihqjud37ytgri7bn@hirez.programming.kicks-ass.net>
 <20170814031613.GD25427@bbox>
 <0F858068-D41D-46E3-B4A8-8A95B4EDB94F@vmware.com>
 <20170814083839.GD26913@bbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35508 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751098AbdHNT5d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Aug 2017 15:57:33 -0400
Content-Disposition: inline
In-Reply-To: <20170814083839.GD26913@bbox>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Minchan Kim <minchan@kernel.org>
Cc: Nadav Amit <namit@vmware.com>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>

On Mon, Aug 14, 2017 at 05:38:39PM +0900, Minchan Kim wrote:
> memory-barrier.txt always scares me. I have read it for a while
> and IIUC, it seems semantic of spin_unlock(&same_pte) would be
> enough without some memory-barrier inside mm_tlb_flush_nested.

Indeed, see the email I just send. Its both spin_lock() and
spin_unlock() that we care about.

Aside from the semi permeable barrier of these primitives, RCpc ensures
these orderings only work against the _same_ lock variable.

Let me try and explain the ordering for PPC (which is by far the worst
we have in this regard):


spin_lock(lock)
{
	while (test_and_set(lock))
		cpu_relax();
	lwsync();
}


spin_unlock(lock)
{
	lwsync();
	clear(lock);
}

Now LWSYNC has fairly 'simple' semantics, but with fairly horrible
ramifications. Consider LWSYNC to provide _local_ TSO ordering, this
means that it allows 'stores reordered after loads'.

For the spin_lock() that implies that all load/store's inside the lock
do indeed stay in, but the ACQUIRE is only on the LOAD of the
test_and_set(). That is, the actual _set_ can leak in. After all it can
re-order stores after load (inside the lock).

For unlock it again means all load/store's prior stay prior, and the
RELEASE is on the store clearing the lock state (nothing surprising
here).

Now the _local_ part, the main take-away is that these orderings are
strictly CPU local. What makes the spinlock work across CPUs (as we'd
very much expect it to) is the address dependency on the lock variable.

In order for the spin_lock() to succeed, it must observe the clear. Its
this link that crosses between the CPUs and builds the ordering. But
only the two CPUs agree on this order. A third CPU not involved in
this transaction can disagree on the order of events.
