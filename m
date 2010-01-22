From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: add utrace tree
Date: Thu, 21 Jan 2010 17:32:47 -0800 (PST)
Message-ID: <alpine.LFD.2.00.1001211729080.13231@localhost.localdomain>
References: <20100120054950.GB27108@elte.hu> <20100120061551.GB6588@in.ibm.com> <20100120062834.GB12165@elte.hu> <20100120072925.GA11395@elte.hu> <20100121013822.28781960.sfr@canb.auug.org.au> <20100122111747.3c224dfd.sfr@canb.auug.org.au>
 <20100121163004.8779bd69.akpm@linux-foundation.org> <20100121163145.7e958c3f.akpm@linux-foundation.org> <20100122005147.GD22003@redhat.com> <20100121170541.7425ff10.akpm@linux-foundation.org> <20100122012516.GE22003@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:49124 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755698Ab0AVBeN (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jan 2010 20:34:13 -0500
In-Reply-To: <20100122012516.GE22003@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>



On Thu, 21 Jan 2010, Frank Ch. Eigler wrote:
> 
> To the extent the discussion is colored by the new features enabled
> from this refactoring, well, there is Oleg's list which may or may not
> have mentioned enabling systemtap's user-space probing.

Let's face it, system tap isn't going to be merged, so why even bring it 
up? Every kernel developer I have _ever_ seen agrees that all the new 
tracing is a million times superior. I'm sure there are system tap people 
who disagree, but quite frankly, I don't see it being merged considering 
how little the system tap people ever did for the kernel.

So if things like system tap and "security models that go behind the 
kernel by tying into utrace" are the reasons for utrace, color me utterly 
uninterested. In fact, color me actively hostile. I think that's the worst 
possible situation that we'd ever be in as kernel people (namely exactly 
the "do things in kernel space by hiding behind utrace without having 
kernel people involved")

		Linus
