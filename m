From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Fri, 17 Jul 2015 19:27:26 +0200
Message-ID: <20150717172726.GA30443@redhat.com>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46098 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754212AbbGQR3N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Jul 2015 13:29:13 -0400
Content-Disposition: inline
In-Reply-To: <20150717140615.GA2779@kvack.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Benjamin,

it seems that we do not understand each other,

On 07/17, Benjamin LaHaise wrote:
>
> On Fri, Jul 17, 2015 at 01:52:28AM +0200, Oleg Nesterov wrote:
> > > >
> > > > +int filemap_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf)
> > > > +{
> > > > +	BUG();
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int __access_remote_vm(struct task_struct *tsk, struct mm_struct *mm,
> > > >  		unsigned long addr, void *buf, int len, int write)
> > > >  {
> > >
> > > So if anyone starts testing aio on NOMMU, this patch will make the
> > > whole thing immediately go BUG.  This isn't helpful :(
> >
> > Well, I'm afraid I could miss something, but _afaics_ this can not
> > happen. filemap_page_mkwrite() can't be called if NOMMU.
> >
> > In particular, simply because sys_io_setup() is the only user (if
> > NOMMU) and it can't succeed. But even if I missed something and it
> > can succeed, ->page_mkwrite() must not be called anyway. But this,
> > again, unless I missed something ;)
> >
> > > Yes, making AIO depend on MMU sounds better.
> >
> > Perhaps Benjamin can change his mind or correct me.
>
> Either try to fix it correctly,

And I think this fix is correct. In a sense that we only add
filemap_page_mkwrite() to make the linker happy, it can never be called
and thus we can never hit this BUG().

Please look at filemap_fault() in nommu.c,

	int filemap_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
	{
		BUG();
		return 0;
	}

this is the same thing. If nothing else, mm/memory.c is not even compiled
if NOMMU.

> or disable the config.

Yes, I think this makes more sense. but see below...

> Making it just
> compile but be knowingly broken is worse than either of those 2 options.

Why? See above. I think this change makes no difference except it fixes
the build.

Again, of course I could miss something. Could you explain your point?

> My point was that it is valid for someone to want to use the functionality
> on a nommu system, and given that it should have worked before the page
> migration code was added, It Would Be Nice(tm) to return it to that state.

Perhaps it worked on NOMMU before, I have no idea. But currently, afaics,
it can not. Even sys_io_setup() can't suceed. So I do not understand why
do we allow NOMMU && CONFIG_AIO.

But this is another issue. Of course I won't insist, please forget.

> Adding a BUG() like that to the code is just plain broken.

Why? Could you explain what I have missed?

Oleg.
