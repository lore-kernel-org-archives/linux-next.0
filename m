From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Wed, 29 Apr 2009 08:16:18 -0700
Message-ID: <20090429151618.GD16302@kroah.com>
References: <20090429171752.f70c7de1.sfr@canb.auug.org.au> <20090429141519.GA3112@kroah.com> <20090430010057.d5a98bf9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:54168 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755920AbZD2PlB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 11:41:01 -0400
Content-Disposition: inline
In-Reply-To: <20090430010057.d5a98bf9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>

On Thu, Apr 30, 2009 at 01:00:57AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Wed, 29 Apr 2009 07:15:19 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > They were all posted on the linux-usb mailing list, as they are a new
> > USB controller (for USB 3.0), so they didn't need to be sent to lkml.
> > 
> > But yes, the code does still need work, that is known, but a build
> > failure wasn't known :)
> 
> This is what I tell maintainers of new trees being integrated into
> linux-next:
> 
> "all patches/commits in the tree/series must have been:
> 
> 	posted to a relevant mailing list
> 	reviewed
> 	unit tested
> 	destined for the next merge window (or the current release)

All of these are true for this code.

> *before* they are included.  The linux-next tree is for integration
> testing and to lower the impact of conflicts between subsystems in the
> next merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary."

Yes, thanks, I went on the fact that this code has been shown to work,
and is self-contained (new driver).  Yes, it will need some work, and
your build log certainly showed that (I already let Sarah know about the
build warnings that I had seen).

I had missed the global names that were not unique, and thank you for
that, I'll go resolve it.

thanks,

greg k-h
