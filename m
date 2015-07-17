From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: [PATCH] mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Fri, 17 Jul 2015 13:37:57 -0400
Message-ID: <20150717173757.GD2779@kvack.org>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org> <20150717172726.GA30443@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:43055 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752719AbbGQRh6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Jul 2015 13:37:58 -0400
Content-Disposition: inline
In-Reply-To: <20150717172726.GA30443@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 17, 2015 at 07:27:26PM +0200, Oleg Nesterov wrote:
> Benjamin,
> 
> it seems that we do not understand each other,
...
> >
> > Either try to fix it correctly,
> 
> And I think this fix is correct. In a sense that we only add
> filemap_page_mkwrite() to make the linker happy, it can never be called
> and thus we can never hit this BUG().
> 
> Please look at filemap_fault() in nommu.c,
> 
> 	int filemap_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
> 	{
> 		BUG();
> 		return 0;
> 	}
> 
> this is the same thing. If nothing else, mm/memory.c is not even compiled
> if NOMMU.

Using BUG() is the wrong approach.  If the code is not needed in NOMMU, then 
#ifdef it out.  Think about it: NOMMU systems are very low memory systems 
and they should not have dead code compiled in if it is not needed.

> > or disable the config.
> 
> Yes, I think this makes more sense. but see below...
> 
> > Making it just
> > compile but be knowingly broken is worse than either of those 2 options.
> 
> Why? See above. I think this change makes no difference except it fixes
> the build.
> 
> Again, of course I could miss something. Could you explain your point?

Don't add BUG().  It's the equivalent approach of saying "I think this code 
isn't needed, but I'm lazy and not going to remove it properly."

> > My point was that it is valid for someone to want to use the functionality
> > on a nommu system, and given that it should have worked before the page
> > migration code was added, It Would Be Nice(tm) to return it to that state.
> 
> Perhaps it worked on NOMMU before, I have no idea. But currently, afaics,
> it can not. Even sys_io_setup() can't suceed. So I do not understand why
> do we allow NOMMU && CONFIG_AIO.
> 
> But this is another issue. Of course I won't insist, please forget.

As I said in my earlier email: aio on NOMMU was broken by the page migration 
code that was added in mid 3.1x.  Fixing it should not be that hard.
> 
> > Adding a BUG() like that to the code is just plain broken.
> 
> Why? Could you explain what I have missed?

It's doing half the job.  Either the code should be #if'd out or not.

		-ben

> Oleg.

-- 
"Thought is the essence of where you are now."
