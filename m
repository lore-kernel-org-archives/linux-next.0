From: Minchan Kim <minchan@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Mon, 14 Aug 2017 12:09:14 +0900
Message-ID: <20170814030914.GC25427@bbox>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
 <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
 <20170811140450.irhxa2bhdpmmhhpv@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170811140450.irhxa2bhdpmmhhpv@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nadav Amit <namit@vmware.com>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hi Peter,

On Fri, Aug 11, 2017 at 04:04:50PM +0200, Peter Zijlstra wrote:
> 
> Ok, so I have the below to still go on-top.
> 
> Ideally someone would clarify the situation around
> mm_tlb_flush_nested(), because ideally we'd remove the
> smp_mb__after_atomic() and go back to relying on PTL alone.
> 
> This also removes the pointless smp_mb__before_atomic()

I'm not an expert of barrier stuff but IIUC, mm_tlb_flush_nested's
side full memory barrier can go with removing smp_mb__after_atomic
in inc_tlb_flush_pending side?


diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 490af494c2da..5ad0e66df363 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -544,7 +544,12 @@ static inline bool mm_tlb_flush_pending(struct mm_struct *mm)
  */
 static inline bool mm_tlb_flush_nested(struct mm_struct *mm)
 {
-	return atomic_read(&mm->tlb_flush_pending) > 1;
+	/*
+	 * atomic_dec_and_test's full memory barrier guarantees
+	 * to see uptodate tlb_flush_pending count in other CPU
+	 * without relying on page table lock.
+	 */
+	return !atomic_dec_and_test(&mm->tlb_flush_pending);
 }
 
 static inline void init_tlb_flush_pending(struct mm_struct *mm)
diff --git a/mm/memory.c b/mm/memory.c
index f571b0eb9816..e90b57bc65fb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -407,6 +407,10 @@ void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm,
 			unsigned long start, unsigned long end)
 {
 	arch_tlb_gather_mmu(tlb, mm, start, end);
+	/*
+	 * couterpart is mm_tlb_flush_nested in tlb_finish_mmu
+	 * which decreases pending count.
+	 */
 	inc_tlb_flush_pending(tlb->mm);
 }
 
@@ -446,9 +450,7 @@ void tlb_finish_mmu(struct mmu_gather *tlb,
 	 *
 	 */
 	bool force = mm_tlb_flush_nested(tlb->mm);
-
 	arch_tlb_finish_mmu(tlb, start, end, force);
-	dec_tlb_flush_pending(tlb->mm);
 }
 
 /*
