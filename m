From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Mon, 14 Aug 2017 21:38:28 +0200
Message-ID: <20170814193828.GN6524@worktop.programming.kicks-ass.net>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
 <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
 <20170811140450.irhxa2bhdpmmhhpv@hirez.programming.kicks-ass.net>
 <DE232310-8D7E-4074-ACFE-FE6416B13A3F@vmware.com>
 <20170813125019.ihqjud37ytgri7bn@hirez.programming.kicks-ass.net>
 <20170814031613.GD25427@bbox>
 <0F858068-D41D-46E3-B4A8-8A95B4EDB94F@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:47890 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752159AbdHNTih (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Aug 2017 15:38:37 -0400
Content-Disposition: inline
In-Reply-To: <0F858068-D41D-46E3-B4A8-8A95B4EDB94F@vmware.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Minchan Kim <minchan@kernel.org>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>

On Mon, Aug 14, 2017 at 05:07:19AM +0000, Nadav Amit wrote:
> >> So I'm not entirely clear about this yet.
> >> 
> >> How about:
> >> 
> >> 
> >> 	CPU0				CPU1
> >> 
> >> 					tlb_gather_mmu()
> >> 
> >> 					lock PTLn
> >> 					no mod
> >> 					unlock PTLn
> >> 
> >> 	tlb_gather_mmu()
> >> 
> >> 					lock PTLm
> >> 					mod
> >> 					include in tlb range
> >> 					unlock PTLm
> >> 
> >> 	lock PTLn
> >> 	mod
> >> 	unlock PTLn
> >> 
> >> 					tlb_finish_mmu()
> >> 					  force = mm_tlb_flush_nested(tlb->mm);
> >> 					  arch_tlb_finish_mmu(force);
> >> 
> >> 
> >> 	... more ...
> >> 
> >> 	tlb_finish_mmu()
> >> 
> >> 
> >> 
> >> In this case you also want CPU1's mm_tlb_flush_nested() call to return
> >> true, right?
> > 
> > No, because CPU 1 mofified pte and added it into tlb range
> > so regardless of nested, it will flush TLB so there is no stale
> > TLB problem.

> To clarify: the main problem that these patches address is when the first
> CPU updates the PTE, and second CPU sees the updated value and thinks: “the
> PTE is already what I wanted - no flush is needed”.

OK, that simplifies things.

> For some reason (I would assume intentional), all the examples here first
> “do not modify” the PTE, and then modify it - which is not an “interesting”
> case.

Depends on what you call 'interesting' :-) They are 'interesting' to
make work from a memory ordering POV. And since I didn't get they were
excluded from the set, I worried.

In fact, if they were to be included, I couldn't make it work at all. So
I'm really glad to hear we can disregard them.

> However, based on what I understand on the memory barriers, I think
> there is indeed a missing barrier before reading it in
> mm_tlb_flush_nested(). IIUC using smp_mb__after_unlock_lock() in this case,
> before reading, would solve the problem with least impact on systems with
> strong memory ordering.

No, all is well. If, as you say, we're naturally constrained to the case
where we only care about prior modification we can rely on the RCpc PTL
locks.

