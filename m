From: "Frank Ch. Eigler" <fche@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Fri, 22 Jan 2010 15:01:29 -0500
Message-ID: <20100122200129.GG22003@redhat.com>
References: <20100120062834.GB12165@elte.hu> <20100120072925.GA11395@elte.hu>
	<20100121013822.28781960.sfr@canb.auug.org.au>
	<20100122111747.3c224dfd.sfr@canb.auug.org.au>
	<20100121163004.8779bd69.akpm@linux-foundation.org>
	<20100121163145.7e958c3f.akpm@linux-foundation.org>
	<20100122005147.GD22003@redhat.com>
	<20100121170541.7425ff10.akpm@linux-foundation.org>
	<alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
	<20100122182827.GA13185@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <20100122182827.GA13185@redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: Oleg Nesterov <oleg@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

Hi -

oleg wrote:

> [...]
>> I'm personally very dubious that there are any merits to utrace that
>> outweigh the very clear disadvantages: just another layer that adds a new
>> level of abstraction to the only interface that people actually _use_,
>> namely ptrace.
>
> Of course they can't use other interfaces, we don't have them. And
> without the new abstraction layer we will never have, I think.

This is one of the reasons we built, up on request of lkml people, the
utrace-gdbstub prototype (http://lkml.org/lkml/2009/11/30/173).  It
presents a standard userspace debugging interface -- actually, more
standard than ptrace!  It has the potential to be more powerful
feature-wise and perhaps even perform faster than ptrace.  And yet
that RFC didn't receive any on-topic review, only wishes for
unspecified blue-sky integration with kernel debugging.

So then there's uprobes, which is another potential utrace "killer
app", if it weren't so tainted by some peoples' disdain for its
current user, when other users are already being seriously discussed.
So a working prototype, which demonstrates both the utility of utrace
itself and the end-user value of user-space probing, is disregarded.

And there are several smaller utrace clients in the works, each of
them merge candidates in the future.  Yes, most of them may be
rewritten with special-purpose hook after hook as people reinvent the
utrace wheel piece by piece, but how long will that take?  How is the
opportunity cost of missing features valued?

Finally, I don't know how to address the logic of "if a feature
requires utrace, that's a bad argument for utrace" and at the same
time "you need to show a killer app for utrace".  What could possibly
satisfy both of those constraints?  Please advise.


- FChE
