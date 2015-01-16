From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/2 v3] ftrace: don't allow IPMODIFY without proper
 compiler support
Date: Fri, 16 Jan 2015 11:35:39 -0500
Message-ID: <20150116113539.78c093ad@gandalf.local.home>
References: <alpine.LNX.2.00.1412221412360.1680@pobox.suse.cz>
	<20141223094607.GA16445@infradead.org>
	<20141223151056.GA4789@treble.redhat.com>
	<20141226155613.36dd95b9@canb.auug.org.au>
	<20150107144317.61ab2080877a4d8227990551@linux-foundation.org>
	<alpine.LNX.2.00.1501072346400.15299@pobox.suse.cz>
	<20150107153006.60ed354e3458f402e6819b9e@linux-foundation.org>
	<alpine.LNX.2.00.1501080037030.15299@pobox.suse.cz>
	<20150107155701.4839545f63701412003edd88@linux-foundation.org>
	<alpine.LNX.2.00.1501080104190.15299@pobox.suse.cz>
	<54B3C1DD.6090400@hitachi.com>
	<alpine.LNX.2.00.1501132345080.4162@pobox.suse.cz>
	<20150113211223.18908f21@grimm.local.home>
	<alpine.LNX.2.00.1501140945520.4162@pobox.suse.cz>
	<alpine.LNX.2.00.1501151045580.4162@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1501151045580.4162@pobox.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 15 Jan 2015 10:50:07 +0100 (CET)
Jiri Kosina <jkosina@suse.cz> wrote:

> Using IPMODIFY needs to be allowed only with compilers which are 
> guaranteed to generate function prologues compatible with function 
> redirection through changing instruction pointer in saved regs.

That's actually not true.

Sorry, I started thinking about this more, and I disagree with this
change.

> 
> For example changing regs->ip on x86_64 in cases when gcc is using mcount 
> (and not fentry) is not allowed, because at the time mcount call is 
> issued, the original function's prologue has already been executed, which 
> leads to all kinds of inconsistent havoc.

No, it only causes havoc if whoever modifies the ip doesn't know it's
not at the start of the function.

Hence, it's only the user of ftrace that wants to replace functions
that needs to worry about this.

In fact, there's nothing wrong if kprobes to use ftrace to change ip
even if fentry isn't supported. That's because if fentry isn't
supported, kprobes will notice that there's no ftrace call at the start
of a function and will use a breakpoint instead. If a kprobe user still
wants to change the ip after the stack frame was set up, they still can
do that, they just need to find where the mcount call is. kprobe does
its work based on the kernel address to probe, not where ftrace places
its hooks.

Now you could argue that there's no reason to change ip if ftrace isn't
using fentry, but there's nothing to prevent a user from doing so.

It also bothers me that you just prevented all users of kprobes from
taking advantage of hooking to a ftrace caller if fentry isn't
supported. All kprobes really needs is the REGS version supported. 99%
of all kprobes do not modify ip.

I have to say NAK on this change.

Instead, make live kernel patching fail to load if fentry isn't
supported. IOW, instead of ftrace_ipmodify_supported, have a
live_kernel_patching_supported that could be based on fentry being used
or not.

-- Steve


> 
> There is currently no way to express dependency on gcc features in 
> Kconfig, (CC_USING_FENTRY is defined only during build, so it's not 
> possible for Kconfig symbol to depend on it) so this needs to be checked 
> in runtime.
> 
> Mark x86_64 with fentry supported for now. Other archs can be added
> gradually.
> 
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
