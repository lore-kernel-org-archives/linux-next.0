From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Sat, 18 Jul 2015 00:56:58 +0200
Message-ID: <20150717225658.GA14502@redhat.com>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org> <20150717172726.GA30443@redhat.com> <20150717173757.GD2779@kvack.org> <20150717175542.GA31888@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46641 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751190AbbGQW6p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Jul 2015 18:58:45 -0400
Content-Disposition: inline
In-Reply-To: <20150717175542.GA31888@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Benjamin,

This discussion was a bit confusing, so let me try to summarize and
please correct me if I misunderstood.

And sorry for bothering you, I just want to fix and forget about the
problem which was introduced by me (build failure with NOMMU).

So _iiuc_ you are starting to agree that tehcnically this change is
correct and we can never hit this BUG(). Like we can never hit another
BUG() in nommu.c:filemap_fault(), also referenced by aio_ring_vm_ops.
And this change should not hurt even if you make aio work with NOMMU.

No?

However, you still dislike this change because you think it is sub-
optimal and/or not clean enough. I won't argue with maintainer.

So what do you suggest instead? Will you agree with ifdef(CONFIG_MMU)
in aio_ring_vm_ops?

I aggree in advance with any suggestion.

On 07/17, Oleg Nesterov wrote:
>
> On 07/17, Benjamin LaHaise wrote:
> >
> > On Fri, Jul 17, 2015 at 07:27:26PM +0200, Oleg Nesterov wrote:
> > > Benjamin,
> > >
> > > it seems that we do not understand each other,
> > ...
> > > >
> > > > Either try to fix it correctly,
> > >
> > > And I think this fix is correct. In a sense that we only add
> > > filemap_page_mkwrite() to make the linker happy, it can never be called
> > > and thus we can never hit this BUG().
> > >
> > > Please look at filemap_fault() in nommu.c,
> > >
> > > 	int filemap_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
> > > 	{
> > > 		BUG();
> > > 		return 0;
> > > 	}
> > >
> > > this is the same thing. If nothing else, mm/memory.c is not even compiled
> > > if NOMMU.
> >
> > Using BUG() is the wrong approach.  If the code is not needed in NOMMU, then
> > #ifdef it out.  Think about it: NOMMU systems are very low memory systems
> > and they should not have dead code compiled in if it is not needed.
>
> OK, at least I hope you no longer think that this patch makes this code
> knowingly broken.
>
> > Don't add BUG().  It's the equivalent approach of saying "I think this code
> > isn't needed, but I'm lazy and not going to remove it properly."
>
> There is another interpretation: I think this code must be never called,
> if it is actually called we have a serious problem which should be loudly
> reported.
>
> > > Why? Could you explain what I have missed?
> >
> > It's doing half the job.  Either the code should be #if'd out or not.
>
> Again, filemap_page_mkwrite() added to nommu.c matches filemap_fault()
> and filemap_map_pages() we already have.
>
>
> But I won't argue, you are maintainer. What exactly do you want me to
> ifdef? Will you agree with the patch which adds ifdef into
> aio_ring_vm_ops,
>
> 	static const struct vm_operations_struct aio_ring_vm_ops = {
> 	       .mremap         = aio_ring_mremap,
> 	#ifdef CONFIG_MMU
> 	       .fault          = filemap_fault,
> 	       .map_pages      = filemap_map_pages,
> 	       .page_mkwrite   = filemap_page_mkwrite,
> 	#endif
> 	};
>
> ?
>
> Oleg.
