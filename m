From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Fri, 15 Aug 2008 09:56:14 +0200
Message-ID: <20080815075614.GA3010@elte.hu>
References: <20080815122743.9715a5e1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:34790 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751317AbYHOH4g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 03:56:36 -0400
Content-Disposition: inline
In-Reply-To: <20080815122743.9715a5e1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> kernel/trace/ftrace.c: In function 'ftrace_record_ip':
> kernel/trace/ftrace.c:345: error: implicit declaration of function 'in_nmi'
> 
> Caused by commit 431e94644bde07a327dea17ee9be297c3d44a876 ("ftrace: do
> not trace NMI contexts").
> 
> in_nmi() is not defined as a function (or macro) anywhere in my kernel 
> tree, so I assume a patch was missed. More care, please.
> 
> I reverted the above commit.

hm, it's present in my tree and has been there for a long time:

| commit 0d84b78a606f1562532cd576ee8733caf5a4aed3
| Author: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
| Date:   Mon May 12 21:21:07 2008 +0200
|
|    x86 NMI-safe INT3 and Page Fault

what happened is that i restructured the integration branches yesterday 
and moved the tracing/nmisafe from auto-ftrace-next to auto-latest - 
without realizing the dependency. I fixed that now and pushed out the 
updated auto-ftrace-next branch.

	Ingo
