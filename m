From: Chris Mason <chris.mason@fusionio.com>
Subject: Re: [GIT PULL] Btrfs for linux-next
Date: Mon, 1 Oct 2012 21:36:18 -0400
Message-ID: <20121002013618.GA1140@shiny>
References: <20120930115258.GA13506@shiny>
 <20121001181549.817cc2d7d0d660eb593922fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.fusionio.com ([66.114.96.30]:33208 "EHLO mx1.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752282Ab2JBBgX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Oct 2012 21:36:23 -0400
Content-Disposition: inline
In-Reply-To: <20121001181549.817cc2d7d0d660eb593922fd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chris Mason <clmason@fusionio.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Mon, Oct 01, 2012 at 02:15:49AM -0600, Stephen Rothwell wrote:
> Hi Chris,
> 
> On Sun, 30 Sep 2012 07:52:58 -0400 Chris Mason <chris.mason@fusionio.com> wrote:
> >
> > This is our large queue of changes for linux-next.  They vary from bug
> > fixes to huge optimizations.  It also includes a new disk format feature
> > from suse to remove a restriction on the number of hardlinks to a single
> > file in a single dir.
> > 
> > I tested against linux-next on Friday, it was a clean merge and passes
> > xfstests.
> > 
> > Just let me know if there are any problems, thanks!  The changes are in
> > my next branch
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs.git next
> 
> I added your tree today, but as you have seen it broke :-(

Hi Steve,

Sorry for the hassle, we've updated that patch and rebased the tree:

git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs.git next

-chris
