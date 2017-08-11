From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Fri, 11 Aug 2017 16:04:50 +0200
Message-ID: <20170811140450.irhxa2bhdpmmhhpv@hirez.programming.kicks-ass.net>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
 <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:50642 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752850AbdHKOFC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Aug 2017 10:05:02 -0400
Content-Disposition: inline
In-Reply-To: <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nadav Amit <namit@vmware.com>, Linus <torvalds@linux-foundation.org>, minchan@kernel.org


Ok, so I have the below to still go on-top.

Ideally someone would clarify the situation around
mm_tlb_flush_nested(), because ideally we'd remove the
smp_mb__after_atomic() and go back to relying on PTL alone.

This also removes the pointless smp_mb__before_atomic()

---
Subject: mm: Fix barriers for the tlb_flush_pending thing
From: Peter Zijlstra <peterz@infradead.org>
Date: Fri Aug 11 12:43:33 CEST 2017

I'm not 100% sure we always care about the same PTL and when we have
SPLIT_PTE_PTLOCKS and have RCpc locks (PPC) the UNLOCK of one does not
in fact order against the LOCK of another lock. Therefore the
documented scheme does not work if we care about multiple PTLs

mm_tlb_flush_pending() appears to only care about a single PTL:

 - arch pte_accessible() (x86, arm64) only cares about that one PTE.
 - do_huge_pmd_numa_page() also only cares about a single (huge) page.
 - ksm write_protect_page() also only cares about a single page.

however mm_tlb_flush_nested() is a mystery, it appears to care about
anything inside the range. For now rely on it doing at least _a_ PTL
lock instead of taking  _the_ PTL lock.

Therefore add an explicit smp_mb__after_atomic() to cure things.

Also remove the smp_mb__before_atomic() on the dec side, as its
completely pointless. We must rely on flush_tlb_range() to DTRT.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/mm_types.h |   38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -537,13 +537,13 @@ static inline bool mm_tlb_flush_pending(
 {
 	/*
 	 * Must be called with PTL held; such that our PTL acquire will have
-	 * observed the store from set_tlb_flush_pending().
+	 * observed the increment from inc_tlb_flush_pending().
 	 */
-	return atomic_read(&mm->tlb_flush_pending) > 0;
+	return atomic_read(&mm->tlb_flush_pending);
 }
 
 /*
- * Returns true if there are two above TLB batching threads in parallel.
+ * Returns true if there are two or more TLB batching threads in parallel.
  */
 static inline bool mm_tlb_flush_nested(struct mm_struct *mm)
 {
@@ -558,15 +558,12 @@ static inline void init_tlb_flush_pendin
 static inline void inc_tlb_flush_pending(struct mm_struct *mm)
 {
 	atomic_inc(&mm->tlb_flush_pending);
-
 	/*
-	 * The only time this value is relevant is when there are indeed pages
-	 * to flush. And we'll only flush pages after changing them, which
-	 * requires the PTL.
-	 *
 	 * So the ordering here is:
 	 *
 	 *	atomic_inc(&mm->tlb_flush_pending);
+	 *	smp_mb__after_atomic();
+	 *
 	 *	spin_lock(&ptl);
 	 *	...
 	 *	set_pte_at();
@@ -580,21 +577,30 @@ static inline void inc_tlb_flush_pending
 	 *	flush_tlb_range();
 	 *	atomic_dec(&mm->tlb_flush_pending);
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
 
-/* Clearing is done after a TLB flush, which also provides a barrier. */
 static inline void dec_tlb_flush_pending(struct mm_struct *mm)
 {
 	/*
-	 * Guarantee that the tlb_flush_pending does not not leak into the
-	 * critical section, since we must order the PTE change and changes to
-	 * the pending TLB flush indication. We could have relied on TLB flush
-	 * as a memory barrier, but this behavior is not clearly documented.
+	 * See inc_tlb_flush_pending().
+	 *
+	 * This cannot be smp_mb__before_atomic() because smp_mb() simply does
+	 * not order against TLB invalidate completion, which is what we need.
+	 *
+	 * Therefore we must rely on tlb_flush_*() to guarantee order.
 	 */
-	smp_mb__before_atomic();
 	atomic_dec(&mm->tlb_flush_pending);
 }
 
