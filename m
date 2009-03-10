From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tracing tree build failure
Date: Tue, 10 Mar 2009 10:10:10 +0100
Message-ID: <20090310091010.GD3097@elte.hu>
References: <20090310115509.328da465.sfr@canb.auug.org.au> <49B5C733.6080005@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:33776 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753399AbZCJJK1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 05:10:27 -0400
Content-Disposition: inline
In-Reply-To: <49B5C733.6080005@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>


* Tejun Heo <tj@kernel.org> wrote:

> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > kernel/trace/trace_functions_graph.c: In function 'graph_trace_close':
> > kernel/trace/trace_functions_graph.c:836: error: implicit declaration of function 'percpu_free'
> > 
> > The direct cause is commit 422d3c7a577b15e1384c9d4e72a9540896b685fa
> > ("tracing: current tip/master can't enable ftrace") from the tracing tree
> > which exposed an interaction between commit
> > f2a8205c4ef1af917d175c36a4097ae5587791c8 ("percpu: kill percpu_alloc()
> > and friends") from the tip-core tree and commit
> > 9005f3ebebfcfe9ccd731d16c468907a35ac1f9a ("tracing/function-graph-tracer:
> > various fixes and features") from the tracing tree.
> > 
> > I have reverted commit 422d3c7a577b15e1384c9d4e72a9540896b685fa for
> > today.  (As a side note, that commit has no Signed-off-by ...)
> 
> Just in case someone doesn't know yet.  The remedy is using
> free_percpu() instead of percpu_free().

That's exactly how it was resolved more than two weeks ago in 
tip:master - and has been resolved in tip:master since then.

I'm glad to hear about new bugs, but the amount of false 
positives from linux-next is wasting a lot of time - the 
duplication rate is above 90% which is way too much.

tip:master is a full, well-tested integration of all those 
branches. It would be nice if Stephen investigated tip:master 
before reporting such solved-long-ago interactions.

	Ingo
