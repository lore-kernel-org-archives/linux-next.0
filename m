From: Tom Tromey <tromey@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Mon, 25 Jan 2010 14:05:54 -0700
Message-ID: <m33a1tnbd9.fsf@fleche.redhat.com>
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
Reply-To: tromey@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
In-Reply-To: <alpine.LFD.2.00.1001232051510.3574@localhost.localdomain> (Linus
	Torvalds's message of "Sat, 23 Jan 2010 21:04:56 -0800 (PST)")
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

>>>>> "Linus" == Linus Torvalds <torvalds@linux-foundation.org> writes:

Linus> No. There is absolutely _no_ reason to believe that gdb et al would ever 
Linus> delete the ptrace interfaces anyway. 

Yes, in GDB we approximately never delete anything.

Nevertheless, if the Linux kernel were to present a new user-space API,
and if it had an advantage over ptrace, then we would port GDB to use
it.  There are other platforms where, IIRC, we now use some /proc thing
instead of ptrace.

There are definitely things we would like from such an API.  Here's a
few I can think of immediately, there are probably others.

* Use an fd, not SIGCHLD+wait, to report inferior state changes to gdb.
  Internally we're already using a self-pipe to integrate this into
  gdb's main loop.  Relatedly, don't mess with the inferior's parentage.

* Support "displaced stepping" in the kernel; I think this would improve
  performance when debugging in non-stop mode.

* Support some kind of breakpoint expression in the kernel; this would
  improve performance of conditional breakpoints.  Perhaps the existing
  gdb agent expressions could be used.

Tom
