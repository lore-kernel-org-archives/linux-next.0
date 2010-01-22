From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: add utrace tree
Date: Thu, 21 Jan 2010 17:28:42 -0800 (PST)
Message-ID: <alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
References: <20100119211646.GF16096@redhat.com> <20100120111220.e7fb4e2c.sfr@canb.auug.org.au> <20100120054950.GB27108@elte.hu> <20100120061551.GB6588@in.ibm.com> <20100120062834.GB12165@elte.hu> <20100120072925.GA11395@elte.hu> <20100121013822.28781960.sfr@canb.auug.org.au>
 <20100122111747.3c224dfd.sfr@canb.auug.org.au> <20100121163004.8779bd69.akpm@linux-foundation.org> <20100121163145.7e958c3f.akpm@linux-foundation.org> <20100122005147.GD22003@redhat.com> <20100121170541.7425ff10.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:60553 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754113Ab0AVBaI (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jan 2010 20:30:08 -0500
In-Reply-To: <20100121170541.7425ff10.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Frank Ch. Eigler" <fche@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>



On Thu, 21 Jan 2010, Andrew Morton wrote:
> 
> ptrace is a nasty, complex part of the kernel which has a long history
> of problems, but it's all been pretty quiet in there for the the past few
> years.

More importantly, we're not ever going to get rid of it. 

Quite frankly, judging my all past history we have ever seen in kernel 
interfaces, new an non-portable interfaces simply are never used. The 
whole question whether they are nicer or not is entirely immaterial. 

I'm personally very dubious that there are any merits to utrace that 
outweigh the very clear disadvantages: just another layer that adds a new 
level of abstraction to the only interface that people actually _use_, 
namely ptrace.

But I haven't followed utrace. I doubt _anybody_ has, except for the 
utrace people themselves.

			Linus
