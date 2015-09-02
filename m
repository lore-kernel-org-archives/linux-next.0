From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Tue, 1 Sep 2015 22:26:13 -0700
Message-ID: <20150902052612.GK4029@linux.vnet.ibm.com>
References: <20150901135006.78be270e@canb.auug.org.au>
 <20150901074946.GF4029@linux.vnet.ibm.com>
 <20150902135800.068f0f4a@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:38093 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750842AbbIBF0S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2015 01:26:18 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 1 Sep 2015 23:26:17 -0600
Content-Disposition: inline
In-Reply-To: <20150902135800.068f0f4a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>

On Wed, Sep 02, 2015 at 01:58:00PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Tue, 1 Sep 2015 00:49:46 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> >
> > On Tue, Sep 01, 2015 at 01:50:06PM +1000, Stephen Rothwell wrote:
> > > 
> > > After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > > 
> > > ERROR: "sched_setscheduler_nocheck" [kernel/locking/locktorture.ko] undefined!
> > > ERROR: "percpu_down_write" [kernel/locking/locktorture.ko] undefined!
> > > ERROR: "percpu_up_write" [kernel/locking/locktorture.ko] undefined!
> > > ERROR: "percpu_down_read" [kernel/locking/locktorture.ko] undefined!
> > > ERROR: "percpu_up_read" [kernel/locking/locktorture.ko] undefined!
> > > ERROR: "__percpu_init_rwsem" [kernel/locking/locktorture.ko] undefined!
> > > 
> > > Caused by commits
> > > 
> > >   04be76a9b067 ("locktorture: Support rtmutex torturing")
> > >   40b2996f9b32 ("locktorture: Add torture tests for percpu_rwsem")
> > > 
> > > and maybe more.
> > > 
> > > I have used the rcu tree from next-20150831 for today.
> > 
> > It is looking like I will be deferring these to v4.4, apologies for
> > the hassle!
> 
> This still fails to build but now I only get the error about
> sched_setscheduler_nocheck.

OK, now I actually have deferred these to v4.4.

Davidlohr, the error is due to sched_setscheduler_nocheck() not being
exported, so that Stephen gets this failure when building modules.
This is 04be76a9b067 (locktorture: Support rtmutex torturing) in -rcu.

Thoughts?

							Thanx, Paul
