From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: tracing tree build failure
Date: Tue, 10 Mar 2009 10:49:39 +0900
Message-ID: <49B5C733.6080005@kernel.org>
References: <20090310115509.328da465.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:37808 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751999AbZCJBu0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Mar 2009 21:50:26 -0400
In-Reply-To: <20090310115509.328da465.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>

Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> kernel/trace/trace_functions_graph.c: In function 'graph_trace_close':
> kernel/trace/trace_functions_graph.c:836: error: implicit declaration of function 'percpu_free'
> 
> The direct cause is commit 422d3c7a577b15e1384c9d4e72a9540896b685fa
> ("tracing: current tip/master can't enable ftrace") from the tracing tree
> which exposed an interaction between commit
> f2a8205c4ef1af917d175c36a4097ae5587791c8 ("percpu: kill percpu_alloc()
> and friends") from the tip-core tree and commit
> 9005f3ebebfcfe9ccd731d16c468907a35ac1f9a ("tracing/function-graph-tracer:
> various fixes and features") from the tracing tree.
> 
> I have reverted commit 422d3c7a577b15e1384c9d4e72a9540896b685fa for
> today.  (As a side note, that commit has no Signed-off-by ...)

Just in case someone doesn't know yet.  The remedy is using
free_percpu() instead of percpu_free().

Thanks.

-- 
tejun
