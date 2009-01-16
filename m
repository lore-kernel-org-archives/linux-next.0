From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tree build failure
Date: Fri, 16 Jan 2009 10:03:55 +0100
Message-ID: <20090116090355.GA4305@elte.hu>
References: <20090116163745.93f4e075.sfr@canb.auug.org.au> <1232090749.8870.85.camel@laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:43811 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756320AbZAPJEM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Jan 2009 04:04:12 -0500
Content-Disposition: inline
In-Reply-To: <1232090749.8870.85.camel@laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Peter Zijlstra <a.p.zijlstra@chello.nl> wrote:

> On Fri, 2009-01-16 at 16:37 +1100, Stephen Rothwell wrote:
> > Hi ,
> > 
> > Today's linux-next build (powerpc allnoconfig) failed like this:
> > 
> > In file included from kernel/sched.c:1703:
> > kernel/sched_fair.c: In function 'adaptive_gran':
> > kernel/sched_fair.c:1324: error: 'struct sched_entity' has no member named 'avg_wakeup'
> > 
> > Caused by commit e52fb7c097238d34f4d8e2a596f8a3f85b0c0565
> > ("sched: prefer wakers") from the sched tree.
> > 
> > kernel/sched.c: In function 'enqueue_task':
> > kernel/sched.c:1752: error: 'struct sched_entity' has no member named 'start_runtime'
> > kernel/sched.c: In function 'dequeue_task':
> > kernel/sched.c:1767: error: 'struct sched_entity' has no member named 'avg_wakeup'
> > kernel/sched.c: In function 'try_to_wake_up':
> > kernel/sched.c:2409: error: 'struct sched_entity' has no member named 'start_runtime'
> > kernel/sched.c:2410: error: 'struct sched_entity' has no member named 'avg_wakeup'
> > kernel/sched.c: In function '__sched_fork':
> > kernel/sched.c:2454: error: 'struct sched_entity' has no member named 'start_runtime'
> > kernel/sched.c:2455: error: 'struct sched_entity' has no member named 'avg_wakeup'
> > 
> > Caused by commit 831451ac4e44d3a20b581ce726ef1d1144373f7d ("sched:
> > introduce avg_wakeup") from the sched tree.
> > 
> > These members depend on CONFIG_SCHEDSTATS.
> 
> That smells like a bad merge somewhere, I just checked -tip and it looks 
> like so:

yep. I zapped the auto-sched-next branch for now.

	Ingo
