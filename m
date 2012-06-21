From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [Ksummit-2012-discuss] [ATTEND] stable kernel stuff and grumpy
 maintainers [bisection/rebase/-next]
Date: Thu, 21 Jun 2012 23:26:49 +0800
Message-ID: <20120621152649.GA15549@localhost>
References: <1340126635.27036.34.camel@gandalf.stny.rr.com>
 <4FE0B92D.8020108@windriver.com>
 <1340128085.27036.46.camel@gandalf.stny.rr.com>
 <4FE18DFB.5060807@parallels.com>
 <3908561D78D1C84285E8C5FCA982C28F193223DB@ORSMSX104.amr.corp.intel.com>
 <20120621034326.GA8601@localhost>
 <1340280738.27036.130.camel@gandalf.stny.rr.com>
 <4FE321C2.8010604@parallels.com>
 <20120621133808.GA14716@localhost>
 <1340287466.27036.161.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:33063 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759401Ab2FUP0x (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jun 2012 11:26:53 -0400
Content-Disposition: inline
In-Reply-To: <1340287466.27036.161.camel@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Glauber Costa <glommer@parallels.com>, "Luck, Tony" <tony.luck@intel.com>, "ksummit-2012-discuss@lists.linux-foundation.org" <ksummit-2012-discuss@lists.linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, Jun 21, 2012 at 10:04:26AM -0400, Steven Rostedt wrote:
> On Thu, 2012-06-21 at 21:38 +0800, Fengguang Wu wrote:
> 
> > This is the 0-day kernel testing backend I recently started can help.
> > 
> > It runs kernel build/boot tests on each developer's tree and tries to
> > find and report possible defects within 24 hours. The timely report
> > can effectively constraint the scope of impact to the related people,
> > rather than hurting the larger crowd of people in the integration tree.
> 
> Perhaps you would be the perfect candidate to house a linux-devel.git
> repo. Have it set up like so:

Actually Stephen jumps to my mind at the very start. He has all the
experiences, tools and infrastructure to maintain such a tree.

The most important problem may be, how many developers we can attract
to send pull requests to linux-devel. It would be a good quiz in the KS :-)

> master                  - holds an integration of set branches *
> 
> include-developer-topic - holds a branch that a developer has asked you 
>                           to pull from. This is is also integrated into
>                           the master branch as the developer may request
> 
> exclude-developer-topic - holds a branch that a developer has asked you
>                           to pull from. The difference between the above
>                           is that this branch is not to be integrated
>                           into master. It may cause unneeded conflicts
>                           that need to be settled still (even the -rt
>                           tree can go here).
> 
> Basically have a series of branches like:
> 
> include-jejb-scsi
> include-rostedt-ftrace-multi-buf
> include-jiri-sched-deadline
> exclude-rostedt-preempt-rt
> [..]
> 
> 
> * master would be an integration of all include-* branches. If one of
> those branches are found to be broken, then you can rebase master to
> exclude it, send an email to the owner of that branch and tell them it
> will not be included until they fix it.
> 
> Any branch that starts suffering bit rot, you can send an email to that
> developer to ask them if its still valid. If not, just nuke the branch.
> If it is, encourage them to do more work on it or explain why it's
> suffering from rot, otherwise just nuke it anyway.
> 
> This is much easier to do with git than quilt, which is why I do not
> believe this will be like -mm, and mostly ignored (except for a small
> few)

It looks like a clean solution. Stephen may know more caveats about it.

> This can also be a central location to see what's being developed. I
> would even publish where the branches are being pulled from, so if
> people want to know more about the development they can find it.
> 
> I really have no clue about all the great things going on in development
> of parts of linux, and I'm sure there's things going on that I do not
> know about that I would like to look in to. This can be a way to show
> what's being done.

FYI, I've added about 170 git trees as my test targets, which contain
about 550 active branches. I enjoy a lot looking at the freshly cooked
commits being compiled and ran to the degree to keep the servers busy
all day :-)

> If you do not have the time to set up such a repo, I'm willing to do it.
> I just do not have the hardware to do the testing that should be done,
> but as it would be public, others could test it, and report back to me.

Yeah either way is possible and I can sure carry out tests on it. But
IMHO Stephen could be the perfect candidate to maintain the tree :)

Thanks,
Fengguang
