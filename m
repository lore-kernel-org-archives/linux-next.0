From: "Frank Ch. Eigler" <fche@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Thu, 21 Jan 2010 21:22:55 -0500
Message-ID: <20100122022255.GF22003@redhat.com>
References: <20100120062834.GB12165@elte.hu> <20100120072925.GA11395@elte.hu>
	<20100121013822.28781960.sfr@canb.auug.org.au>
	<20100122111747.3c224dfd.sfr@canb.auug.org.au>
	<20100121163004.8779bd69.akpm@linux-foundation.org>
	<20100121163145.7e958c3f.akpm@linux-foundation.org>
	<20100122005147.GD22003@redhat.com>
	<20100121170541.7425ff10.akpm@linux-foundation.org>
	<20100122012516.GE22003@redhat.com>
	<alpine.LFD.2.00.1001211729080.13231@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1001211729080.13231@localhost.localdomain>
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com
List-Id: linux-next.vger.kernel.org

Hi -

On Thu, Jan 21, 2010 at 05:32:47PM -0800, Linus Torvalds wrote:
> [...]
> > To the extent the discussion is colored by the new features enabled
> > from this refactoring, well, there is Oleg's list which may or may not
> > have mentioned enabling systemtap's user-space probing.
> 
> Let's face it, system tap isn't going to be merged, so why even bring it 
> up?

It was certainly not meant to derail the discussion about the merits
of utrace as a useful cleanup API in its own right, but rather to be
an example of what kinds of things become straightforward in its
presence.  You may be aware of nascent efforts to bring the same
uprobes infrastructure to perf.

> Every kernel developer I have _ever_ seen agrees that all the new
> tracing is a million times superior. [...]

And that is fine.  We believe there is plenty of space in the problem
domain for different approaches.

> ... considering how little the system tap people ever did for the kernel.

Less passionate analysis would identify a long history of contribution
by the the greater affiliated team, including via merged code and by
and passing on requirements and experiences.  We have been trying to
share as much as you have been willing to take.  While systemtap's
current codebase may not (and need not) have a future inside the
kernel, chances are good that improvements in common infrastructure
will allow systemtap to shrink and change enough that the question
becomes moot.


- FChE
