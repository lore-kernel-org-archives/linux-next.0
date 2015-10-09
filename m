From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Fri, 9 Oct 2015 12:01:55 +0530
Message-ID: <20151009063155.GM18898@linux>
References: <20151007155146.41c4528f@canb.auug.org.au>
 <1846544.jnahGernn9@vostro.rjw.lan>
 <20151008070954.GE4570@linux>
 <80267074.mzAFagpz1h@vostro.rjw.lan>
 <20151009163641.11f80b1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:35742 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754594AbbJIGcA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2015 02:32:00 -0400
Received: by pabve7 with SMTP id ve7so19012379pab.2
        for <linux-next@vger.kernel.org>; Thu, 08 Oct 2015 23:32:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20151009163641.11f80b1a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Greg KH <greg@kroah.com>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 09-10-15, 16:36, Stephen Rothwell wrote:
> Hi Rafael,
> 
> On Thu, 08 Oct 2015 22:30:45 +0200 "Rafael J. Wysocki" <rjw@rjwysocki.net> wrote:
> >
> > On Thursday, October 08, 2015 12:39:54 PM Viresh Kumar wrote:
> > > 1840995c52d4 PM / OPP: reuse of_parse_phandle()
> > > f0489a5ef4d0 PM / OPP: Rename opp init/free table routines
> > > 8f8d37b2537a PM / OPP: Prefix exported opp routines with dev_pm_opp_
> > > 33692dc381f9 PM / OPP: Move opp core to its own directory
> > > f59d3ee8480d PM / OPP: Move cpu specific code to opp/cpu.c
> > > 5cb5fdbf3877 PM / OPP: Add debugfs support
> > > 
> > > I though you just dropped the last commit, but no.
> > 
> > My bad, I rebased the pm-opp branch, but then have forgotten to merge it.
> > 
> > Sorry about that, should be fixed now.
> 
> And the warnings are back :-)

Rafael did it incorrectly once again :)

He picked the faulty patch once again, which he should have dropped.

> Can someone (Viresh) just send me a patch on top of today's linux-next
> (when I release it) and I will us it as a merge fix patch from Monday
> and then hopefully it will be passed on to Linus at the right time.

Because that's what Rafael is going to do once he is back, can can
just revert

5cb5fdbf3877 PM / OPP: Add debugfs support

for the time being. Will that be fine?

-- 
viresh
