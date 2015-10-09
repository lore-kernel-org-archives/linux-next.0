From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Fri, 9 Oct 2015 16:36:41 +1100
Message-ID: <20151009163641.11f80b1a@canb.auug.org.au>
References: <20151007155146.41c4528f@canb.auug.org.au>
	<1846544.jnahGernn9@vostro.rjw.lan>
	<20151008070954.GE4570@linux>
	<80267074.mzAFagpz1h@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33610 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750913AbbJIFgm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 9 Oct 2015 01:36:42 -0400
In-Reply-To: <80267074.mzAFagpz1h@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Greg KH <greg@kroah.com>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Rafael,

On Thu, 08 Oct 2015 22:30:45 +0200 "Rafael J. Wysocki" <rjw@rjwysocki.net> wrote:
>
> On Thursday, October 08, 2015 12:39:54 PM Viresh Kumar wrote:
> > 1840995c52d4 PM / OPP: reuse of_parse_phandle()
> > f0489a5ef4d0 PM / OPP: Rename opp init/free table routines
> > 8f8d37b2537a PM / OPP: Prefix exported opp routines with dev_pm_opp_
> > 33692dc381f9 PM / OPP: Move opp core to its own directory
> > f59d3ee8480d PM / OPP: Move cpu specific code to opp/cpu.c
> > 5cb5fdbf3877 PM / OPP: Add debugfs support
> > 
> > I though you just dropped the last commit, but no.
> 
> My bad, I rebased the pm-opp branch, but then have forgotten to merge it.
> 
> Sorry about that, should be fixed now.

And the warnings are back :-)

Can someone (Viresh) just send me a patch on top of today's linux-next
(when I release it) and I will us it as a merge fix patch from Monday
and then hopefully it will be passed on to Linus at the right time.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
