From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Ksummit-2012-discuss] [ATTEND] stable kernel stuff and grumpy
 maintainers [bisection/rebase/-next]
Date: Thu, 21 Jun 2012 17:03:20 -0700
Message-ID: <20120622000320.GL2397@linux.vnet.ibm.com>
References: <3908561D78D1C84285E8C5FCA982C28F193223DB@ORSMSX104.amr.corp.intel.com>
 <20120621034326.GA8601@localhost>
 <1340280738.27036.130.camel@gandalf.stny.rr.com>
 <4FE321C2.8010604@parallels.com>
 <20120621133808.GA14716@localhost>
 <1340287466.27036.161.camel@gandalf.stny.rr.com>
 <20120621152649.GA15549@localhost>
 <1340293901.27036.182.camel@gandalf.stny.rr.com>
 <20120621233841.GK2397@linux.vnet.ibm.com>
 <1340322348.27036.218.camel@gandalf.stny.rr.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e31.co.us.ibm.com ([32.97.110.149]:39710 "EHLO
	e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760698Ab2FVADz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 20:03:55 -0400
Received: from /spool/local
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 21 Jun 2012 18:03:54 -0600
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com [9.17.195.107])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id D06D51FF001A
	for <linux-next@vger.kernel.org>; Fri, 22 Jun 2012 00:03:32 +0000 (WET)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay05.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q5M03N31232152
	for <linux-next@vger.kernel.org>; Thu, 21 Jun 2012 18:03:29 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q5M03Kqu022795
	for <linux-next@vger.kernel.org>; Thu, 21 Jun 2012 18:03:22 -0600
Content-Disposition: inline
In-Reply-To: <1340322348.27036.218.camel@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>, "ksummit-2012-discuss@lists.linux-foundation.org" <ksummit-2012-discuss@lists.linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, Jun 21, 2012 at 07:45:48PM -0400, Steven Rostedt wrote:
> On Thu, 2012-06-21 at 16:38 -0700, Paul E. McKenney wrote:
> 
> > Let me make sure that I understand the current state:
> > 
> > 1.	Fengguang pulls from my tree (presumably from rcu/next)	
> > 	whenever I push something.  He tests my commits in isolation
> > 	from other maintainers' commits.
> > 	
> > 2.	Stephen also pulls from my tree (rcu/next) whenever I push
> > 	something.  However, Stephen tests the merge of all
> > 	maintainers' commits.
> > 
> > So it sounds to me that Stephen is already doing the job that Steven
> > is suggesting should be done.
> > 
> > So, what am I missing here?
> 
> That linux-next is only for code that's ready for the next release
> cycle.
> 
> What would be nice is a single public repository that holds development
> code that is not ready for the next release cycle, but is in a "working
> state". Basically, one of your "not for inclusion" changes.
> 
> For those of us with test machines, it may be nice that we also perform
> some testing, as Fengguang may not hit all permutations that others may
> find.

So you are suggesting:

3.	Someone pulls from my tree (rcu/dev) whenever I push something,
	and tests the merge of all maintainers' commits.

My rcu/dev branch is often just a preview of rcu/next, but I sometimes
have longer lived topic branches (for example, the current rcu/idle
branch with stuff related to Frederic's work).  So maybe this tree
needs to pull from all of my "rcu/" branches.

							Thanx, Paul
