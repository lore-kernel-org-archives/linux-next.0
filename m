From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: linux-next: add utrace tree
Date: Wed, 27 Jan 2010 16:37:22 +0530
Message-ID: <20100127110722.GA28678@linux.vnet.ibm.com>
References: <alpine.LFD.2.00.1001221604190.13231@localhost.localdomain>
	<alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
	<f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com>
	<alpine.LFD.2.00.1001232051510.3574@localhost.localdomain>
	<m33a1tnbd9.fsf@fleche.redhat.com>
	<alpine.LFD.2.00.1001251332370.3574@localhost.localdomain>
	<m3636oh2rt.fsf@fleche.redhat.com>
	<alpine.LFD.2.00.1001261535510.17519@localhost.localdomain>
	<1264575134.4283.1983.camel@laptop>
	<alpine.LFD.2.00.1001270231520.24253@localhost.localdomain>
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <utrace-devel-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1001270231520.24253@localhost.localdomain>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Tom Tromey <tromey@redhat.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

* Linus Torvalds <torvalds@linux-foundation.org> [2010-01-27 02:43:39]:

> 
> 
> On Wed, 27 Jan 2010, Peter Zijlstra wrote:
> > 
> > Right, so you're going to love uprobes, which does exactly that. The
> > current proposal is overwriting the target instruction with an INT3 and
> > injecting an extra vma into the target process's address space
> > containing the original instruction(s) and possible jumps back to the
> > old code stream.
> 
> Just out of interest, how does it handle the threading issue?

I am not sure why threading would be an issue with XOL. Since all
threads of a process would have access to the XOL VMA. 
i.e This XOL VMA is a per-process VMA that gets attached to the process address space 
only when we hit the first breakpoint.
We reserve a slot for each breakpoint in the XOL VMA, whenever the trap
is hit, we jump to the corresponding slot, single step and jump back
after necessary fix-ups.
We have been able to use this approach in multithreaded applications. 
However if you see any issues, can you please let us know?

> 
> Last I saw, at least some CPU people were _very_ nervous about overwriting 
> instructions if another CPU might be just about to execute them.
> 
> Even the "overwrite only the first byte with 'int3'" made them go "umm, I 
> need to talk to some core CPU people to see if that's ok". They mumble 
> about possible CPU errata, I$ coherency, instruction retry etc.

Thats exactly why we waited for threads to queisce before inserting and
deleting the breakpoints. However we were advised by lkml that there are 
better ways to insert/delete breakpoints without quiescing by adjusting
the page table entries similar to what you said just below. And we are
working on switching the page table entry solution.

> 
> I realize kprobes does this very thing, but kprobes is esoteric stuff and 
> doesn't have much choice. In user space, you _could_ do the modification 
> on a different physical page and then just switch the page table entry 
> instead, and not get into the whole D$/I$ coherency thing at all.
> 
> 				Linus
> 

--
Thanks and Regards
Srikar
