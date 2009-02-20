From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the slab tree with the ftrace tree
Date: Fri, 20 Feb 2009 10:37:34 +0100
Message-ID: <20090220093734.GI24555@elte.hu>
References: <20090220165728.7f2cec61.sfr@canb.auug.org.au> <20090220195911.3bff30fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:38497 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753689AbZBTJh5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Feb 2009 04:37:57 -0500
Content-Disposition: inline
In-Reply-To: <20090220195911.3bff30fb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Fri, 20 Feb 2009 16:57:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > @@@ -2723,18 -2689,9 +2727,19 @@@ static void *kmalloc_large_node(size_t 
> >   void *__kmalloc_node(size_t size, gfp_t flags, int node)
> >   {
> >   	struct kmem_cache *s;
> >  +	void *ret;
> >   
> >  -	if (unlikely(size > SLUB_MAX_SIZE))
> >  -		return kmalloc_large_node(size, flags, node);
> > ++	if (unlikely(size > SLUB_MAX_SIZE)) {
> >  +	if (unlikely(size > PAGE_SIZE)) {
> 
> Except I screwed that up.  I meant to delete the last line 
> above.  I will add a patch to the end of linux-next for today.

Hm, i'd love to eliminate the conflict, but it would either mean 
us to pull the slab tree into the tracing tree, or the other way 
around - and both have quite many items queued up to make this 
impractical.

	Ingo
