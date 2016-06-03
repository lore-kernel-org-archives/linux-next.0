From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Fri, 3 Jun 2016 11:55:49 +0200
Message-ID: <20160603095549.GD20676@dhcp22.suse.cz>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <20160602092113.GH1995@dhcp22.suse.cz>
 <20160603071551.GA453@swordfish>
 <20160603072536.GB20676@dhcp22.suse.cz>
 <20160603084347.GA502@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20160603084347.GA502@swordfish>
Sender: owner-linux-mm@kvack.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>
List-Id: linux-next.vger.kernel.org

On Fri 03-06-16 17:43:47, Sergey Senozhatsky wrote:
> On (06/03/16 09:25), Michal Hocko wrote:
> > > it's quite hard to trigger the bug (somehow), so I can't
> > > follow up with more information as of now.
> 
> either I did something very silly fixing up the patch, or the
> patch may be causing general protection faults on my system.
> 
> RIP collect_mm_slot() + 0x42/0x84
> 	khugepaged

So is this really collect_mm_slot called directly from khugepaged or is
some inlining going on there?

> 	prepare_to_wait_event
> 	maybe_pmd_mkwrite
> 	kthread
> 	_raw_sin_unlock_irq
> 	ret_from_fork
> 	kthread_create_on_node
> 
> collect_mm_slot() + 0x42/0x84 is

I guess that the problem is that I have missed that __khugepaged_exit
doesn't clear the cached khugepaged_scan.mm_slot. Does the following on
top fixes that?
---
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 6574c62ca4a3..e6f4e6fd587a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2021,6 +2021,8 @@ void __khugepaged_exit(struct mm_struct *mm)
 	spin_lock(&khugepaged_mm_lock);
 	mm_slot = get_mm_slot(mm);
 	if (mm_slot) {
+		if (khugepaged_scan.mm_slot == mm_slot)
+			khugepaged_scan.mm_slot = NULL;
 		collect_mm_slot(mm_slot);
 		clear_bit(MMF_VM_HUGEPAGE, &mm->flags);
 	}
-- 
Michal Hocko
SUSE Labs

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
