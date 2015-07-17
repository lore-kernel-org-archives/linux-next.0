From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Fri, 17 Jul 2015 19:55:42 +0200
Message-ID: <20150717175542.GA31888@redhat.com>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org> <20150717172726.GA30443@redhat.com> <20150717173757.GD2779@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150717173757.GD2779@kvack.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/17, Benjamin LaHaise wrote:
>
> On Fri, Jul 17, 2015 at 07:27:26PM +0200, Oleg Nesterov wrote:
> > Benjamin,
> >
> > it seems that we do not understand each other,
> ...
> > >
> > > Either try to fix it correctly,
> >
> > And I think this fix is correct. In a sense that we only add
> > filemap_page_mkwrite() to make the linker happy, it can never be called
> > and thus we can never hit this BUG().
> >
> > Please look at filemap_fault() in nommu.c,
> >
> > 	int filemap_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
> > 	{
> > 		BUG();
> > 		return 0;
> > 	}
> >
> > this is the same thing. If nothing else, mm/memory.c is not even compiled
> > if NOMMU.
>
> Using BUG() is the wrong approach.  If the code is not needed in NOMMU, then
> #ifdef it out.  Think about it: NOMMU systems are very low memory systems
> and they should not have dead code compiled in if it is not needed.

OK, at least I hope you no longer think that this patch makes this code
knowingly broken.

> Don't add BUG().  It's the equivalent approach of saying "I think this code
> isn't needed, but I'm lazy and not going to remove it properly."

There is another interpretation: I think this code must be never called,
if it is actually called we have a serious problem which should be loudly
reported.

> > Why? Could you explain what I have missed?
>
> It's doing half the job.  Either the code should be #if'd out or not.

Again, filemap_page_mkwrite() added to nommu.c matches filemap_fault()
and filemap_map_pages() we already have.


But I won't argue, you are maintainer. What exactly do you want me to
ifdef? Will you agree with the patch which adds ifdef into
aio_ring_vm_ops,

	static const struct vm_operations_struct aio_ring_vm_ops = {
	       .mremap         = aio_ring_mremap,
	#ifdef CONFIG_MMU
	       .fault          = filemap_fault,
	       .map_pages      = filemap_map_pages,
	       .page_mkwrite   = filemap_page_mkwrite,
	#endif
	};

?

Oleg.
