From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: linux-next: tracing tree build failure
Date: Tue, 10 Mar 2009 11:16:37 +0900 (JST)
Message-ID: <20090310111435.A486.A69D9226@jp.fujitsu.com>
References: <20090310115509.328da465.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37]:55211 "EHLO
	fgwmail7.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752046AbZCJCQo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Mar 2009 22:16:44 -0400
Received: from m3.gw.fujitsu.co.jp ([10.0.50.73])
	by fgwmail7.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id n2A2GdBm018986
	for <linux-next@vger.kernel.org> (envelope-from kosaki.motohiro@jp.fujitsu.com);
	Tue, 10 Mar 2009 11:16:42 +0900
Received: from smail (m3 [127.0.0.1])
	by outgoing.m3.gw.fujitsu.co.jp (Postfix) with ESMTP id 9307845DD7D
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2009 11:16:39 +0900 (JST)
Received: from s3.gw.fujitsu.co.jp (s3.gw.fujitsu.co.jp [10.0.50.93])
	by m3.gw.fujitsu.co.jp (Postfix) with ESMTP id 6E6EC45DD78
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2009 11:16:39 +0900 (JST)
Received: from s3.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s3.gw.fujitsu.co.jp (Postfix) with ESMTP id 48E551DB8042
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2009 11:16:39 +0900 (JST)
Received: from m107.s.css.fujitsu.com (m107.s.css.fujitsu.com [10.249.87.107])
	by s3.gw.fujitsu.co.jp (Postfix) with ESMTP id 05BB41DB8043
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2009 11:16:39 +0900 (JST)
In-Reply-To: <20090310115509.328da465.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kosaki.motohiro@jp.fujitsu.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>

Hi Stephen,

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

I checked latest -tip tree and I found Ingo fixed this issue by following commit.
Could you please try to pull latest tip tree?


commit 56bc29b4b8e188275f52cd5270bcf54f22cfc92b
Author: Ingo Molnar <mingo@elte.hu>
Date:   Thu Mar 5 22:04:39 2009 +0100

    merge conflict resolutions
