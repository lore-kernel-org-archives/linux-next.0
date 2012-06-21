From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [Ksummit-2012-discuss] [ATTEND] stable kernel stuff and grumpy
 maintainers [bisection/rebase/-next]
Date: Thu, 21 Jun 2012 19:45:48 -0400
Message-ID: <1340322348.27036.218.camel@gandalf.stny.rr.com>
References: <1340128085.27036.46.camel@gandalf.stny.rr.com>
	 <4FE18DFB.5060807@parallels.com>
	 <3908561D78D1C84285E8C5FCA982C28F193223DB@ORSMSX104.amr.corp.intel.com>
	 <20120621034326.GA8601@localhost>
	 <1340280738.27036.130.camel@gandalf.stny.rr.com>
	 <4FE321C2.8010604@parallels.com> <20120621133808.GA14716@localhost>
	 <1340287466.27036.161.camel@gandalf.stny.rr.com>
	 <20120621152649.GA15549@localhost>
	 <1340293901.27036.182.camel@gandalf.stny.rr.com>
	 <20120621233841.GK2397@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:18799 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759758Ab2FUXpu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 19:45:50 -0400
In-Reply-To: <20120621233841.GK2397@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Fengguang Wu <fengguang.wu@intel.com>, "ksummit-2012-discuss@lists.linux-foundation.org" <ksummit-2012-discuss@lists.linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, 2012-06-21 at 16:38 -0700, Paul E. McKenney wrote:

> Let me make sure that I understand the current state:
> 
> 1.	Fengguang pulls from my tree (presumably from rcu/next)	
> 	whenever I push something.  He tests my commits in isolation
> 	from other maintainers' commits.
> 	
> 2.	Stephen also pulls from my tree (rcu/next) whenever I push
> 	something.  However, Stephen tests the merge of all
> 	maintainers' commits.
> 
> So it sounds to me that Stephen is already doing the job that Steven
> is suggesting should be done.
> 
> So, what am I missing here?

That linux-next is only for code that's ready for the next release
cycle.

What would be nice is a single public repository that holds development
code that is not ready for the next release cycle, but is in a "working
state". Basically, one of your "not for inclusion" changes.

For those of us with test machines, it may be nice that we also perform
some testing, as Fengguang may not hit all permutations that others may
find.

-- Steve
 
