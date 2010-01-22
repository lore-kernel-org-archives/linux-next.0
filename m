From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Fri, 22 Jan 2010 21:51:12 +0100
Message-ID: <20100122205112.GA20716@redhat.com>
References: <20100121013822.28781960.sfr@canb.auug.org.au> <20100122111747.3c224dfd.sfr@canb.auug.org.au> <20100121163004.8779bd69.akpm@linux-foundation.org> <20100121163145.7e958c3f.akpm@linux-foundation.org> <20100122005147.GD22003@redhat.com> <20100121170541.7425ff10.akpm@linux-foundation.org> <20100122012516.GE22003@redhat.com> <alpine.LFD.2.00.1001211729080.13231@localhost.localdomain> <20100122022255.GF22003@redhat.com> <alpine.LFD.2.00.1001211826060.13231@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:21894 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753819Ab0AVUv7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jan 2010 15:51:59 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1001211826060.13231@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Frank Ch. Eigler" <fche@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com

On 01/21, Linus Torvalds wrote:
>
> I realize that my argument is very anti-thetical to the normal CS teaching
> of "general-purpose is good". I often feel that very specific code with
> very clearly defined (and limited) applicability is a good thing - I'd
> rather have just a very specific ptrace layer that does nothing but
> ptrace, than a "generic plugin layer that can be layered under ptrace and
> other things".

I am repeating the same (and probably poor) arguments, but we don't have a
clearly defined ptrace layer. The current code is just the set of precedents,
I mean, "this code does this because we always did this for unknown reason".
And we can't fix it without breaking things. Even the obvious bugs which
could be fixed by the very simple patch should be preserved sometimes.
In fact, afaics the current state is: if it can't crash the kernel - it is
not the bug.

Otoh, ptrace is very limited, yes. Imho - too limited. And, as a user-space
api, it is just horrible.

However: "we're not ever going to get rid of it". Yes, sure.


But I am afraid this all is almost off-topic. Afaik, utrace was not created
to solve the problems with ptrace, at least I am sure this wasn't the only
goal.

Unfortunately, I didn't participate in other projects which use utrace.
Even if I did, I don't know how could I prove they are "important enough"
to have a generic layer to make other things possible.

Oleg.
