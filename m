From: "Frank Ch. Eigler" <fche@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Wed, 20 Jan 2010 08:01:29 -0500
Message-ID: <20100120130129.GH16096@redhat.com>
References: <20100119211646.GF16096@redhat.com> <20100120111220.e7fb4e2c.sfr@canb.auug.org.au> <20100120054950.GB27108@elte.hu> <20100120061551.GB6588@in.ibm.com> <20100120062834.GB12165@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57640 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753025Ab0ATNCy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jan 2010 08:02:54 -0500
Content-Disposition: inline
In-Reply-To: <20100120062834.GB12165@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Linus <torvalds@linux-foundation.org>

Hi -

On Wed, Jan 20, 2010 at 07:28:34AM +0100, Ingo Molnar wrote:
> [...]
> > On the other hand, having ptrace/utrace in the -next tree will give it a
> > lot more testing, while any outstanding technical issues are being addressed.
> 
> Including experimental code that is RFC and which is not certain to go 
> upstream is certainly not the purpose of linux-next though.
> [...]

Ingo, you are mistaken.  The utrace core and utrace/ptrace code were
submitted and reviewed together on lkml, and are not considered
experimental.

I know the names may be confusing, but it is unnecessary to bring up
uprobes and other RFC/experimental items.  None of these are included
in the branch I pointed sfr to.

- FChE
