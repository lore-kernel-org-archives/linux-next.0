From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: build failure after merge of the final tree (slab
 tree related)
Date: Wed, 25 Aug 2010 20:16:05 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1008252014560.10986@chino.kir.corp.google.com>
References: <20100824120714.8918f8de.sfr@canb.auug.org.au> <4C740450.3030000@cs.helsinki.fi> <20100825101320.bed89b2a.sfr@canb.auug.org.au> <4C74A01E.1060809@cs.helsinki.fi> <alpine.DEB.2.00.1008250905490.13026@router.home> <alpine.DEB.2.00.1008251656390.22018@chino.kir.corp.google.com>
 <alpine.DEB.2.00.1008252031560.32421@router.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([74.125.121.35]:60179 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392Ab0HZDQM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Aug 2010 23:16:12 -0400
In-Reply-To: <alpine.DEB.2.00.1008252031560.32421@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Wed, 25 Aug 2010, Christoph Lameter wrote:

> > > +	 * Special hack for UP mode. allocpercpu() falls back to kmalloc
> > > +	 * operations. So we cannot use that before the slab allocator is up
> > > +	 * Simply get the smallest possible compound page. The page will be
> > > +	 * released via kfree() when the cpu caches are resized later.
> > > +	 */
> > > +	if (slab_state < UP)
> > > +		s->cpu_slab = (__percpu void *)__get_free_page(GFP_NOWAIT, 1);
> >
> > __get_free_pages() takes an order argument.
> 
> Right. Patch not refreshed after the last tinzy winzy change. Seems that I
> got a bit rusty.
> 
> Subject: Slub: UP bandaid
> 
> Since the percpu allocator does not provide early allocation in UP
> mode (only in SMP configurations) use __get_free_page() to improvise
> a compound page allocation that can be later freed via kfree().
> 
> Compound pages will be released when the cpu caches are resized.
> 
> Signed-off-by: Christoph Lameter <cl@linux.com>

Acked-by: David Rientjes <rientjes@google.com>

I'm really hoping that we can remove this hack soon when the percpu 
allocator can handle these allocations on UP without any specialized slab 
behavior.
