From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the slab tree with the ftrace tree
Date: Fri, 20 Feb 2009 11:41:37 +0200
Message-ID: <1235122897.29813.28.camel@penberg-laptop>
References: <20090220165728.7f2cec61.sfr@canb.auug.org.au>
	 <20090220195911.3bff30fb.sfr@canb.auug.org.au>
	 <20090220093734.GI24555@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:48705 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753743AbZBTJlk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Feb 2009 04:41:40 -0500
In-Reply-To: <20090220093734.GI24555@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

Hi Ingo,

On Fri, 2009-02-20 at 10:37 +0100, Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > On Fri, 20 Feb 2009 16:57:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > @@@ -2723,18 -2689,9 +2727,19 @@@ static void *kmalloc_large_node(size_t 
> > >   void *__kmalloc_node(size_t size, gfp_t flags, int node)
> > >   {
> > >   	struct kmem_cache *s;
> > >  +	void *ret;
> > >   
> > >  -	if (unlikely(size > SLUB_MAX_SIZE))
> > >  -		return kmalloc_large_node(size, flags, node);
> > > ++	if (unlikely(size > SLUB_MAX_SIZE)) {
> > >  +	if (unlikely(size > PAGE_SIZE)) {
> > 
> > Except I screwed that up.  I meant to delete the last line 
> > above.  I will add a patch to the end of linux-next for today.
> 
> Hm, i'd love to eliminate the conflict, but it would either mean 
> us to pull the slab tree into the tracing tree, or the other way 
> around - and both have quite many items queued up to make this 
> impractical.

Is it a big problem, though? We could do the s/PAGE_SIZE/SLUB_MAX_SIZE/g
rename as a separate preparational patch (without any of the functional
changes) and see if Linus merges it to mainline...

			Pekka
