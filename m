From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [Ksummit-2012-discuss] [ATTEND] stable kernel stuff and grumpy
 maintainers [bisection/rebase/-next]
Date: Thu, 21 Jun 2012 11:51:41 -0400
Message-ID: <1340293901.27036.182.camel@gandalf.stny.rr.com>
References: <1340126635.27036.34.camel@gandalf.stny.rr.com>
	 <4FE0B92D.8020108@windriver.com>
	 <1340128085.27036.46.camel@gandalf.stny.rr.com>
	 <4FE18DFB.5060807@parallels.com>
	 <3908561D78D1C84285E8C5FCA982C28F193223DB@ORSMSX104.amr.corp.intel.com>
	 <20120621034326.GA8601@localhost>
	 <1340280738.27036.130.camel@gandalf.stny.rr.com>
	 <4FE321C2.8010604@parallels.com> <20120621133808.GA14716@localhost>
	 <1340287466.27036.161.camel@gandalf.stny.rr.com>
	 <20120621152649.GA15549@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:8145 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755601Ab2FUPvn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 11:51:43 -0400
In-Reply-To: <20120621152649.GA15549@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Glauber Costa <glommer@parallels.com>, "Luck, Tony" <tony.luck@intel.com>, "ksummit-2012-discuss@lists.linux-foundation.org" <ksummit-2012-discuss@lists.linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, 2012-06-21 at 23:26 +0800, Fengguang Wu wrote:
> On Thu, Jun 21, 2012 at 10:04:26AM -0400, Steven Rostedt wrote:
> > On Thu, 2012-06-21 at 21:38 +0800, Fengguang Wu wrote:
> > 
> > > This is the 0-day kernel testing backend I recently started can help.
> > > 
> > > It runs kernel build/boot tests on each developer's tree and tries to
> > > find and report possible defects within 24 hours. The timely report
> > > can effectively constraint the scope of impact to the related people,
> > > rather than hurting the larger crowd of people in the integration tree.
> > 
> > Perhaps you would be the perfect candidate to house a linux-devel.git
> > repo. Have it set up like so:
> 
> Actually Stephen jumps to my mind at the very start. He has all the
> experiences, tools and infrastructure to maintain such a tree.

I didn't want to burden him more ;-)

> 
> The most important problem may be, how many developers we can attract
> to send pull requests to linux-devel. It would be a good quiz in the KS :-)

Agreed. Of course this is the chicken/egg problem. How do you know how
many developers that it would attract without first doing it.

So far I know of 1 (me ;-)  And I think even GregKH said he liked the
idea.

> 
> FYI, I've added about 170 git trees as my test targets, which contain
> about 550 active branches. I enjoy a lot looking at the freshly cooked
> commits being compiled and ran to the degree to keep the servers busy
> all day :-)

What about trees like my own, where 'master' is very stale, and all the
goodies happen in the other branches. And last I looked, in my public
repo, I have 124 branches!

> 
> > If you do not have the time to set up such a repo, I'm willing to do it.
> > I just do not have the hardware to do the testing that should be done,
> > but as it would be public, others could test it, and report back to me.
> 
> Yeah either way is possible and I can sure carry out tests on it. But
> IMHO Stephen could be the perfect candidate to maintain the tree :)

If he wants to then sure. Otherwise it may become my hobby :-)

-- Steve
