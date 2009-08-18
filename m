From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [S390] ftrace: update system call tracer support
Date: Tue, 18 Aug 2009 12:05:26 +0200
Message-ID: <20090818100526.GA14374@elte.hu>
References: <1250016545-6601-1-git-send-email-fweisbec@gmail.com> <20090812091133.GA21655@elte.hu> <20090818004654.GA4402@linux-sh.org> <20090818073211.GA26670@elte.hu> <20090818085110.GA2074@elte.hu> <20090818105927.30f6a140@skybase>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:41379 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754266AbZHRKF4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Aug 2009 06:05:56 -0400
Content-Disposition: inline
In-Reply-To: <20090818105927.30f6a140@skybase>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jason Baron <jbaron@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Lai Jiangshan <laijs@cn.fujitsu.com>, Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jiaying Zhang <jiayingz@google.com>, Martin Bligh <mbligh@google.com>, Li Zefan <lizf@cn.fujitsu.com>, Masami Hiramatsu <mhiramat@redhat.com>, Wu Zhangjin <wuzj@lemote.com>, linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>


* Martin Schwidefsky <schwidefsky@de.ibm.com> wrote:

> On Tue, 18 Aug 2009 10:51:10 +0200
> Ingo Molnar <mingo@elte.hu> wrote:
> 
> > 
> > * Ingo Molnar <mingo@elte.hu> wrote:
> > 
> > > * Paul Mundt <lethal@linux-sh.org> wrote:
> > > 
> > > > [ Adding to Cc everyone that now has a broken tree thanks to this .. ]
> > > > 
> > > > On Wed, Aug 12, 2009 at 11:11:33AM +0200, Ingo Molnar wrote:
> > > > > * Frederic Weisbecker <fweisbec@gmail.com> wrote:
> > > > > > This pull request integrate one cleanup/fix for ftrace and an 
> > > > > > update for syscall tracing: the migration from old-style tracer to 
> > > > > > individual tracepoints/trace_events and the support for perf 
> > > > > > counter.
> > > > > > 
> > > > > > I've tested it with success either with ftrace (every syscall 
> > > > > > tracepoints enabled at the same time without problems) and with 
> > > > > > perfcounter.
> > > > > > 
> > > > > > May be one drawback: it creates so much trace events that the 
> > > > > > ftrace selftests can take some time :-)
> > > > > 
> > > > > Pulled, thanks a lot!
> > > > 
> > > > And this has now subsequently broken every single SH and S390 
> > > > configuration, [...]
> > > 
> > > I test SH cross-builds regularly. I just checked the SH defconfig 
> > > and it builds just fine here:
> > > 
> > > $ make -j32 CROSS_COMPILE=sh3-linux- ARCH=sh vmlinux
> > 
> > The s390 build indeed broke. (This got masked by the s390 toolchain 
> > i'm using not having been able to build Linus's tree - i fixed 
> > that.)
> > 
> > Could you try the fix below? It does the trick here.
> > 
> > Martin, Heiko - does the fix look good to you? regs->gprs[2] seems 
> > to be the register used for both the syscall number (enter 
> > callback) and for the return code (exit callback).
> 
> Correct, for do_syscall_trace_{enter,exit} the code in entry.S 
> stores the system call number in regs->gprs[2]. The fix is fine. 
> Thanks Ingo.

Thanks, i've added your Acked-by to the commit. I suspect you dont 
want to pull tracing infrastructure changes into the S390 tree, so 
keeping this fix in the tracing tree would be the best option?

	Ingo
