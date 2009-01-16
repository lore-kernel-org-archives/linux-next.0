From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tree build failure
Date: Fri, 16 Jan 2009 13:32:09 +0100
Message-ID: <20090116123209.GA5421@elte.hu>
References: <20090116163745.93f4e075.sfr@canb.auug.org.au> <20090116105324.GA13765@elte.hu> <20090116225342.83891680.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:58544 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756364AbZAPMcX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Jan 2009 07:32:23 -0500
Content-Disposition: inline
In-Reply-To: <20090116225342.83891680.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Fri, 16 Jan 2009 11:53:24 +0100 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Today's linux-next build (powerpc allnoconfig) failed like this:
> > > 
> > > In file included from kernel/sched.c:1703:
> > > kernel/sched_fair.c: In function 'adaptive_gran':
> > > kernel/sched_fair.c:1324: error: 'struct sched_entity' has no member named 'avg_wakeup'
> > > 
> > > Caused by commit e52fb7c097238d34f4d8e2a596f8a3f85b0c0565
> > > ("sched: prefer wakers") from the sched tree.
> > 
> > that commit builds just fine on x86 and on powerpc as well.
> 
> The build was an allnoconfig build, so CONFIG_SCHEDSTATS was not set.

ah, i see. So there's nothing powerpc-specific about this, it fails on x86 
allnoconfig just as much? Is this because you test powerpc as the first 
architecture in the linux-next builds?

I think i see where the mismerge comes from: you dont have the 
perfcounters tree in linux-next which masked this interim stage. I've 
fixed this via the commit below.

	Ingo

-------------------->
>From 34cb61359b503d7aff6447acb037a5efd6ce93b2 Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@elte.hu>
Date: Fri, 16 Jan 2009 13:36:06 +0100
Subject: [PATCH] sched: fix !CONFIG_SCHEDSTATS build failure

Stephen Rothwell reported this linux-next build failure with !CONFIG_SCHEDSTATS:

| In file included from kernel/sched.c:1703:
| kernel/sched_fair.c: In function 'adaptive_gran':
| kernel/sched_fair.c:1324: error: 'struct sched_entity' has no member named 'avg_wakeup'

The start_runtime and avg_wakeup metrics are now not just for statistics,
but also for scheduling - so they always need to be available. (Also
move out the nr_migrations fields - for future perfcounters usage.)

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 include/linux/sched.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index daf4e07..5d56b54 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1031,6 +1031,10 @@ struct sched_entity {
 	u64			last_wakeup;
 	u64			avg_overlap;
 
+	u64			start_runtime;
+	u64			avg_wakeup;
+	u64			nr_migrations;
+
 #ifdef CONFIG_SCHEDSTATS
 	u64			wait_start;
 	u64			wait_max;
@@ -1046,10 +1050,6 @@ struct sched_entity {
 	u64			exec_max;
 	u64			slice_max;
 
-	u64			start_runtime;
-	u64			avg_wakeup;
-
-	u64			nr_migrations;
 	u64			nr_migrations_cold;
 	u64			nr_failed_migrations_affine;
 	u64			nr_failed_migrations_running;
