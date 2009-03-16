From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: New linux-next tree suspend-2.6
Date: Mon, 16 Mar 2009 23:13:43 +0100
Message-ID: <200903162313.44285.rjw@sisk.pl>
References: <200903151754.37147.rjw@sisk.pl> <20090316131647.48d632fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:51006 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752428AbZCPWNj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 18:13:39 -0400
In-Reply-To: <20090316131647.48d632fb.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Jesse Barnes <jbarnes@virtuousgeek.org>

On Monday 16 March 2009, Stephen Rothwell wrote:
> Hi Rafael,

Hi,

> On Sun, 15 Mar 2009 17:54:36 +0100 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
> >
> > Here's a new tree for linux-next:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/rafael/suspend-2.6.git linux-next
> > 
> > It is based on the Linus' current tree, but I can rebase it on top of anything
> > else if that helps.
> 
> Linus' tree is good as a base.
> 
> > Unfortunately, it has two merge conflict that I'm not sure how to resolve.
> 
> Thanks for the suggested resolutions.
> 
> > The first one is with the linux-next branch of pci-2.6 and it may be resolved
> > by applying the appended patch on top of pci-2.6/linux-next before
> > merging suspend-2.6/linux-next.
> 
> I notice that your resolution is to revert a patch from the pci tree.  As
> an alternative, you could apply the pci tree patch to your tree (which is
> what I will effectively do today when I resolve the conflict).
> 
> OK, its a bit late in the cycle to be adding stuff for 2.6.30, but I will
> add your tree from today and we will see how it goes.

Thanks!

It's late, because it's been discussed a lot recently, but the patches are
really important (and supported by Linus ;-)).

> What I tell everyone: all patches/commits in the tree/series must
> have been:
> 
> 	posted to a relevant mailing list
> 	reviewed
> 	unit tested
> 	destined for the next merge window (or the current release)
> 
> *before* they are included.

This applies to all of the patches currently in the suspend tree. :-)

> The linux-next tree is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.

Sure.

Thanks,
Rafael
