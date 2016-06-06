From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Mon, 6 Jun 2016 10:39:46 +0200
Message-ID: <20160606083946.GG11895@dhcp22.suse.cz>
References: <20160602092113.GH1995@dhcp22.suse.cz>
 <20160603071551.GA453@swordfish>
 <20160603072536.GB20676@dhcp22.suse.cz>
 <20160603084347.GA502@swordfish>
 <20160603095549.GD20676@dhcp22.suse.cz>
 <20160603100505.GE20676@dhcp22.suse.cz>
 <20160603133813.GA578@swordfish>
 <20160603134509.GI20676@dhcp22.suse.cz>
 <20160603134934.GJ20676@dhcp22.suse.cz>
 <20160604075114.GA21108@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20160604075114.GA21108@swordfish>
Sender: owner-linux-mm@kvack.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Andrea Arcangeli <aarcange@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Sat 04-06-16 16:51:14, Sergey Senozhatsky wrote:
> Hello,
> 
> On (06/03/16 15:49), Michal Hocko wrote:
> > __khugepaged_exit is called during the final __mmput and it employs a
> > complex synchronization dances to make sure it doesn't race with the
> > khugepaged which might be scanning this mm at the same time. This is
> > all caused by the fact that khugepaged doesn't pin mm_users. Things
> > would simplify considerably if we simply check the mm at
> > khugepaged_scan_mm_slot and if mm_users was already 0 then we know it
> > is dead and we can unhash the mm_slot and move on to another one. This
> > will also guarantee that __khugepaged_exit cannot race with khugepaged
> > and so we can free up the slot if it is still hashed.
> > 
> > Signed-off-by: Michal Hocko <mhocko@suse.com>
> 
> with this patch and
> http://ozlabs.org/~akpm/mmotm/broken-out/mm-thp-make-swapin-readahead-under-down_read-of-mmap_sem-fix-2.patch
> 
> I saw no problems during my tests (well, may be didn't test hard
> enough).

Thanks for the testing!
-- 
Michal Hocko
SUSE Labs

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
