From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Fri, 11 Aug 2017 11:34:49 +0200
Message-ID: <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
References: <20170811175326.36d546dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="tmsbqmgmwof3uyre"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170811175326.36d546dc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nadav Amit <namit@vmware.com>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org


--tmsbqmgmwof3uyre
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 11, 2017 at 05:53:26PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got conflicts in:
> 
>   include/linux/mm_types.h
>   mm/huge_memory.c
> 
> between commit:
> 
>   8b1b436dd1cc ("mm, locking: Rework {set,clear,mm}_tlb_flush_pending()")
> 
> from the tip tree and commits:
> 
>   16af97dc5a89 ("mm: migrate: prevent racy access to tlb_flush_pending")
>   a9b802500ebb ("Revert "mm: numa: defer TLB flush for THP migration as long as possible"")
> 
> from the akpm-current tree.
> 
> The latter 2 are now in Linus' tree as well (but were not when I started
> the day).
> 
> The only way forward I could see was to revert
> 
>   8b1b436dd1cc ("mm, locking: Rework {set,clear,mm}_tlb_flush_pending()")
> 
> and the three following commits
> 
>   ff7a5fb0f1d5 ("overlayfs, locking: Remove smp_mb__before_spinlock() usage")
>   d89e588ca408 ("locking: Introduce smp_mb__after_spinlock()")
>   a9668cd6ee28 ("locking: Remove smp_mb__before_spinlock()")
> 
> before merging the akpm-current tree again.

Here's two patches that apply on top of tip.


--tmsbqmgmwof3uyre
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="nadav_amit-mm-migrate__prevent_racy_access_to_tlb_flush_pending.patch"

Subject: mm: migrate: prevent racy access to tlb_flush_pending
From: Nadav Amit <nadav.amit@gmail.com>
Date: Tue, 1 Aug 2017 17:08:12 -0700

Setting and clearing mm->tlb_flush_pending can be performed by multiple
threads, since mmap_sem may only be acquired for read in
task_numa_work(). If this happens, tlb_flush_pending might be cleared
while one of the threads still changes PTEs and batches TLB flushes.

This can lead to the same race between migration and
change_protection_range() that led to the introduction of
tlb_flush_pending. The result of this race was data corruption, which
means that this patch also addresses a theoretically possible data
corruption.

An actual data corruption was not observed, yet the race was
was confirmed by adding assertion to check tlb_flush_pending is not set
by two threads, adding artificial latency in change_protection_range()
and using sysctl to reduce kernel.numa_balancing_scan_delay_ms.

