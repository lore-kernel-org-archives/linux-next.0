From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Thu, 08 Oct 2015 22:30:45 +0200
Message-ID: <80267074.mzAFagpz1h@vostro.rjw.lan>
References: <20151007155146.41c4528f@canb.auug.org.au> <1846544.jnahGernn9@vostro.rjw.lan> <20151008070954.GE4570@linux>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151008070954.GE4570@linux>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thursday, October 08, 2015 12:39:54 PM Viresh Kumar wrote:
> On 08-10-15, 00:47, Rafael J. Wysocki wrote:
> > Well, the conflicting commits here were from the same developer which is kind
> > of annoying.
> 
> I do understand why its annoying, but I wasn't doing them in parallel.
> The patches in Greg's tree were written long after the other series
> got applied to your tree.
> 
> So, I was kind of helpless here :(

You could have asked me to drop that commit when you decided to rework the API.

That would have been much less painful to everybody (and especially to the
people who saw the breakage and have tried to fix it).

> > The new use in my tree can wait until the API update in the Greg's tree is
> > merged IMO.  That's why I've now dropped the commit that added it. :-)
> 
> Looking at the current state of your tree, looks like you have dropped
> way too many patches. Was it intentional?
> 
> Missing commits:
> 
> 1840995c52d4 PM / OPP: reuse of_parse_phandle()
> f0489a5ef4d0 PM / OPP: Rename opp init/free table routines
> 8f8d37b2537a PM / OPP: Prefix exported opp routines with dev_pm_opp_
> 33692dc381f9 PM / OPP: Move opp core to its own directory
> f59d3ee8480d PM / OPP: Move cpu specific code to opp/cpu.c
> 5cb5fdbf3877 PM / OPP: Add debugfs support
> 
> I though you just dropped the last commit, but no.

My bad, I rebased the pm-opp branch, but then have forgotten to merge it.

Sorry about that, should be fixed now.

Thanks,
Rafael
