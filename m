From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the tip tree with the openrisc tree
Date: Mon, 20 Feb 2017 12:28:44 +0100
Message-ID: <20170220112844.GN6536@twins.programming.kicks-ass.net>
References: <20170217124321.7b4b394d@canb.auug.org.au>
 <20170219072654.GB2379@lianli.shorne-pla.net>
 <20170220111805.GP6500@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33859 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752639AbdBTL3O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Feb 2017 06:29:14 -0500
Content-Disposition: inline
In-Reply-To: <20170220111805.GP6500@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>

On Mon, Feb 20, 2017 at 12:18:05PM +0100, Peter Zijlstra wrote:
> On Sun, Feb 19, 2017 at 04:26:54PM +0900, Stafford Horne wrote:
> > On Fri, Feb 17, 2017 at 12:43:21PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the tip tree got a conflict in:
> > > 
> > >   arch/openrisc/include/asm/Kbuild
> > > 
> > > between commit:
> > > 
> > >   157e82f58007 ("openrisc: add cmpxchg and xchg implementations")
> 
> *groan* branch delay slots...
> 
> 
> It it typically recommended to implement 1 and 2 byte versions as well.
> If the architecture doesn't support these natively, you can easily
> implement them with the 4 byte ll/sc and simply retain the other bits.

While there; I spotted commit 8ffa662370f0 ("openrisc: add optimized
atomic operations") which doesn't make any kind of sense to me.

Have you actually read the asm-generic/atomic.h file you're including?
