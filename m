From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build failure after merge of the final tree (slab
 tree related)
Date: Wed, 25 Aug 2010 08:50:52 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1008250846590.13026@router.home>
References: <20100824120714.8918f8de.sfr@canb.auug.org.au> <4C740450.3030000@cs.helsinki.fi> <alpine.DEB.2.00.1008241256280.4763@router.home> <4C741029.7090300@cs.helsinki.fi> <alpine.DEB.2.00.1008241352240.5388@router.home> <4C74D1D7.4080608@kernel.org>
 <4C74DB05.7000101@cs.helsinki.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp109.prem.mail.ac4.yahoo.com ([76.13.13.92]:39333 "HELO
	smtp109.prem.mail.ac4.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752826Ab0HYNuz (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Aug 2010 09:50:55 -0400
In-Reply-To: <4C74DB05.7000101@cs.helsinki.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 25 Aug 2010, Pekka Enberg wrote:

> On 8/25/10 11:18 AM, Tejun Heo wrote:
> > Hello,
> >
> > On 08/24/2010 08:53 PM, Christoph Lameter wrote:
> > > > [    0.000000] Kernel panic - not syncing: Cannot create slab kmem_cache
> > > > size=232 realsize=256 order=0 offset=0 flags=42000
> > >
> > > alloc per cpu result in kmalloc which fails.
> > >
> > > Tejon: Is there some way we could get a reserved per cpu area under UP
> > > instead of fallback to slab allocations during bootup?
> >
> > Eh... nasty.  Maybe we can create a alloc_percpu_early() function
> > which doesn't allow freeing of allocate memory and just redirect to
> > bootmem on UP?
>
> Yeah, I was thinking about that too.

Another solution is to allocate an order 1 (compound) page for each early
cache. Then resize the kmalloc array after everything is up. kfree() will
then redirect to the page allocator.

But this is a slab allocator specific solution.

We now have the situation that alloc_percpu can only be used on early boot
on SMP machines. A general solution would be better I think.

If the early alloc_percpu stuff would work consistently then it could also
be used to avoid the boot_pageset in the page allocator f.e.

Can we just get rid of the special UP case and just run the percpu
subsystem even for UP?
