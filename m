From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Fri, 22 Jan 2010 18:45:41 +0100
Message-ID: <20100122174541.GA8945@redhat.com>
References: <20100120054950.GB27108@elte.hu> <20100120061551.GB6588@in.ibm.com> <20100120062834.GB12165@elte.hu> <20100120072925.GA11395@elte.hu> <20100121013822.28781960.sfr@canb.auug.org.au> <20100122111747.3c224dfd.sfr@canb.auug.org.au> <20100121163004.8779bd69.akpm@linux-foundation.org> <20100121163145.7e958c3f.akpm@linux-foundation.org> <20100122005147.GD22003@redhat.com> <20100121170541.7425ff10.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:30055 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754370Ab0AVRqf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jan 2010 12:46:35 -0500
Content-Disposition: inline
In-Reply-To: <20100121170541.7425ff10.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Frank Ch. Eigler" <fche@redhat.com>, Fr??d??ric@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Linus <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>

On 01/21, Andrew Morton wrote:
>
> ptrace is a nasty, complex part of the kernel which has a long history
> of problems, but it's all been pretty quiet in there for the the past few
> years.

Well, yes, I'd say ptrace is "frozen". Nobody add new features/improvements,
only bugfixes.

> This leads one to expect that a rip-out-n-rewrite is a
> high-risk prospect.  So, quite reasonably, one looks for a good reason
> for taking such risk.

As it was already said, utrace was not created to just replace the current
ptrace.

However, speaking of ptrace, imho even ptrace-utrace is more flexible and
allows to improve this api easily.

Just for example, even attach and detach are not trivial to use from
user-space when it comes to multithread tracees. A one-liner patch for
ptrace-utrace can implement PTRACE_DETACH which doesn't need TASK_TRACED,
it is easy to avoid the initial SIGSTOP from attach (which doesn't always
work but strace/gdb relies on it).

Of course, I do not profess this is not posible with the current
implementation. But this will need more changes, and these changes will
touch the code outside of ptrace.c. And in fact I think that any
enhancements in this area will lead to rewrite of the current ptrace
code.

I must admit that personally I think the current ptrace api is unfixable,
we need the new one in the long term. It would be nice to just kill ptrace,
but this is not possible and that is why ptrace-utrace exists. And, if
nothing more, utrace allows to have both old and new ones without any
changes outside of ptrace/utrace code.

Oleg.