Consider:


	CPU0				CPU1

					tlb_gather_mmu()

	tlb_gather_mmu()
	  inc	--------.
			| (inc is constrained by RELEASE)
	lock PTLn	|
	mod		^
	unlock PTLn ----------------->	lock PTLn
				v	no mod
				|	unlock PTLn
				|
				|	lock PTLm
				|	mod
				|	include in tlb range
				|	unlock PTLm
				|
	(read is constrained	|
	          by ACQUIRE)	|
				|	tlb_finish_mmu()
				`----	  force = mm_tlb_flush_nested(tlb->mm);
					  arch_tlb_finish_mmu(force);


	... more ...

	tlb_finish_mmu()


Then CPU1's acquire of PTLn orders against CPU0's release of that same
PTLn which guarantees we observe both its (prior) modified PTE and the
mm->tlb_flush_pending increment from tlb_gather_mmu().

So all we need for mm_tlb_flush_nested() to work is having acquired the
right PTL at least once before calling it.

At the same time, the decrements need to be after the TLB invalidate is
complete, this ensures that _IF_ we observe the decrement, we must've
also observed the corresponding invalidate.

Something like the below is then sufficient.

---
Subject: mm: Clarify tlb_flush_pending barriers
From: Peter Zijlstra <peterz@infradead.org>
Date: Fri, 11 Aug 2017 16:04:50 +0200

Better document the ordering around tlb_flush_pending.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/mm_types.h |   78 +++++++++++++++++++++++++++--------------------
 1 file changed, 45 insertions(+), 33 deletions(-)

--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -526,30 +526,6 @@ extern void tlb_gather_mmu(struct mmu_ga
 extern void tlb_finish_mmu(struct mmu_gather *tlb,
 				unsigned long start, unsigned long end);
 
-/*
- * Memory barriers to keep this state in sync are graciously provided by
- * the page table locks, outside of which no page table modifications happen.
- * The barriers are used to ensure the order between tlb_flush_pending updates,
- * which happen while the lock is not taken, and the PTE updates, which happen
- * while the lock is taken, are serialized.
- */
-static inline bool mm_tlb_flush_pending(struct mm_struct *mm)
-{
-	/*
-	 * Must be called with PTL held; such that our PTL acquire will have
-	 * observed the store from set_tlb_flush_pending().
-	 */
-	return atomic_read(&mm->tlb_flush_pending) > 0;
-}
-
-/*
- * Returns true if there are two above TLB batching threads in parallel.
- */
-static inline bool mm_tlb_flush_nested(struct mm_struct *mm)
-{
-	return atomic_read(&mm->tlb_flush_pending) > 1;
-}
-
 static inline void init_tlb_flush_pending(struct mm_struct *mm)
 {
 	atomic_set(&mm->tlb_flush_pending, 0);
@@ -558,7 +534,6 @@ static inline void init_tlb_flush_pendin
 static inline void inc_tlb_flush_pending(struct mm_struct *mm)
 {
 	atomic_inc(&mm->tlb_flush_pending);
-
 	/*
 	 * The only time this value is relevant is when there are indeed pages
 	 * to flush. And we'll only flush pages after changing them, which
@@ -580,24 +555,61 @@ static inline void inc_tlb_flush_pending
 	 *	flush_tlb_range();
 	 *	atomic_dec(&mm->tlb_flush_pending);
 	 *
-	 * So the =true store is constrained by the PTL unlock, and the =false
-	 * store is constrained by the TLB invalidate.
+	 * Where the increment if constrained by the PTL unlock, it thus
+	 * ensures that the increment is visible if the PTE modification is
+	 * visible. After all, if there is no PTE modification, nobody cares
+	 * about TLB flushes either.
+	 *
+	 * This very much relies on users (mm_tlb_flush_pending() and
+	 * mm_tlb_flush_nested()) only caring about _specific_ PTEs (and
+	 * therefore specific PTLs), because with SPLIT_PTE_PTLOCKS and RCpc
+	 * locks (PPC) the unlock of one doesn't order against the lock of
+	 * another PTL.
+	 *
+	 * The decrement is ordered by the flush_tlb_range(), such that
+	 * mm_tlb_flush_pending() will not return false unless all flushes have
+	 * completed.
 	 */
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
 
+static inline bool mm_tlb_flush_pending(struct mm_struct *mm)
+{
+	/*
+	 * Must be called after having acquired the PTL; orders against that
+	 * PTLs release and therefore ensures that if we observe the modified
+	 * PTE we must also observe the increment from inc_tlb_flush_pending().
+	 *
+	 * That is, it only guarantees to return true if there is a flush
+	 * pending for _this_ PTL.
+	 */
+	return atomic_read(&mm->tlb_flush_pending);
+}
+
+static inline bool mm_tlb_flush_nested(struct mm_struct *mm)
+{
+	/*
+	 * Similar to mm_tlb_flush_pending(), we must have acquired the PTL
+	 * for which there is a TLB flush pending in order to guarantee
+	 * we've seen both that PTE modification and the increment.
+	 *
+	 * (no requirement on actually still holding the PTL, that is irrelevant)
+	 */
+	return atomic_read(&mm->tlb_flush_pending) > 1;
+}
+
 struct vm_fault;
 
 struct vm_special_mapping {
