From: Matt Fleming <matt@console-pimps.org>
Subject: Re: linux-next: build failure after merge of the final tree (tip
 tree related)
Date: Mon, 13 Sep 2010 20:17:29 +0100
Message-ID: <20100913191729.GA6440@console-pimps.org>
References: <20100914000613.51fdba90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from arkanian.console-pimps.org ([212.110.184.194]:39515 "EHLO
	arkanian.console-pimps.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752444Ab0IMTRb (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Sep 2010 15:17:31 -0400
Content-Disposition: inline
In-Reply-To: <20100914000613.51fdba90.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>

On Tue, Sep 14, 2010 at 12:06:13AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (many sh configs)
> failed like this:
> 
> arch/sh/kernel/perf_event.c: In function 'sh_pmu_setup':
> arch/sh/kernel/perf_event.c:342: error: parameter 'cpuhw' is initialized
> 
> And it went down hill from there.
> 
> Caused by commit b0a873ebbf87bf38bf70b5e39a7cadc96099fa13 ("perf:
> Register PMU implementations") which removed the opening brace of that
> function.

3f6da390 ("perf: Rework and fix the arch CPU-hotplug hooks") introduced
this breakage. sh_pmu_setup() is missing an opening curly brace, e.g.

diff --git a/arch/sh/kernel/perf_event.c b/arch/sh/kernel/perf_event.c
index cf39c48..036f7a9 100644
--- a/arch/sh/kernel/perf_event.c
+++ b/arch/sh/kernel/perf_event.c
@@ -338,7 +338,7 @@ static struct pmu pmu = {
 };
 
 static void sh_pmu_setup(int cpu)
-
+{
 	struct cpu_hw_events *cpuhw = &per_cpu(cpu_hw_events, cpu);
 
 	memset(cpuhw, 0, sizeof(struct cpu_hw_events));
