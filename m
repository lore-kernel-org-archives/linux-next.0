From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Fri, 09 Oct 2015 22:49:01 +0200
Message-ID: <6843005.GubNQ8qNhC@vostro.rjw.lan>
References: <20151007155146.41c4528f@canb.auug.org.au> <20151009163641.11f80b1a@canb.auug.org.au> <20151009063155.GM18898@linux>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:64744 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751678AbbJIUU2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2015 16:20:28 -0400
In-Reply-To: <20151009063155.GM18898@linux>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Friday, October 09, 2015 12:01:55 PM Viresh Kumar wrote:
> On 09-10-15, 16:36, Stephen Rothwell wrote:
> > Hi Rafael,
> > 
> > On Thu, 08 Oct 2015 22:30:45 +0200 "Rafael J. Wysocki" <rjw@rjwysocki.net> wrote:
> > >
> > > On Thursday, October 08, 2015 12:39:54 PM Viresh Kumar wrote:
> > > > 1840995c52d4 PM / OPP: reuse of_parse_phandle()
> > > > f0489a5ef4d0 PM / OPP: Rename opp init/free table routines
> > > > 8f8d37b2537a PM / OPP: Prefix exported opp routines with dev_pm_opp_
> > > > 33692dc381f9 PM / OPP: Move opp core to its own directory
> > > > f59d3ee8480d PM / OPP: Move cpu specific code to opp/cpu.c
> > > > 5cb5fdbf3877 PM / OPP: Add debugfs support
> > > > 
> > > > I though you just dropped the last commit, but no.
> > > 
> > > My bad, I rebased the pm-opp branch, but then have forgotten to merge it.
> > > 
> > > Sorry about that, should be fixed now.
> > 
> > And the warnings are back :-)
> 
> Rafael did it incorrectly once again :)
> 
> He picked the faulty patch once again, which he should have dropped.

Right, sorry about that.

It should be gone now for real.

Thanks,
Rafael