Fixes: 20841405940e ("mm: fix TLB flush race between migration, and
change_protection_range")


Cc: <akpm@linux-foundation.org>
Cc: CC:     <nadav.amit@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Nadav Amit <namit@vmware.com>
Acked-by: Mel Gorman <mgorman@suse.de>
Acked-by: Rik van Riel <riel@redhat.com>
Acked-by: Minchan Kim <minchan@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: http://lkml.kernel.org/r/20170802000818.4760-2-namit@vmware.com
---
 include/linux/mm_types.h |   29 +++++++++++++++++++++--------
 kernel/fork.c            |    2 +-
 mm/debug.c               |    2 +-
 mm/mprotect.c            |    4 ++--
 4 files changed, 25 insertions(+), 12 deletions(-)

--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -493,7 +493,7 @@ struct mm_struct {
 	 * can move process memory needs to flush the TLB when moving a
 	 * PROT_NONE or PROT_NUMA mapped page.
 	 */
-	bool tlb_flush_pending;
+	atomic_t tlb_flush_pending;
 #endif
 #ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	/* See flush_tlb_batched_pending() */
@@ -535,11 +535,17 @@ static inline bool mm_tlb_flush_pending(
 	 * Must be called with PTL held; such that our PTL acquire will have
 	 * observed the store from set_tlb_flush_pending().
 	 */
-	return mm->tlb_flush_pending;
+	return atomic_read(&mm->tlb_flush_pending);
 }
-static inline void set_tlb_flush_pending(struct mm_struct *mm)
+
+static inline void init_tlb_flush_pending(struct mm_struct *mm)
 {
-	mm->tlb_flush_pending = true;
+	atomic_set(&mm->tlb_flush_pending, 0);
+}
+
+static inline void inc_tlb_flush_pending(struct mm_struct *mm)
+{
+	atomic_inc(&mm->tlb_flush_pending);
 	/*
 	 * The only time this value is relevant is when there are indeed pages
 	 * to flush. And we'll only flush pages after changing them, which
@@ -565,21 +571,28 @@ static inline void set_tlb_flush_pending
 	 * store is constrained by the TLB invalidate.
 	 */
 }
+
 /* Clearing is done after a TLB flush, which also provides a barrier. */
-static inline void clear_tlb_flush_pending(struct mm_struct *mm)
+static inline void dec_tlb_flush_pending(struct mm_struct *mm)
 {
 	/* see set_tlb_flush_pending */
-	mm->tlb_flush_pending = false;
+	atomic_dec(&mm->tlb_flush_pending);
 }
 #else
 static inline bool mm_tlb_flush_pending(struct mm_struct *mm)
 {
 	return false;
 }
-static inline void set_tlb_flush_pending(struct mm_struct *mm)
+
+static inline void init_tlb_flush_pending(struct mm_struct *mm)
 {
 }
-static inline void clear_tlb_flush_pending(struct mm_struct *mm)
+
+static inline void inc_tlb_flush_pending(struct mm_struct *mm)
+{
+}
+
+static inline void dec_tlb_flush_pending(struct mm_struct *mm)
 {
 }
 #endif
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -809,7 +809,7 @@ static struct mm_struct *mm_init(struct
 	mm_init_aio(mm);
 	mm_init_owner(mm, p);
 	mmu_notifier_mm_init(mm);
-	clear_tlb_flush_pending(mm);
+	init_tlb_flush_pending(mm);
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
 	mm->pmd_huge_pte = NULL;
 #endif
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -159,7 +159,7 @@ void dump_mm(const struct mm_struct *mm)
 		mm->numa_next_scan, mm->numa_scan_offset, mm->numa_scan_seq,
 #endif
 #if defined(CONFIG_NUMA_BALANCING) || defined(CONFIG_COMPACTION)
-		mm->tlb_flush_pending,
+		atomic_read(&mm->tlb_flush_pending),
 #endif
 		mm->def_flags, &mm->def_flags
 	);
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -244,7 +244,7 @@ static unsigned long change_protection_r
 	BUG_ON(addr >= end);
 	pgd = pgd_offset(mm, addr);
 	flush_cache_range(vma, addr, end);
-	set_tlb_flush_pending(mm);
+	inc_tlb_flush_pending(mm);
 	do {
 		next = pgd_addr_end(addr, end);
 		if (pgd_none_or_clear_bad(pgd))
@@ -256,7 +256,7 @@ static unsigned long change_protection_r
 	/* Only flush the TLB if we actually modified any entries: */
 	if (pages)
 		flush_tlb_range(vma, start, end);
-	clear_tlb_flush_pending(mm);
+	dec_tlb_flush_pending(mm);
 
 	return pages;
 }

--tmsbqmgmwof3uyre
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="nadav_amit-revert__mm-numa__defer_tlb_flush_for_thp_migration_as_long_as_possible_.patch"

Subject: Revert "mm: numa: defer TLB flush for THP migration as long as possible"
From:   Nadav Amit <namit@vmware.com>
Date: Tue, 1 Aug 2017 17:08:14 -0700

While deferring TLB flushes is a good practice, the reverted patch
caused pending TLB flushes to be checked while the page-table lock is
not taken. As a result, in architectures with weak memory model (PPC),
Linux may miss a memory-barrier, miss the fact TLB flushes are pending,
and cause (in theory) a memory corruption.

Since the alternative of using smp_mb__after_unlock_lock() was
considered a bit open-coded, and the performance impact is expected to
be small, the previous patch is reverted.

This reverts commit b0943d61b8fa420180f92f64ef67662b4f6cc493.

Cc: <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: CC:     <nadav.amit@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Suggested-by: Mel Gorman <mgorman@suse.de>
Signed-off-by: Nadav Amit <namit@vmware.com>
Acked-by: Mel Gorman <mgorman@suse.de>
Acked-by: Rik van Riel <riel@redhat.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: http://lkml.kernel.org/r/20170802000818.4760-4-namit@vmware.com
---
 mm/huge_memory.c |   13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1410,7 +1410,6 @@ int do_huge_pmd_numa_page(struct vm_faul
 	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
 	int page_nid = -1, this_nid = numa_node_id();
 	int target_nid, last_cpupid = -1;
-	bool need_flush = false;
 	bool page_locked;
 	bool migrated = false;
 	bool was_writable;
@@ -1503,9 +1502,12 @@ int do_huge_pmd_numa_page(struct vm_faul
 	 *
 	 * Must be done under PTL such that we'll observe the relevant
 	 * set_tlb_flush_pending().
+	 *
+	 * We are not sure a pending tlb flush here is for a huge page
+	 * mapping or not. Hence use the tlb range variant
 	 */
 	if (mm_tlb_flush_pending(vma->vm_mm))
-		need_flush = true;
+		flush_tlb_range(vma, haddr, haddr + HPAGE_PMD_SIZE);
 
 	/*
 	 * Migrate the THP to the requested node, returns with page unlocked
@@ -1513,13 +1515,6 @@ int do_huge_pmd_numa_page(struct vm_faul
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

--tmsbqmgmwof3uyre--
