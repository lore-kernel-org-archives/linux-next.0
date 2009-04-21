From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the kmemleak tree
Date: Tue, 21 Apr 2009 12:47:10 +0100
Message-ID: <1240314430.1369.18.camel@pc1117.cambridge.arm.com>
References: <20090115162717.de2b3a3c.sfr@canb.auug.org.au>
	 <20090115102950.GA5201@localhost>
	 <1232021097.32016.25.camel@pc1117.cambridge.arm.com>
	 <20090115174921.GA5314@localhost>
	 <1240312442.1369.9.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:65216 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752512AbZDULsP (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 07:48:15 -0400
In-Reply-To: <1240312442.1369.9.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>

On Tue, 2009-04-21 at 12:14 +0100, Catalin Marinas wrote:
> On Thu, 2009-01-15 at 19:49 +0200, Eduard - Gabriel Munteanu wrote:
> > On Thu, Jan 15, 2009 at 12:04:57PM +0000, Catalin Marinas wrote:
> > > The only issue is that kmemleak would need to register the callbacks
> > > before the slab allocator is initialised (otherwise it may miss some
> > > allocations). So it would need a 3-stage initialisation - pre-slab,
> > > post-slab and late_initcall.
> > 
> > Sure, that is not a problem, as kmemtrace needn't be compiled in for
> > the tracepoints to work. As long as they're defined in some header and
> > included, you can register multiple probes from all over the kernel.
> > This also means you won't have to interact with kmemtrace code.
> 
> I noticed that the memory allocation tracepoints were merged into
> mainline. I'll modify kmemleak to use them and probably add another for
> vmalloc.

After a quick look, it turns out not to be so simple. Kmemleak needs to
trace all the memory allocations (missing some could cause false
positives) and it currently has a static buffer to store the first
allocations before kmemleak is fully initialised.

Registering a probe requires memory allocations and therefore it needs
to be done after kmem_cache_init(). It means that kmemleak would miss
several allocations before it can register the probes. I don't see any
solution other than inserting kmemleak_*() calls near the tracing hooks.

Any other suggestion? Thanks.

-- 
Catalin
