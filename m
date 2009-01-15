From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the kmemleak tree
Date: Thu, 15 Jan 2009 12:04:57 +0000
Message-ID: <1232021097.32016.25.camel@pc1117.cambridge.arm.com>
References: <20090115162717.de2b3a3c.sfr@canb.auug.org.au>
	 <20090115102950.GA5201@localhost>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:61502 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753893AbZAOMFa (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2009 07:05:30 -0500
In-Reply-To: <20090115102950.GA5201@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>

Eduard,

On Thu, 2009-01-15 at 12:29 +0200, Eduard - Gabriel Munteanu wrote:
> On Thu, Jan 15, 2009 at 04:27:17PM +1100, Stephen Rothwell wrote:
> > Hi Catalin,
> > 
> > Today's linux-next merge of the kmemleak tree got a conflict in mm/slob.c
> > between commit 3eae2cb24a96509e0a38cc48dc1538a2826f4e33 ("kmemtrace: SLOB
> > hooks") from the ftrace tree and commit
> > 19f8f253a808d317d34ccbbad3b15a1a8d2ac444 ("kmemleak: Add the slob memory
> > allocation/freeing hooks") from the kmemleak tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > http://www.canb.auug.org.au/~sfr/
> > 
> > diff --cc mm/slob.c
> > index 4d1c0fc,30b870f..0000000
> > --- a/mm/slob.c
> > +++ b/mm/slob.c
> > @@@ -489,12 -482,9 +490,13 @@@ void *__kmalloc_node(size_t size, gfp_
> >   			page = virt_to_page(ret);
> >   			page->private = size;
> >   		}
> >  +
> >  +		kmemtrace_mark_alloc_node(KMEMTRACE_TYPE_KMALLOC,
> >  +					  _RET_IP_, ret,
> >  +					  size, PAGE_SIZE << order, gfp, node);
> >   	}
> >   
> > + 	kmemleak_alloc(ret, size, 1, gfp);
> >   	return ret;
> >   }
> >   EXPORT_SYMBOL(__kmalloc_node);
> 
> Hi,
> 
> Perhaps kmemleak could attach to the kmemtrace traces. I'm currently
> working on moving kmemtrace w/ ftrace to tracepoints instead of markers,
> it'll hit the list soon. We'll use generic names for tracepoints, like
> trace_kmalloc_node(). If this sounds okay, tell me and I'll relocate the
> tracepoints definitions to a slab heades. All you'll need to do is
> attach to probes using register_trace_*(), same as kmemtrace does.

It sounds OK. There may be some other places where kmemleak callbacks
are needed (vmalloc, module.c) but I can add those directly.

The only issue is that kmemleak would need to register the callbacks
before the slab allocator is initialised (otherwise it may miss some
allocations). So it would need a 3-stage initialisation - pre-slab,
post-slab and late_initcall.

-- 
Catalin
