From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: add utrace tree
Date: Wed, 27 Jan 2010 08:59:52 -0500
Message-ID: <1264600792.31321.464.camel@gandalf.stny.rr.com>
References: <20100121013822.28781960.sfr@canb.auug.org.au>
	 <20100122005147.GD22003@redhat.com>
	 <20100121170541.7425ff10.akpm@linux-foundation.org>
	 <alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
	 <20100122182827.GA13185@redhat.com> <20100122200129.GG22003@redhat.com>
	 <alpine.LFD.2.00.1001221355250.13231@localhost.localdomain>
	 <20100122221348.GA4263@redhat.com>
	 <alpine.LFD.2.00.1001221604190.13231@localhost.localdomain>
	 <alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
	 <f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com>
	 <alpine.LFD.2.00.1001232051510.3574@localhost.localdomain>
	 <m33a1tnbd9.fsf@fleche.redhat.com>
	 <alpine.LFD.2.00.1001251332370.3574@localhost.localdomain>
	 <m3636oh2rt.fsf@fleche.redhat.com>
	 <alpine.LFD.2.00.1001261535510.17519@localhost.localdomain>
	 <1264575134.4283.1983.camel@laptop>
	 <alpine.LFD.2.00.1001270231520.24253@localhost.localdomain>
Reply-To: rostedt@goodmis.org
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:56193 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752088Ab0A0N77 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2010 08:59:59 -0500
In-Reply-To: <alpine.LFD.2.00.1001270231520.24253@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Tom Tromey <tromey@redhat.com>, Kyle Moffett <kyle@moffetthome.net>, "Frank Ch. Eigler" <fche@redhat.com>, Oleg Nesterov <oleg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>, JimKeniston <jkenisto@us.ibm.com>, Arjan van de Ven <arjan@infradead.org>

[ Added Arjan ]

On Wed, 2010-01-27 at 02:43 -0800, Linus Torvalds wrote:
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
> 
> Last I saw, at least some CPU people were _very_ nervous about overwriting 
> instructions if another CPU might be just about to execute them.

I think the issue was that ring 0 was never meant to do that, where as,
ring 3 does it all the time. Doesn't the dynamic library modify its
text?

-- Steve

> 
> Even the "overwrite only the first byte with 'int3'" made them go "umm, I 
> need to talk to some core CPU people to see if that's ok". They mumble 
> about possible CPU errata, I$ coherency, instruction retry etc.
> 
> I realize kprobes does this very thing, but kprobes is esoteric stuff and 
> doesn't have much choice. In user space, you _could_ do the modification 
> on a different physical page and then just switch the page table entry 
> instead, and not get into the whole D$/I$ coherency thing at all.
> 
> 				Linus
