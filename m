From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: [PATCH] mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Fri, 17 Jul 2015 10:06:15 -0400
Message-ID: <20150717140615.GA2779@kvack.org>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150716235227.GA26551@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Jul 17, 2015 at 01:52:28AM +0200, Oleg Nesterov wrote:
> On 07/16, Andrew Morton wrote:
> >
> > On Fri, 17 Jul 2015 01:14:05 +0200 Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > > fs/aio.c can't be compiled if CONFIG_MMU=n, filemap_page_mkwrite()
> > > is not defined in this case. Add yet another "must not be called"
> > > helper into nommu.c to make the linker happy.
> > >
> > > I still think this is pointless, afaics sys_io_setup() simply can't
> > > succeed if CONFIG_MMU=n. Instead we should make CONFIG_AIO depend
> > > on CONFIG_MMU.
> > >
> > > ..
> > >
> > > --- a/mm/nommu.c
> > > +++ b/mm/nommu.c
> > > @@ -2008,6 +2008,12 @@ void filemap_map_pages(struct vm_area_struct *vma, struct vm_fault *vmf)
> > >  }
> > >  EXPORT_SYMBOL(filemap_map_pages);
> > >
> > > +int filemap_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf)
> > > +{
> > > +	BUG();
> > > +	return 0;
> > > +}
> > > +
> > >  static int __access_remote_vm(struct task_struct *tsk, struct mm_struct *mm,
> > >  		unsigned long addr, void *buf, int len, int write)
> > >  {
> >
> > So if anyone starts testing aio on NOMMU, this patch will make the
> > whole thing immediately go BUG.  This isn't helpful :(
> 
> Well, I'm afraid I could miss something, but _afaics_ this can not
> happen. filemap_page_mkwrite() can't be called if NOMMU.
> 
> In particular, simply because sys_io_setup() is the only user (if
> NOMMU) and it can't succeed. But even if I missed something and it
> can succeed, ->page_mkwrite() must not be called anyway. But this,
> again, unless I missed something ;)
> 
> > Yes, making AIO depend on MMU sounds better.
> 
> Perhaps Benjamin can change his mind or correct me.

Either try to fix it correctly, or disable the config.  Making it just 
compile but be knowingly broken is worse than either of those 2 options.  
My point was that it is valid for someone to want to use the functionality 
on a nommu system, and given that it should have worked before the page 
migration code was added, It Would Be Nice(tm) to return it to that state.  
Adding a BUG() like that to the code is just plain broken.

		-ben

> > Because if it wasn't
> > busted before, it sure is now!
> 
> I hope this change can't make any difference.
> 
> Oleg.

-- 
"Thought is the essence of where you are now."
