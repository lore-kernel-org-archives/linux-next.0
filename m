From: Stafford Horne <shorne@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the openrisc tree
Date: Mon, 20 Feb 2017 23:53:46 +0900
Message-ID: <20170220145346.GE2379@lianli.shorne-pla.net>
References: <20170217124321.7b4b394d@canb.auug.org.au>
 <20170219072654.GB2379@lianli.shorne-pla.net>
 <20170220111805.GP6500@twins.programming.kicks-ass.net>
 <20170220112844.GN6536@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170220112844.GN6536@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 20, 2017 at 12:28:44PM +0100, Peter Zijlstra wrote:
> On Mon, Feb 20, 2017 at 12:18:05PM +0100, Peter Zijlstra wrote:
> > On Sun, Feb 19, 2017 at 04:26:54PM +0900, Stafford Horne wrote:
> > > On Fri, Feb 17, 2017 at 12:43:21PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > Today's linux-next merge of the tip tree got a conflict in:
> > > > 
> > > >   arch/openrisc/include/asm/Kbuild
> > > > 
> > > > between commit:
> > > > 
> > > >   157e82f58007 ("openrisc: add cmpxchg and xchg implementations")
> > 
> > *groan* branch delay slots...
> > 
> > 
> > It it typically recommended to implement 1 and 2 byte versions as well.
> > If the architecture doesn't support these natively, you can easily
> > implement them with the 4 byte ll/sc and simply retain the other bits.
> 
> While there; I spotted commit 8ffa662370f0 ("openrisc: add optimized
> atomic operations") which doesn't make any kind of sense to me.
> 
> Have you actually read the asm-generic/atomic.h file you're including?
>

Hi Peter,

 For 8ffa662370f0 ("openrisc: add optimized atomic operations")

As discussed on IRC, you are referring to the fact that this patch only
implements a few of the atomic operations.  I initially thought there
was a reason for that (when doing the first review of Stefan's patch and
discussing with him).  However, the issue is that this patch is against
the code before the atomic.h rewrite (3 years back).

This needs to be fixed by implementing all of the methods.


 For 157e82f58007 ("openrisc: add cmpxchg and xchg implementations")

Also as discussed 1 and 2 byte ops are not currently used, however they
will become required when using qspinlock.  Some example code exists
which could be borrowed for handling to bitmasking and alignment
complications. i.e.

  arch/sh/include/asm/cmpxchg-xchg.h

These will be added.  Possibly it would also be good to try and move
this generic 1 and 2 byte implementation code into include/asm?


I am not sure if I will have time to get these done before the merge
window.  Ill see if I can get the time to work on them, if not I will
pull the "atomic operations" patch as its really just preparation for
the SMP work.

Also, going forward I will Cc you on any atomic or barrier related
patches.

-Stafford
