From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Fri, 11 Aug 2017 12:48:32 +0200
Message-ID: <20170811104832.cvunth3rbo75atzl@hirez.programming.kicks-ass.net>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:47788 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752154AbdHKKsr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Aug 2017 06:48:47 -0400
Content-Disposition: inline
In-Reply-To: <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nadav Amit <namit@vmware.com>, Linus <torvalds@linux-foundation.org>

On Fri, Aug 11, 2017 at 11:34:49AM +0200, Peter Zijlstra wrote:
> On Fri, Aug 11, 2017 at 05:53:26PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the akpm-current tree got conflicts in:
> > 
> >   include/linux/mm_types.h
> >   mm/huge_memory.c
> > 
> > between commit:
> > 
> >   8b1b436dd1cc ("mm, locking: Rework {set,clear,mm}_tlb_flush_pending()")
> > 
> > from the tip tree and commits:
> > 
> >   16af97dc5a89 ("mm: migrate: prevent racy access to tlb_flush_pending")
> >   a9b802500ebb ("Revert "mm: numa: defer TLB flush for THP migration as long as possible"")
> > 
> > from the akpm-current tree.
> > 
> > The latter 2 are now in Linus' tree as well (but were not when I started
> > the day).
> > 
> > The only way forward I could see was to revert
> > 
> >   8b1b436dd1cc ("mm, locking: Rework {set,clear,mm}_tlb_flush_pending()")
> > 
> > and the three following commits
> > 
> >   ff7a5fb0f1d5 ("overlayfs, locking: Remove smp_mb__before_spinlock() usage")
> >   d89e588ca408 ("locking: Introduce smp_mb__after_spinlock()")
> >   a9668cd6ee28 ("locking: Remove smp_mb__before_spinlock()")
> > 
> > before merging the akpm-current tree again.
> 
> Here's two patches that apply on top of tip.
> 


And here's one to fix the PPC ordering issue I found while doing those
patches.


---
Subject: mm: Fix barrier for inc_tlb_flush_pending() for PPC
From: Peter Zijlstra <peterz@infradead.org>
Date: Fri Aug 11 12:43:33 CEST 2017

When we have SPLIT_PTE_PTLOCKS and have RCpc locks (PPC) the UNLOCK of
one does not in fact order against the LOCK of another lock. Therefore
the documented scheme does not work.

Add an explicit smp_mb__after_atomic() to cure things.

Also update the comment to reflect the new inc/dec thing.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/mm_types.h |   34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -533,7 +533,7 @@ static inline bool mm_tlb_flush_pending(
 {
 	/*
 	 * Must be called with PTL held; such that our PTL acquire will have
-	 * observed the store from set_tlb_flush_pending().
+	 * observed the increment from inc_tlb_flush_pending().
 	 */
 	return atomic_read(&mm->tlb_flush_pending);
 }
@@ -547,13 +547,11 @@ static inline void inc_tlb_flush_pending
 {
 	atomic_inc(&mm->tlb_flush_pending);
 	/*
-	 * The only time this value is relevant is when there are indeed pages
-	 * to flush. And we'll only flush pages after changing them, which
-	 * requires the PTL.
-	 *
 	 * So the ordering here is:
 	 *
-	 *	mm->tlb_flush_pending = true;
+	 *	atomic_inc(&mm->tlb_flush_pending)
+	 *	smp_mb__after_atomic();
+	 *
 	 *	spin_lock(&ptl);
 	 *	...
 	 *	set_pte_at();
@@ -565,17 +563,33 @@ static inline void inc_tlb_flush_pending
 	 *				spin_unlock(&ptl);
 	 *
 	 *	flush_tlb_range();
-	 *	mm->tlb_flush_pending = false;
+	 *	atomic_dec(&mm->tlb_flush_pending);
 	 *
-	 * So the =true store is constrained by the PTL unlock, and the =false
-	 * store is constrained by the TLB invalidate.
+	 * Where we order the increment against the PTE modification with the
+	 * smp_mb__after_atomic(). It would appear that the spin_unlock(&ptl)
+	 * is sufficient to constrain the inc, because we only care about the
+	 * value if there is indeed a pending PTE modification. However with
+	 * SPLIT_PTE_PTLOCKS and RCpc locks (PPC) the UNLOCK of one lock does
+	 * not order against the LOCK of another lock.
+	 *
+	 * The decrement is ordered by the flush_tlb_range(), such that
+	 * mm_tlb_flush_pending() will not return false unless all flushes have
+	 * completed.
 	 */
+	smp_mb__after_atomic();
 }
 
 /* Clearing is done after a TLB flush, which also provides a barrier. */
 static inline void dec_tlb_flush_pending(struct mm_struct *mm)
 {
-	/* see set_tlb_flush_pending */
+	/*
+	 * See inc_tlb_flush_pending().
+	 *
+	 * This cannot be smp_mb__before_atomic() because smp_mb() simply does
+	 * not order against TLB invalidate completion, which is what we need.
+	 *
+	 * Therefore we must rely on tlb_flush_*() to guarantee order.
+	 */
 	atomic_dec(&mm->tlb_flush_pending);
 }
 #else
