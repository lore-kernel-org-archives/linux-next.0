From: fche@redhat.com (Frank Ch. Eigler)
Subject: Re: linux-next: add utrace tree
Date: Fri, 29 Jan 2010 13:13:47 -0500
Message-ID: <y0mr5p893tw.fsf@fche.csb>
References: <alpine.LFD.2.00.1001232051510.3574@localhost.localdomain>
	<m33a1tnbd9.fsf@fleche.redhat.com>
	<alpine.LFD.2.00.1001251332370.3574@localhost.localdomain>
	<m3636oh2rt.fsf@fleche.redhat.com>
	<alpine.LFD.2.00.1001261535510.17519@localhost.localdomain>
	<1264575134.4283.1983.camel@laptop> <20100127085442.GA28422@elte.hu>
	<1264643539.5068.62.camel@localhost.localdomain>
	<20100128085502.GA7713@elte.hu>
	<1264726768.4933.50.camel@localhost.localdomain>
	<20100129073907.GF14636@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
In-Reply-To: <20100129073907.GF14636@elte.hu> (Ingo Molnar's message of "Fri,
	29 Jan 2010 08:39:07 +0100")
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Tom Tromey <tromey@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

Ingo Molnar <mingo@elte.hu> writes:

> [...] So, to sum it up: utrace XOL, which is rather complex already,
> needs even more complexity (which is not yet implemented) than the
> much simpler common-case emulator approach i outlined, just to break
> even with the performance of the much simpler approach. [...]

Is it an uncontroversial claim that emulation of CISC instructions
should perform better than their native execution, followed by an int3
(as in the simplest working scheme) or boosting (as done by kprobes)?
>From my experience with simulators, "simple" software emulation of
cpus can be hundreds of times slower or worse than native execution.

- FChE
