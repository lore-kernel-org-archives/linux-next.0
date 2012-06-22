From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [Ksummit-2012-discuss] [ATTEND] stable kernel stuff and grumpy
 maintainers [bisection/rebase/-next]
Date: Thu, 21 Jun 2012 20:29:55 -0400
Message-ID: <1340324995.27036.221.camel@gandalf.stny.rr.com>
References: <3908561D78D1C84285E8C5FCA982C28F193223DB@ORSMSX104.amr.corp.intel.com>
	 <20120621034326.GA8601@localhost>
	 <1340280738.27036.130.camel@gandalf.stny.rr.com>
	 <4FE321C2.8010604@parallels.com> <20120621133808.GA14716@localhost>
	 <1340287466.27036.161.camel@gandalf.stny.rr.com>
	 <20120621152649.GA15549@localhost>
	 <1340293901.27036.182.camel@gandalf.stny.rr.com>
	 <20120621233841.GK2397@linux.vnet.ibm.com>
	 <1340322348.27036.218.camel@gandalf.stny.rr.com>
	 <20120622000320.GL2397@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:10459 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760686Ab2FVA35 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 20:29:57 -0400
In-Reply-To: <20120622000320.GL2397@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Fengguang Wu <fengguang.wu@intel.com>, "ksummit-2012-discuss@lists.linux-foundation.org" <ksummit-2012-discuss@lists.linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, 2012-06-21 at 17:03 -0700, Paul E. McKenney wrote:

> So you are suggesting:
> 
> 3.	Someone pulls from my tree (rcu/dev) whenever I push something,
> 	and tests the merge of all maintainers' commits.
> 
> My rcu/dev branch is often just a preview of rcu/next, but I sometimes
> have longer lived topic branches (for example, the current rcu/idle
> branch with stuff related to Frederic's work).  So maybe this tree
> needs to pull from all of my "rcu/" branches.

Exactly! :-)

-- Steve
