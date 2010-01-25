From: Mark Wielaard <mjw@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Mon, 25 Jan 2010 21:30:53 +0100
Message-ID: <1264451453.3028.59.camel@springer.wildebeest.org>
References: <alpine.LFD.2.00.1001221355250.13231@localhost.localdomain>
	<20100122221348.GA4263@redhat.com>
	<alpine.LFD.2.00.1001221604190.13231@localhost.localdomain>
	<alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
	<f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com>
	<20100123112333.GA15455@elte.hu> <20100123114729.GA7828@redhat.com>
	<20100123194820.GM21263@thunk.org>
	<f73f7ab81001241742t1f827ddetd958e1949787020f@mail.gmail.com>
	<alpine.LFD.2.00.1001250845180.3574@localhost.localdomain>
	<20100125170254.GB22862@redhat.com>
	<alpine.LFD.2.00.1001250930320.3574@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <utrace-devel-bounces@redhat.com>
In-Reply-To: <alpine.LFD.2.00.1001250930320.3574@localhost.localdomain>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, tytso@mit.edu, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

On Mon, 2010-01-25 at 09:36 -0800, Linus Torvalds wrote:
> Upon the information that people are talking about magic new kernel 
> interfaces to do fancy things. And talking about doing things with it that 
> are simply not relevant for ptrace/strace.

Unfortunately ptrace does all that magic already (badly). People don't
just use it for (s)tracing syscalls, but also for tracing signals, for
single step debugging and poking at memory, register state, for process
jailing and virtualization (uml) through syscall emulation.

So when they are talking about these fancy things that is because that
is what ptrace gives them currently. And they hate it, because the
ptrace interface is such a pain to work with. And all these things don't
really work together. You cannot trace, emulate, debug, jail at the same
time.

And all these users have wishes to extend the current ptrace interface
mess. But nobody dares to extend ptrace in any direction because
fixing/cleaning up one of these use cases might break the others in
subtle and not so subtle ways. Which is why the utrace series of patches
is cleaning up all this stuff first.

Cheers,

Mark
