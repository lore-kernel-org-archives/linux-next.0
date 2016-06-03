From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Fri, 3 Jun 2016 09:25:36 +0200
Message-ID: <20160603072536.GB20676@dhcp22.suse.cz>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <20160602092113.GH1995@dhcp22.suse.cz>
 <20160603071551.GA453@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160603071551.GA453@swordfish>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>
List-Id: linux-next.vger.kernel.org

On Fri 03-06-16 16:15:51, Sergey Senozhatsky wrote:
> Hello,
> 
> On (06/02/16 11:21), Michal Hocko wrote:
> [..]
> > @@ -2863,6 +2854,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages,
> >  
> >  		collect_mm_slot(mm_slot);
> >  	}
> > +	mmput(mm);
> >  
> >  	return progress;
> >  }
> 
> this possibly sleeping mmput() is called from
> under the spin_lock(&khugepaged_mm_lock).

You are right. khugepaged_scan_mm_slot returns with the lock held.
mmput_async would deal with it.
 
> there is also a trivial build fixup needed
> (move collect_mm_slot() before __khugepaged_exit()).

will fix that. Thanks!

> it's quite hard to trigger the bug (somehow), so I can't
> follow up with more information as of now.

Thanks anyway!
-- 
Michal Hocko
SUSE Labs
