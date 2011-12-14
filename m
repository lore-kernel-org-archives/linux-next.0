From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 14 Dec 2011 07:03:59 -0800
Message-ID: <20111214150359.GA840@kroah.com>
References: <20111214154844.3ad4e1d685c7987cba0820a0@canb.auug.org.au>
 <1323854697.28489.7.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1323854697.28489.7.camel@twins>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Dec 14, 2011 at 10:24:57AM +0100, Peter Zijlstra wrote:
> On Wed, 2011-12-14 at 15:48 +1100, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > After merging the driver-core tree, today's linux-next build
> > (powerpc_ppc64_defconfig) failed like this:
> > 
> > In file included from include/linux/slab.h:185:0,
> >                  from include/linux/kref.h:19,
> >                  from include/linux/kobject.h:24,
> >                  from include/linux/sysdev.h:24,
> >                  from include/linux/node.h:17,
> >                  from include/linux/swap.h:10,
> >                  from include/linux/suspend.h:4,
> >                  from arch/powerpc/kernel/asm-offsets.c:24:
> > include/linux/slub_def.h:100:17: error: field 'kobj' has incomplete type
> > 
> > Caused by commit 4af679cd7cbb ("kref: Inline all functions") ... we now
> > have kref.h -> slab.h -> slub_def.h -> kobject.h -> kref.h when
> > CONFIG_SLUB is set.
> 
> Egads, that's nasty.. 
> 
> The nicest thing I can come up with is something like the below, but its
> not all that nice at all :/

I'll remove the use of kfree in the WARN_ON(), which should solve this
problem.

greg k-h
