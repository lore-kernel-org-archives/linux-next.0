From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: add utrace tree
Date: Fri, 29 Jan 2010 10:11:16 +0100
Message-ID: <20100129091116.GB10878@elte.hu>
References: <alpine.LFD.2.00.1001251332370.3574@localhost.localdomain>
 <m3636oh2rt.fsf@fleche.redhat.com>
 <alpine.LFD.2.00.1001261535510.17519@localhost.localdomain>
 <1264575134.4283.1983.camel@laptop>
 <20100127085442.GA28422@elte.hu>
 <1264643539.5068.62.camel@localhost.localdomain>
 <20100128085502.GA7713@elte.hu>
 <1264726768.4933.50.camel@localhost.localdomain>
 <20100129073907.GF14636@elte.hu>
 <20100129075240.GF16920@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:41534 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754675Ab0A2JLh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Jan 2010 04:11:37 -0500
Content-Disposition: inline
In-Reply-To: <20100129075240.GF16920@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Cc: Jim Keniston <jkenisto@us.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Tom Tromey <tromey@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>


* Ananth N Mavinakayanahalli <ananth@in.ibm.com> wrote:

> On Fri, Jan 29, 2010 at 08:39:07AM +0100, Ingo Molnar wrote:
> 
> ...
> 
> > When we merged kprobes ~10 years ago we made the (rather bad) mistake of 
> > merging a raw, opaque facility and leaving 'the rest' up to some other entity. 
> > IBM kprobes hackers vanished the day the original kprobes code went upstream 
> > and the high level entity never truly materialized in-kernel, for nearly a 
> > decade!
> 
> I don't know what you are referring to here... Kprobes was merged in 2.6.9 
> (~August 2004 -- less than 6 years ago). [...]

Ok, 6 years then :-)

> [...] Since then, we did work on ports to powerpc and s390. We implemented 
> kretprobes. We made it much scalable using RCU; we did the powerpc booster 
> to skip single-step when possible, not to mention various bug fixes over the 
> years.

Except it had no real in-kernel user.

> Yes, we did not do the perf integration, but perf did not exist then, 
> either.
> 
> Its simply wrong to say people 'vanished'.

It has certainly was a bit stale for years - and with no real users that's 
certainly not a surprise. That has changed recently so i'm not complaining. We 
just dont want to repeat the same mistake with uprobes.

	Ingo
