From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Ksummit-2012-discuss] [ATTEND] stable kernel stuff and grumpy
 maintainers [bisection/rebase/-next]
Date: Thu, 21 Jun 2012 16:38:41 -0700
Message-ID: <20120621233841.GK2397@linux.vnet.ibm.com>
References: <1340128085.27036.46.camel@gandalf.stny.rr.com>
 <4FE18DFB.5060807@parallels.com>
 <3908561D78D1C84285E8C5FCA982C28F193223DB@ORSMSX104.amr.corp.intel.com>
 <20120621034326.GA8601@localhost>
 <1340280738.27036.130.camel@gandalf.stny.rr.com>
 <4FE321C2.8010604@parallels.com>
 <20120621133808.GA14716@localhost>
 <1340287466.27036.161.camel@gandalf.stny.rr.com>
 <20120621152649.GA15549@localhost>
 <1340293901.27036.182.camel@gandalf.stny.rr.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:58548 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759600Ab2FUXir (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 19:38:47 -0400
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 21 Jun 2012 17:38:47 -0600
Received: from d03relay01.boulder.ibm.com (d03relay01.boulder.ibm.com [9.17.195.226])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id EE19319D804A
	for <linux-next@vger.kernel.org>; Thu, 21 Jun 2012 23:38:40 +0000 (WET)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q5LNchGm233990
	for <linux-next@vger.kernel.org>; Thu, 21 Jun 2012 17:38:43 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q5LNcgU3026305
	for <linux-next@vger.kernel.org>; Thu, 21 Jun 2012 17:38:43 -0600
Content-Disposition: inline
In-Reply-To: <1340293901.27036.182.camel@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>, "ksummit-2012-discuss@lists.linux-foundation.org" <ksummit-2012-discuss@lists.linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, Jun 21, 2012 at 11:51:41AM -0400, Steven Rostedt wrote:
> On Thu, 2012-06-21 at 23:26 +0800, Fengguang Wu wrote:
> > On Thu, Jun 21, 2012 at 10:04:26AM -0400, Steven Rostedt wrote:
> > > On Thu, 2012-06-21 at 21:38 +0800, Fengguang Wu wrote:
> > > 
> > > > This is the 0-day kernel testing backend I recently started can help.
> > > > 
> > > > It runs kernel build/boot tests on each developer's tree and tries to
> > > > find and report possible defects within 24 hours. The timely report
> > > > can effectively constraint the scope of impact to the related people,
> > > > rather than hurting the larger crowd of people in the integration tree.
> > > 
> > > Perhaps you would be the perfect candidate to house a linux-devel.git
> > > repo. Have it set up like so:
> > 
> > Actually Stephen jumps to my mind at the very start. He has all the
> > experiences, tools and infrastructure to maintain such a tree.
> 
> I didn't want to burden him more ;-)
> 
> > 
> > The most important problem may be, how many developers we can attract
> > to send pull requests to linux-devel. It would be a good quiz in the KS :-)
> 
> Agreed. Of course this is the chicken/egg problem. How do you know how
> many developers that it would attract without first doing it.
> 
> So far I know of 1 (me ;-)  And I think even GregKH said he liked the
> idea.
> 
> > 
> > FYI, I've added about 170 git trees as my test targets, which contain
> > about 550 active branches. I enjoy a lot looking at the freshly cooked
> > commits being compiled and ran to the degree to keep the servers busy
> > all day :-)
> 
> What about trees like my own, where 'master' is very stale, and all the
> goodies happen in the other branches. And last I looked, in my public
> repo, I have 124 branches!
> 
> > 
> > > If you do not have the time to set up such a repo, I'm willing to do it.
> > > I just do not have the hardware to do the testing that should be done,
> > > but as it would be public, others could test it, and report back to me.
> > 
> > Yeah either way is possible and I can sure carry out tests on it. But
> > IMHO Stephen could be the perfect candidate to maintain the tree :)
> 
> If he wants to then sure. Otherwise it may become my hobby :-)

Let me make sure that I understand the current state:

1.	Fengguang pulls from my tree (presumably from rcu/next)	
	whenever I push something.  He tests my commits in isolation
	from other maintainers' commits.
	
2.	Stephen also pulls from my tree (rcu/next) whenever I push
	something.  However, Stephen tests the merge of all
	maintainers' commits.

So it sounds to me that Stephen is already doing the job that Steven
is suggesting should be done.

So, what am I missing here?

							Thanx, Paul
