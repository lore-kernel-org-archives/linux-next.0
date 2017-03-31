From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Fri, 31 Mar 2017 09:02:42 -0700
Message-ID: <20170331160242.GF4543@tassilo.jf.intel.com>
References: <20170331164451.519d1d7e@canb.auug.org.au>
 <20170331064228.2u6x3s4yp6xolsbw@hirez.programming.kicks-ass.net>
 <20170331135448.GE4543@tassilo.jf.intel.com>
 <20170331144546.4bi6lnrcx4t6cyze@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:9524 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933149AbdCaQCo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 31 Mar 2017 12:02:44 -0400
Content-Disposition: inline
In-Reply-To: <20170331144546.4bi6lnrcx4t6cyze@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Mar 31, 2017 at 04:45:46PM +0200, Peter Zijlstra wrote:
> On Fri, Mar 31, 2017 at 06:54:48AM -0700, Andi Kleen wrote:
> > > Argh!
> > > 
> > > Andrew, please drop that patch. And the x86 out-of-line of __atomic_add_unless().
> > 
> > Why dropping the second?  Do you have something better?
> 
> The try_cmpxchg() patches save about half the text, and do not have the
> out-of-line penalty as shown here:
> 
>    https://lkml.kernel.org/r/20170322165144.dtidvvbxey7w5pbd@hirez.programming.kicks-ass.net

Where is the source for the benchmark?

Based on the description it sounds like it's testing atomic_inc(), which my patches
don't change.

BTW testing such things in tight loops is bad practice. If you run
them back to back the CPU pipeline has to do much more serialization,
which is usually not realistic and drastically overestimates
the overhead.

A better practice is to run some real workload. If you want to see
cycle counts you can look at LBR cycles, or PT cycles from sampling or tracing.

> > On the first there were no 0day regressions, so at least basic performance
> > checking has been done.
> 
> The first is superseded by much better patches in the scheduler tree.

Which patches exactly?  The new patches shrink the text too?

-Andi
