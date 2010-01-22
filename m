From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: linux-next: add utrace tree
Date: Fri, 22 Jan 2010 10:51:39 +0530
Message-ID: <20100122052139.GA20532@in.ibm.com>
References: <20100120061551.GB6588@in.ibm.com> <20100120062834.GB12165@elte.hu> <20100120072925.GA11395@elte.hu> <20100121013822.28781960.sfr@canb.auug.org.au> <20100122111747.3c224dfd.sfr@canb.auug.org.au> <20100121163004.8779bd69.akpm@linux-foundation.org> <20100121163145.7e958c3f.akpm@linux-foundation.org> <20100122005147.GD22003@redhat.com> <20100121170541.7425ff10.akpm@linux-foundation.org> <alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
Reply-To: ananth@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e5.ny.us.ibm.com ([32.97.182.145]:42841 "EHLO e5.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750703Ab0AVFVq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jan 2010 00:21:46 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Frank Ch. Eigler" <fche@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>

On Thu, Jan 21, 2010 at 05:28:42PM -0800, Linus Torvalds wrote:
> 
> 
> On Thu, 21 Jan 2010, Andrew Morton wrote:
> > 
> > ptrace is a nasty, complex part of the kernel which has a long history
> > of problems, but it's all been pretty quiet in there for the the past few
> > years.
> 
> More importantly, we're not ever going to get rid of it. 

FWIW, Oleg's implementation of ptrace over utrace is 100% compatible
with legacy ptrace; gdb testsuite indicates that
(http://lkml.org/lkml/2009/12/21/98).

Ananth
