From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Fri, 31 Mar 2017 16:45:46 +0200
Message-ID: <20170331144546.4bi6lnrcx4t6cyze@hirez.programming.kicks-ass.net>
References: <20170331164451.519d1d7e@canb.auug.org.au>
 <20170331064228.2u6x3s4yp6xolsbw@hirez.programming.kicks-ass.net>
 <20170331135448.GE4543@tassilo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170331135448.GE4543@tassilo.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Kleen <ak@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 31, 2017 at 06:54:48AM -0700, Andi Kleen wrote:
> > Argh!
> > 
> > Andrew, please drop that patch. And the x86 out-of-line of __atomic_add_unless().
> 
> Why dropping the second?  Do you have something better?

The try_cmpxchg() patches save about half the text, and do not have the
out-of-line penalty as shown here:

   https://lkml.kernel.org/r/20170322165144.dtidvvbxey7w5pbd@hirez.programming.kicks-ass.net

> On the first there were no 0day regressions, so at least basic performance
> checking has been done.

The first is superseded by much better patches in the scheduler tree.
