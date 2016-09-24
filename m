From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Sep 21
Date: Sat, 24 Sep 2016 09:28:00 +0200
Message-ID: <20160924072800.GC4462@kroah.com>
References: <20160921160838.71395247@canb.auug.org.au>
 <CA+55aFwS6i_N3nUrEiD8aRt_1HjScKG7S8a2sREs0Sv1eJsrAQ@mail.gmail.com>
 <20160924104245.0d6429c1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:46511 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933908AbcIXH14 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Sep 2016 03:27:56 -0400
Content-Disposition: inline
In-Reply-To: <20160924104245.0d6429c1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Sep 24, 2016 at 10:42:45AM +1000, Stephen Rothwell wrote:
> Hi Linus,
> 
> On Fri, 23 Sep 2016 11:24:04 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, Sep 20, 2016 at 11:08 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Changes since 20160920:
> > > [...]
> > > Non-merge commits (relative to Linus' tree): 11180
> > >  8424 files changed, 456474 insertions(+), 237951 deletions(-)  
> > 
> > What happened here? The previous linux-next tree was much smaller. The
> > "changes since" part doesn't actually talk about the almost 3000 new
> > non-merge commits that very suddenly showed up.
> 
> That was Greg's (cc'd) greybus stuff entering the staging tree:
> 
> $ git rev-list --count --no-merges origin/master..2bbadafbe4ea
> 2363

This is a staging driver (new hardware bus and drivers), self-contained,
and the development history of the code was preserved by importing it
this way.

The overall size of the kernel only grew by 35k of lines or so, not
much, but yes, the history did jump all at once.  Much like when we
imported btrfs the same way.

thanks,

greg k-h
