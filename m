From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: ttydev tree build failure
Date: Tue, 1 Jul 2008 08:27:04 -0700
Message-ID: <20080701152704.GB3973@kroah.com>
References: <20080702001740.9bbea0df.sfr@canb.auug.org.au> <20080701152302.07cdba1e@lxorguk.ukuu.org.uk> <20080702005134.d07261ad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:43717 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757768AbYGAPbH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 11:31:07 -0400
Content-Disposition: inline
In-Reply-To: <20080702005134.d07261ad.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org

On Wed, Jul 02, 2008 at 12:51:34AM +1000, Stephen Rothwell wrote:
> Hi Alan,
> 
> On Tue, 1 Jul 2008 15:23:02 +0100 Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> >
> > > It could easily (probably) have been the merge.
> > > 
> > > I have reverted the ttydev tree for now.  I am not sure quite where we go
> > > from here.
> > 
> > Well I expected there would be a few explosions from merging a large new
> > tree in. No problem. As soon as the new tree is done and out I will
> > regenerate the patch set versus that which should iron out all the
> > firmware clashes and the like.
> 
> One downsides of the way linux-next works is that, because it is
> recreated every day, you cannot really base anything on it that is to be
> merged into it.
> 
> I really need to think about this when I am awake :-(

As there were a lot of merge issues with my tree, I don't mind putting
this in my queue if needed.

I had started to merge it in, and handled lots of these merge issues in
my tree pretty easily, so if needed, I can put it all back in there to
help with this problem.

thanks,

greg k-h
