From: fche@redhat.com (Frank Ch. Eigler)
Subject: Re: linux-next: add utrace tree
Date: Tue, 26 Jan 2010 19:38:45 -0500
Message-ID: <y0m1vhcfkkq.fsf@fche.csb>
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
	<alpine.LFD.2.00.1001251332370.3574@localhost.localdomain>
	<m3636oh2rt.fsf@fleche.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
In-Reply-To: <m3636oh2rt.fsf@fleche.redhat.com> (Tom Tromey's message of "Tue,
	26 Jan 2010 16:20:22 -0700")
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org


tromey wrote:

> [...]
> In non-stop mode (where you can stop one thread but leave the others
> running), gdb wants to have the breakpoints always inserted.  So,
> something must emulate the displaced instruction.

This sounds like the sort of thing that kernel kprobes do, which the
uprobes patch does for userspace.  The gdbstub prototype can use
uprobes for such "displaced" breakpoints, and single-step-out-of-line
to execute them on a few platforms like x86-*.  This is already
prototyped / working.  (gdbstub currently restricts itself to
single-threaded programs only, but that's another todo.)

- FChE
