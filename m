From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Fri, 11 Aug 2017 14:17:42 +0200
Message-ID: <20170811121742.sv3tfysnydsqpg2a@hirez.programming.kicks-ass.net>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
 <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:48912 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752169AbdHKMR4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Aug 2017 08:17:56 -0400
Content-Disposition: inline
In-Reply-To: <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nadav Amit <namit@vmware.com>, Linus <torvalds@linux-foundation.org>

On Fri, Aug 11, 2017 at 01:56:07PM +0200, Ingo Molnar wrote:
> I've done a minimal conflict resolution merge locally. Peter, could you please 
> double check my resolution, in:
> 
>   040cca3ab2f6: Merge branch 'linus' into locking/core, to resolve conflicts

That merge is a bit wonky, but not terminally broken afaict.

It now does two TLB flushes, the below cleans that up.

---
 mm/huge_memory.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ce883459e246..08f6c1993832 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1410,7 +1410,6 @@ int do_huge_pmd_numa_page(struct vm_fault *vmf, pmd_t pmd)
 	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
 	int page_nid = -1, this_nid = numa_node_id();
 	int target_nid, last_cpupid = -1;
-	bool need_flush = false;
 	bool page_locked;
 	bool migrated = false;
 	bool was_writable;
@@ -1497,22 +1496,18 @@ int do_huge_pmd_numa_page(struct vm_fault *vmf, pmd_t pmd)
 	}
 
 	/*
-	 * The page_table_lock above provides a memory barrier
-	 * with change_protection_range.
-	 */
-	if (mm_tlb_flush_pending(vma->vm_mm))
-		flush_tlb_range(vma, haddr, haddr + HPAGE_PMD_SIZE);
-
-	/*
 	 * Since we took the NUMA fault, we must have observed the !accessible
 	 * bit. Make sure all other CPUs agree with that, to avoid them
 	 * modifying the page we're about to migrate.
 	 *
 	 * Must be done under PTL such that we'll observe the relevant
-	 * set_tlb_flush_pending().
+	 * inc_tlb_flush_pending().
+	 *
+	 * We are not sure a pending tlb flush here is for a huge page
+	 * mapping or not. Hence use the tlb range variant
 	 */
 	if (mm_tlb_flush_pending(vma->vm_mm))
-		need_flush = true;
+		flush_tlb_range(vma, haddr, haddr + HPAGE_PMD_SIZE);
 
 	/*
 	 * Migrate the THP to the requested node, returns with page unlocked
@@ -1520,13 +1515,6 @@ int do_huge_pmd_numa_page(struct vm_fault *vmf, pmd_t pmd)
 	 */
 	spin_unlock(vmf->ptl);
 
-	/*
-	 * We are not sure a pending tlb flush here is for a huge page
-	 * mapping or not. Hence use the tlb range variant
-	 */
-	if (need_flush)
-		flush_tlb_range(vma, haddr, haddr + HPAGE_PMD_SIZE);
-
 	migrated = migrate_misplaced_transhuge_page(vma->vm_mm, vma,
 				vmf->pmd, pmd, vmf->address, page, target_nid);
 	if (migrated) {
