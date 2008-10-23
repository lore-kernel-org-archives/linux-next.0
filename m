From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linuxt-next: nfsd strange commit
Date: Wed, 22 Oct 2008 22:55:29 -0400
Message-ID: <20081023025529.GA11477@fieldses.org>
References: <20081021141357.ab15406f.sfr@canb.auug.org.au> <20081021132059.GA8029@fieldses.org> <20081023093004.b061d357.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:34487 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751822AbYJWCzd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 22:55:33 -0400
Content-Disposition: inline
In-Reply-To: <20081023093004.b061d357.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Thu, Oct 23, 2008 at 09:30:04AM +1100, Stephen Rothwell wrote:
> Hi Bruce,
> 
> On Tue, 21 Oct 2008 09:20:59 -0400 "J. Bruce Fields" <bfields@fieldses.org> wrote:
> >
> > I've also been acting as a (somewhat inconsistent) locks.c maintainer.
> > 
> > Would it make it any easier if I kept a locks-next branch that you could
> > pull separately?  Or should I try to get that stuff into some other
> > tree?
> 
> A separate branch is possible, but if it is only one or two commits it is
> hardly worth it.  Lets see how it goes.

OK.

> However (I don't mean to pick on you, really :-)) your current tree has a
> merge that says "Merge branch 'for-2.6.29' into for-mm".  I (and Andrew)
> really don't want any 2.6.29 stuff in linux-next until after 2.6.28-rc1 -
> it just muddies the conflicts.  So can you remove that merge for now (its
> only a few days) and I will revert that merge in linux-next today.

Whoops.  OK, hopefully the current nfsd-next is more to your liking....

--b.
