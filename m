From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: linux-next: tree build failure
Date: Fri, 16 Jan 2009 08:25:49 +0100
Message-ID: <1232090749.8870.85.camel@laptop>
References: <20090116163745.93f4e075.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:55980 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756946AbZAPH0H (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Jan 2009 02:26:07 -0500
In-Reply-To: <20090116163745.93f4e075.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

On Fri, 2009-01-16 at 16:37 +1100, Stephen Rothwell wrote:
> Hi ,
> 
> Today's linux-next build (powerpc allnoconfig) failed like this:
> 
> In file included from kernel/sched.c:1703:
> kernel/sched_fair.c: In function 'adaptive_gran':
> kernel/sched_fair.c:1324: error: 'struct sched_entity' has no member named 'avg_wakeup'
> 
> Caused by commit e52fb7c097238d34f4d8e2a596f8a3f85b0c0565
> ("sched: prefer wakers") from the sched tree.
> 
> kernel/sched.c: In function 'enqueue_task':
> kernel/sched.c:1752: error: 'struct sched_entity' has no member named 'start_runtime'
> kernel/sched.c: In function 'dequeue_task':
> kernel/sched.c:1767: error: 'struct sched_entity' has no member named 'avg_wakeup'
> kernel/sched.c: In function 'try_to_wake_up':
> kernel/sched.c:2409: error: 'struct sched_entity' has no member named 'start_runtime'
> kernel/sched.c:2410: error: 'struct sched_entity' has no member named 'avg_wakeup'
> kernel/sched.c: In function '__sched_fork':
> kernel/sched.c:2454: error: 'struct sched_entity' has no member named 'start_runtime'
> kernel/sched.c:2455: error: 'struct sched_entity' has no member named 'avg_wakeup'
> 
> Caused by commit 831451ac4e44d3a20b581ce726ef1d1144373f7d ("sched:
> introduce avg_wakeup") from the sched tree.
> 
> These members depend on CONFIG_SCHEDSTATS.

That smells like a bad merge somewhere, I just checked -tip and it looks
like so:

struct sched_entity {
	...
        u64                     avg_overlap;

        u64                     start_runtime;
        u64                     avg_wakeup;

        u64                     nr_migrations;

#ifdef CONFIG_SCHEDSTATS
        u64                     wait_start;
        u64                     wait_max;
	...
};
