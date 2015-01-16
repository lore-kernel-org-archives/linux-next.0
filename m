From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/2 v3] ftrace: don't allow IPMODIFY without proper
 compiler support
Date: Fri, 16 Jan 2015 11:53:02 -0500
Message-ID: <20150116115302.0897b895@gandalf.local.home>
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
	<20150116113539.78c093ad@gandalf.local.home>
	<alpine.LNX.2.10.1501161737320.1074@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.10.1501161737320.1074@wotan.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 16 Jan 2015 17:41:58 +0100 (CET)
Jiri Kosina <jkosina@suse.cz> wrote:

> On Fri, 16 Jan 2015, Steven Rostedt wrote:
> 
> > Instead, make live kernel patching fail to load if fentry isn't 
> > supported. IOW, instead of ftrace_ipmodify_supported, have a 
> > live_kernel_patching_supported that could be based on fentry being used 
> > or not.
> 
> I can live with that, we are handling non-fentry case ourselves already.
> 
> You expressed that you would accept such patch for ftrace in a past, so I 

Right, but then I thought about it more :-)

I had a lot of time thinking about things like this while debugging
the dance between function graph and jprobes.

> thought I'll move it out from livepatching to ftrace. But if you don't 
> want it now, that's not a big issue, and handling the possible fallout 
> stays the responsibility of ftrace_ops "owner".
> 

Exactly!

-- Steve
