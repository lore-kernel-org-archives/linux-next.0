From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: add utrace tree
Date: Mon, 25 Jan 2010 13:41:57 -0800 (PST)
Message-ID: <alpine.LFD.2.00.1001251332370.3574@localhost.localdomain>
References: <20100121013822.28781960.sfr@canb.auug.org.au>
	<20100122005147.GD22003@redhat.com>
	<20100121170541.7425ff10.akpm@linux-foundation.org>
	<alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
	<20100122182827.GA13185@redhat.com>
	<20100122200129.GG22003@redhat.com>
	<alpine.LFD.2.00.1001221355250.13231@localhost.localdomain>
	<20100122221348.GA4263@redhat.com>
	<alpine.LFD.2.00.1001221604190.13231@localhost.localdomain>
	<alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
	<f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com>
	<alpine.LFD.2.00.1001232051510.3574@localhost.localdomain>
	<m33a1tnbd9.fsf@fleche.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <utrace-devel-bounces@redhat.com>
In-Reply-To: <m33a1tnbd9.fsf@fleche.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: Tom Tromey <tromey@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org



On Mon, 25 Jan 2010, Tom Tromey wrote:
> 
> There are definitely things we would like from such an API.  Here's a
> few I can think of immediately, there are probably others.
> 
> * Use an fd, not SIGCHLD+wait, to report inferior state changes to gdb.
>   Internally we're already using a self-pipe to integrate this into
>   gdb's main loop.  Relatedly, don't mess with the inferior's parentage.

As I kind of alluded to elsewhere, I heartily agree with this. The really 
major design mistake of ptrace (as opposed to just various ugly corners) 
is how it has no connection information, and that ends up being one of the 
main reasons why you can't have two ptracers working on the same thing.

(There are other things that complicate that too, of course, like simply 
just trying to manage various per-thread state like debug registers etc, 
but that's a separate class of complications).

> * Support "displaced stepping" in the kernel; I think this would improve
>   performance when debugging in non-stop mode.

Don't we already do that at least on x86? Just doing a single-step should 
work on an instruction even if it has a breakpoint on it, because we set 
the TF bit.

Or maybe I'm not understanding what displaced stepping means to you.

> * Support some kind of breakpoint expression in the kernel; this would
>   improve performance of conditional breakpoints.  Perhaps the existing
>   gdb agent expressions could be used.

I suspect it might be reasonable to do simple expressions on breakpoints, 
but not the kind of things gdb exports to users. IOW, maybe you could have 
a single conditional on a single value (register or memory) associated 
with an expression.

Regardless, internally to the kernel your two later issues are "details". 
The "how to connect to the debuggee" is a much more fundamental issue, and 
has the biggest design/interface impact. The other would likely just be 
new ptrace command extensions that somebody would have to just implement 
the grotty details on.

		Linus
