From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Fri, 3 Jun 2016 15:49:35 +0200
Message-ID: <20160603134934.GJ20676@dhcp22.suse.cz>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <20160602092113.GH1995@dhcp22.suse.cz>
 <20160603071551.GA453@swordfish>
 <20160603072536.GB20676@dhcp22.suse.cz>
 <20160603084347.GA502@swordfish>
 <20160603095549.GD20676@dhcp22.suse.cz>
 <20160603100505.GE20676@dhcp22.suse.cz>
 <20160603133813.GA578@swordfish>
 <20160603134509.GI20676@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20160603134509.GI20676@dhcp22.suse.cz>
Sender: owner-linux-mm@kvack.org
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Andrea Arcangeli <aarcange@redhat.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri 03-06-16 15:45:09, Michal Hocko wrote:
> On Fri 03-06-16 22:38:13, Sergey Senozhatsky wrote:
> [...]
> > Michal, I'll try to test during the weekend (away from the affected box
> > now), but in the worst case it can as late as next Thursday (gonna travel
> > next week).
> 
> No problem. I would really like to hear from Andrea before we give this
> a serious try anyway.

And just for an easier review, here is what I have right now:
---
>From 1fa9428b215cea4a48737fc9650009616a5bcd4e Mon Sep 17 00:00:00 2001
From: Michal Hocko <mhocko@suse.com>
Date: Thu, 2 Jun 2016 10:38:37 +0200
Subject: [PATCH] khugepaged: simplify khugepaged vs. __mmput

__khugepaged_exit is called during the final __mmput and it employs a
complex synchronization dances to make sure it doesn't race with the
khugepaged which might be scanning this mm at the same time. This is
all caused by the fact that khugepaged doesn't pin mm_users. Things
would simplify considerably if we simply check the mm at
khugepaged_scan_mm_slot and if mm_users was already 0 then we know it
is dead and we can unhash the mm_slot and move on to another one. This
will also guarantee that __khugepaged_exit cannot race with khugepaged
and so we can free up the slot if it is still hashed.

Signed-off-by: Michal Hocko <mhocko@suse.com>
---
 mm/huge_memory.c | 90 ++++++++++++++++++++++++++------------------------------
 1 file changed, 42 insertions(+), 48 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index de62bd991827..0432581fb87c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1936,7 +1936,8 @@ static void insert_to_mm_slots_hash(struct mm_struct *mm,
 
 static inline int khugepaged_test_exit(struct mm_struct *mm)
 {
-	return atomic_read(&mm->mm_users) == 0;
+	/* the only pin is from khugepaged_scan_mm_slot */
+	return atomic_read(&mm->mm_users) <= 1;
 }
 
 int __khugepaged_enter(struct mm_struct *mm)
@@ -1948,8 +1949,6 @@ int __khugepaged_enter(struct mm_struct *mm)
 	if (!mm_slot)
 		return -ENOMEM;
 
-	/* __khugepaged_exit() must not run from under us */
-	VM_BUG_ON_MM(khugepaged_test_exit(mm), mm);
 	if (unlikely(test_and_set_bit(MMF_VM_HUGEPAGE, &mm->flags))) {
 		free_mm_slot(mm_slot);
 		return 0;
@@ -1992,36 +1991,43 @@ int khugepaged_enter_vma_merge(struct vm_area_struct *vma,
 	return 0;
 }
 
-void __khugepaged_exit(struct mm_struct *mm)
+static void collect_mm_slot(struct mm_slot *mm_slot)
 {
-	struct mm_slot *mm_slot;
-	int free = 0;
+	struct mm_struct *mm = mm_slot->mm;
 
-	spin_lock(&khugepaged_mm_lock);
-	mm_slot = get_mm_slot(mm);
-	if (mm_slot && khugepaged_scan.mm_slot != mm_slot) {
+	VM_BUG_ON(NR_CPUS != 1 && !spin_is_locked(&khugepaged_mm_lock));
+
+	if (khugepaged_test_exit(mm)) {
+		/* free mm_slot */
 		hash_del(&mm_slot->hash);
 		list_del(&mm_slot->mm_node);
-		free = 1;
-	}
-	spin_unlock(&khugepaged_mm_lock);
 
-	if (free) {
-		clear_bit(MMF_VM_HUGEPAGE, &mm->flags);
-		free_mm_slot(mm_slot);
-		mmdrop(mm);
-	} else if (mm_slot) {
 		/*
-		 * This is required to serialize against
-		 * khugepaged_test_exit() (which is guaranteed to run
-		 * under mmap sem read mode). Stop here (after we
-		 * return all pagetables will be destroyed) until
-		 * khugepaged has finished working on the pagetables
-		 * under the mmap_sem.
+		 * Not strictly needed because the mm exited already.
+		 *
+		 * clear_bit(MMF_VM_HUGEPAGE, &mm->flags);
 		 */
-		down_write(&mm->mmap_sem);
-		up_write(&mm->mmap_sem);
+
+		/* khugepaged_mm_lock actually not necessary for the below */
+		free_mm_slot(mm_slot);
+		mmdrop(mm);
+
+		if (khugepaged_scan.mm_slot == mm_slot)
+			khugepaged_scan.mm_slot = NULL;
+	}
+}
+
+void __khugepaged_exit(struct mm_struct *mm)
+{
+	struct mm_slot *mm_slot;
+
+	spin_lock(&khugepaged_mm_lock);
+	mm_slot = get_mm_slot(mm);
+	if (mm_slot) {
+		collect_mm_slot(mm_slot);
+		clear_bit(MMF_VM_HUGEPAGE, &mm->flags);
 	}
+	spin_unlock(&khugepaged_mm_lock);
 }
 
 static void release_pte_page(struct page *page)
@@ -2736,29 +2742,6 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
 	return ret;
 }
 
-static void collect_mm_slot(struct mm_slot *mm_slot)
-{
-	struct mm_struct *mm = mm_slot->mm;
-
-	VM_BUG_ON(NR_CPUS != 1 && !spin_is_locked(&khugepaged_mm_lock));
-
-	if (khugepaged_test_exit(mm)) {
-		/* free mm_slot */
-		hash_del(&mm_slot->hash);
-		list_del(&mm_slot->mm_node);
-
-		/*
-		 * Not strictly needed because the mm exited already.
-		 *
-		 * clear_bit(MMF_VM_HUGEPAGE, &mm->flags);
-		 */
-
-		/* khugepaged_mm_lock actually not necessary for the below */
-		free_mm_slot(mm_slot);
-		mmdrop(mm);
-	}
-}
-
 static unsigned int khugepaged_scan_mm_slot(unsigned int pages,
 					    struct page **hpage)
 	__releases(&khugepaged_mm_lock)
@@ -2780,6 +2763,16 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages,
 		khugepaged_scan.address = 0;
 		khugepaged_scan.mm_slot = mm_slot;
 	}
+
+	/*
+	 * Do not even try to do anything if the current mm is already
+	 * dead. khugepaged_mm_lock will make sure only this or
+	 * __khugepaged_exit does the unhasing.
+	 */
+	if (!atomic_inc_not_zero(&mm_slot->mm->mm_users)) {
+		collect_mm_slot(mm_slot);
+		return progress;
+	}
 	spin_unlock(&khugepaged_mm_lock);
 
 	mm = mm_slot->mm;
@@ -2863,6 +2856,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages,
 
 		collect_mm_slot(mm_slot);
 	}
+	mmput_async(mm);
 
 	return progress;
 }
-- 
2.8.1

-- 
Michal Hocko
SUSE Labs

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
