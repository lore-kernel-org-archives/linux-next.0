From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Thu, 2 Jun 2016 11:21:13 +0200
Message-ID: <20160602092113.GH1995@dhcp22.suse.cz>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36466 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752441AbcFBJVQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Jun 2016 05:21:16 -0400
Content-Disposition: inline
In-Reply-To: <20160602014835.GA635@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>

[CCing Andrea]

On Thu 02-06-16 10:48:35, Sergey Senozhatsky wrote:
> On (06/01/16 13:11), Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20160531:
> > 
> > My fixes tree contains:
> > 
> >   of: silence warnings due to max() usage
> > 
> > The arm tree gained a conflict against Linus' tree.
> > 
> > Non-merge commits (relative to Linus' tree): 1100
> >  936 files changed, 38159 insertions(+), 17475 deletions(-)
> 
> Hello,
> 
> the cc1 process ended up in DN state during kernel -j4 compilation.
> 
> ...
> [ 2856.323052] INFO: task cc1:4582 blocked for more than 21 seconds.
> [ 2856.323055]       Not tainted 4.7.0-rc1-next-20160601-dbg-00012-g52c180e-dirty #453
> [ 2856.323056] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [ 2856.323059] cc1             D ffff880057e9fd78     0  4582   4575 0x00000000
> [ 2856.323062]  ffff880057e9fd78 ffff880057e08000 ffff880057e9fd90 ffff880057ea0000
> [ 2856.323065]  ffff88005dc3dc68 ffffffff00000001 ffff880057e09500 ffff88005dc3dc80
> [ 2856.323067]  ffff880057e9fd90 ffffffff81441e33 ffff88005dc3dc68 ffff880057e9fe00
> [ 2856.323068] Call Trace:
> [ 2856.323074]  [<ffffffff81441e33>] schedule+0x83/0x98
> [ 2856.323077]  [<ffffffff81443d9b>] rwsem_down_write_failed+0x18e/0x1d3
> [ 2856.323080]  [<ffffffff810a87cf>] ? unlock_page+0x2b/0x2d
> [ 2856.323083]  [<ffffffff811bdb77>] call_rwsem_down_write_failed+0x17/0x30
> [ 2856.323084]  [<ffffffff811bdb77>] ? call_rwsem_down_write_failed+0x17/0x30
> [ 2856.323086]  [<ffffffff81443630>] down_write+0x1f/0x2e
> [ 2856.323089]  [<ffffffff810ea4f3>] __khugepaged_exit+0x104/0x11a
> [ 2856.323091]  [<ffffffff8103702a>] mmput+0x29/0xc5
> [ 2856.323093]  [<ffffffff8103bbd8>] do_exit+0x34c/0x894
> [ 2856.323095]  [<ffffffff8102f9e0>] ? __do_page_fault+0x2f7/0x399
> [ 2856.323097]  [<ffffffff8103c188>] do_group_exit+0x3c/0x98
> [ 2856.323099]  [<ffffffff8103c1f3>] SyS_exit_group+0xf/0xf
> [ 2856.323101]  [<ffffffff81444cdb>] entry_SYSCALL_64_fastpath+0x13/0x8f

down_write in the exit path is certainly not nice. It is hard to tell
who is blocking the mmap_sem but it is clear that __khugepaged_exit
waits for the khugepaged to release its mmap_sem. Do you hapen to have a
trace of khugepaged? Note that the lock holder might be another writer
which just hasn't pinned mm_users so khugepaged might be blocked on read
lock as well. Or khugepaged might be just stuck somewhere...

I am trying to wrap my head around the synchronization here and I
suspect it is unnecessarily complex. We should be able to go without
down_write in the exit path... The following patch would only workaround
the issue you are seeing but I guess it is worth considering this
approach.

Andrea, does the following look reasonable to you? I haven't tested it
and I might be missing some subtle details. The code is really not
trivial...
---
>From 34416b980cf02280ad76b5603175eda327ce0603 Mon Sep 17 00:00:00 2001
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
 mm/huge_memory.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index de62bd991827..3dfc62b1a90c 100644
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
@@ -1999,29 +1998,11 @@ void __khugepaged_exit(struct mm_struct *mm)
 
 	spin_lock(&khugepaged_mm_lock);
 	mm_slot = get_mm_slot(mm);
-	if (mm_slot && khugepaged_scan.mm_slot != mm_slot) {
-		hash_del(&mm_slot->hash);
-		list_del(&mm_slot->mm_node);
-		free = 1;
-	}
-	spin_unlock(&khugepaged_mm_lock);
-
-	if (free) {
+	if (mm_slot) {
+		collect_mm_slot(mm_slot);
 		clear_bit(MMF_VM_HUGEPAGE, &mm->flags);
-		free_mm_slot(mm_slot);
-		mmdrop(mm);
-	} else if (mm_slot) {
-		/*
-		 * This is required to serialize against
-		 * khugepaged_test_exit() (which is guaranteed to run
-		 * under mmap sem read mode). Stop here (after we
-		 * return all pagetables will be destroyed) until
-		 * khugepaged has finished working on the pagetables
-		 * under the mmap_sem.
-		 */
-		down_write(&mm->mmap_sem);
-		up_write(&mm->mmap_sem);
 	}
+	spin_unlock(&khugepaged_mm_lock);
 }
 
 static void release_pte_page(struct page *page)
@@ -2780,6 +2761,16 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages,
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
@@ -2863,6 +2854,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages,
 
 		collect_mm_slot(mm_slot);
 	}
+	mmput(mm);
 
 	return progress;
 }
-- 
2.8.1

-- 
Michal Hocko
SUSE Labs
