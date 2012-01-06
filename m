From: Mike Galbraith <efault@gmx.de>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 06 Jan 2012 08:22:40 +0100
Message-ID: <1325834560.6233.62.camel@marge.simson.net>
References: <20120105182949.e35b2430b915b50e4bb9bc04@canb.auug.org.au>
	 <20120105155233.0d367bc3.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120105155233.0d367bc3.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dimitri Sivanich <sivanich@sgi.com>, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

On Thu, 2012-01-05 at 15:52 -0800, Andrew Morton wrote:
> On Thu, 5 Jan 2012 18:29:49 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Andrew,
> > 
> > After merging the akpm tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > kernel/time/tick-sched.c:874:7: warning: 'struct sysdev_attribute' declared inside parameter list [enabled by default]
> >
> > ...
> >
> > Caused by commit 629d589817da ("tick-sched: add specific do_timer_cpu
> > value for nohz off mode") interacting with the removal of sysdevs in the
> > driver-core tree.  This patch will need reworking for that.
> > 
> > I have reverted that commit for today.
> 
> Bah.  I dropped it.

Hm.  I was looking at that patch, and wondering if it wouldn't be better
to twiddle cpusets to allow the user to tell the scheduler and friends
that certain CPUs are being used for HPC instead.  We do isolation there
now, letting the user nuke scheduler domains, so it looks like the right
spot to extend isolation.

I'm trying that out, because I found that the rt push/pull logic adds
useless overhead and jitter to isolated/pinned rt loads.  We can let
exclusive cpusets turn nohz on/off, and/or rt push/pull.. and a set
could be immunized from becoming jiffies maintainer, or any other
unsavory and not 100% required duty, with a per cpu flag read as well.

	-Mike
