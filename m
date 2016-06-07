From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Tue, 7 Jun 2016 09:34:28 +0200
Message-ID: <20160607073427.GC12305@dhcp22.suse.cz>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <20160602092113.GH1995@dhcp22.suse.cz>
 <20160602120857.GA704@swordfish>
 <20160602122109.GM1995@dhcp22.suse.cz>
 <20160603135154.GD29930@redhat.com>
 <20160603144600.GK20676@dhcp22.suse.cz>
 <20160603151001.GG29930@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35891 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbcFGHeb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2016 03:34:31 -0400
Content-Disposition: inline
In-Reply-To: <20160603151001.GG29930@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrea Arcangeli <aarcange@redhat.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>

On Fri 03-06-16 17:10:01, Andrea Arcangeli wrote:
> Hello Michal,
> 
> CC'ed Hugh,
> 
> On Fri, Jun 03, 2016 at 04:46:00PM +0200, Michal Hocko wrote:
> > What do you think about the external dependencies mentioned above. Do
> > you think this is a sufficient argument wrt. occasional higher
> > latencies?
> 
> It's a tradeoff and both latencies would be short and uncommon so it's
> hard to tell.
> 
> There's also mmput_async for paths that may care about mmput
> latencies. Exit itself cannot use it, it's mostly for people taking
> the mm_users pin that may not want to wait for mmput to run. It also
> shouldn't happen that often, it's a slow path.
> 
> The whole model inherited from KSM is to deliberately depend only on
> the mmap_sem + test_exit + mm_count, and never on mm_users, which to
> me in principle doesn't sound bad.

I do agree that this model is quite clever (albeit convoluted). It just
assumes that all other mmap_sem users are behaving the same. Now most
in-kernel users will do get_task_mm() and then lock mmap_sem, but I
haven't checked all of them and it is quite possible that some of those
would like to optimize in a similar way and only increment mm_count.
I might be too pessimistic about the out of mm code but I would feel
much better if the exit path didn't depend on them.

Anyway, if the current model sounds better I will definitely not insist
on my patch. It is more of an idea for simplification than a fix for
anything I have seen happening in the real life.
-- 
Michal Hocko
SUSE Labs
