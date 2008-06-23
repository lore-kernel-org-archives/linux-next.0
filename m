From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] m68knommu: ColdFire add support for kernel preemption
Date: Sun, 22 Jun 2008 22:51:02 -0700
Message-ID: <20080622225102.5117f22b.akpm@linux-foundation.org>
References: <200805010216.m412GT6t004096@goober>
	<20080501143336.552e39e1.akpm@linux-foundation.org>
	<481AC07A.6080707@snapgear.com>
	<20080502083755.GA13973@Chamillionaire.breakpoint.cc>
	<20080502052235.eb9c336a.akpm@linux-foundation.org>
	<485F3585.2080606@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:50932 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756162AbYFWFvS (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 01:51:18 -0400
In-Reply-To: <485F3585.2080606@snapgear.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Mon, 23 Jun 2008 15:32:53 +1000 Greg Ungerer <gerg@snapgear.com> wrote:

> Hi Andrew,
> 
> Andrew Morton wrote:
> > On Fri, 2 May 2008 10:37:55 +0200 Sebastian Siewior <lkml@ml.breakpoint.cc> wrote:
> > 
> >>>>> Subject: [PATCH] m68knommu: ColdFire add support for kernel preemption
> >>>> Please find a way to get your patch queue into linux-next so that others
> >>>> get some visibility into what you're brewing earlier than
> >>>> last-day-of-the-merge-window?
> >>> Is a git tree the only way?
> >> Others (Greg KH for instance, i2c) have quilt queues.
> > 
> > Yup.  Examples:
> > 
> > ftp://ftp.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/
> > http://ozlabs.org/~rusty/kernel/rr-latest
> > http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/gregkh-02-usb
> > 
> > Note how you can publish subsets of your patchset by bracketing them with
> > "# MM_PATCHES_START" and "# MM_PATCHES_END" for -mm, and "#
> > NEXT_PATCHES_START" and "# NEXT_PATCHES_END" for linux-next.
> 
> I decided to go the git route.
> 
> Here is a git tree for the collection of patches for the m68knommu
> architecture that I intend for the 2.6.27 merge window.
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus
> 
> I have created a general uclinux changes git tree as well,
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/uclinux.git for-linus
> 
> though currently I have nothing queued for that.
> 

Great, thanks.  But can we get them into linux-next please?  I'll pick
them up via that route.
