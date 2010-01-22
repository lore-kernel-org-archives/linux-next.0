From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Fri, 22 Jan 2010 19:28:27 +0100
Message-ID: <20100122182827.GA13185@redhat.com>
References: <20100120061551.GB6588@in.ibm.com> <20100120062834.GB12165@elte.hu>
	<20100120072925.GA11395@elte.hu>
	<20100121013822.28781960.sfr@canb.auug.org.au>
	<20100122111747.3c224dfd.sfr@canb.auug.org.au>
	<20100121163004.8779bd69.akpm@linux-foundation.org>
	<20100121163145.7e958c3f.akpm@linux-foundation.org>
	<20100122005147.GD22003@redhat.com>
	<20100121170541.7425ff10.akpm@linux-foundation.org>
	<alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

On 01/21, Linus Torvalds wrote:
>
> On Thu, 21 Jan 2010, Andrew Morton wrote:
> >
> > ptrace is a nasty, complex part of the kernel which has a long history
> > of problems, but it's all been pretty quiet in there for the the past few
> > years.
>
> More importantly, we're not ever going to get rid of it.

Unfortunately, you are right. The current ptrace (as it is visible from
user-space) should stay forever.

> Quite frankly, judging my all past history we have ever seen in kernel
> interfaces, new an non-portable interfaces simply are never used. The
> whole question whether they are nicer or not is entirely immaterial.

I have to admit this point looks very reasonable to me. Except, can't
resist, ptrace itself is hardly portable.

> I'm personally very dubious that there are any merits to utrace that
> outweigh the very clear disadvantages: just another layer that adds a new
> level of abstraction to the only interface that people actually _use_,
> namely ptrace.

Of course they can't use other interfaces, we don't have them. And
without the new abstraction layer we will never have, I think.

Oleg.
