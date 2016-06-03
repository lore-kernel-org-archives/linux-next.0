From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Fri, 3 Jun 2016 12:05:05 +0200
Message-ID: <20160603100505.GE20676@dhcp22.suse.cz>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <20160602092113.GH1995@dhcp22.suse.cz>
 <20160603071551.GA453@swordfish>
 <20160603072536.GB20676@dhcp22.suse.cz>
 <20160603084347.GA502@swordfish>
 <20160603095549.GD20676@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160603095549.GD20676@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>
List-Id: linux-next.vger.kernel.org

On Fri 03-06-16 11:55:49, Michal Hocko wrote:
> On Fri 03-06-16 17:43:47, Sergey Senozhatsky wrote:
> > On (06/03/16 09:25), Michal Hocko wrote:
> > > > it's quite hard to trigger the bug (somehow), so I can't
> > > > follow up with more information as of now.
> > 
> > either I did something very silly fixing up the patch, or the
> > patch may be causing general protection faults on my system.
> > 
> > RIP collect_mm_slot() + 0x42/0x84
> > 	khugepaged
> 
> So is this really collect_mm_slot called directly from khugepaged or is
> some inlining going on there?
> 
> > 	prepare_to_wait_event
> > 	maybe_pmd_mkwrite
> > 	kthread
> > 	_raw_sin_unlock_irq
> > 	ret_from_fork
> > 	kthread_create_on_node
> > 
> > collect_mm_slot() + 0x42/0x84 is
> 
> I guess that the problem is that I have missed that __khugepaged_exit
> doesn't clear the cached khugepaged_scan.mm_slot. Does the following on
> top fixes that?

That wouldn't be sufficient after a closer look. We need to do the same
from khugepaged_scan_mm_slot when atomic_inc_not_zero fails. So I guess
it would be better to stick it into collect_mm_slot.

Thanks for your testing!
---
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 6574c62ca4a3..0432581fb87c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2011,6 +2011,9 @@ static void collect_mm_slot(struct mm_slot *mm_slot)
 		/* khugepaged_mm_lock actually not necessary for the below */
 		free_mm_slot(mm_slot);
 		mmdrop(mm);
+
+		if (khugepaged_scan.mm_slot == mm_slot)
+			khugepaged_scan.mm_slot = NULL;
 	}
 }
 
-- 
Michal Hocko
SUSE Labs
