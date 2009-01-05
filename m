From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Sun, 4 Jan 2009 20:34:39 -0800
Message-ID: <20090105043439.GA4442@kroah.com>
References: <20081222113335.667c2d01.sfr@canb.auug.org.au> <200812230226.29519.inaky@linux.intel.com> <20081223171726.GB4043@kroah.com> <200812231707.25796.inaky@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40643 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752227AbZAEEhz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 4 Jan 2009 23:37:55 -0500
Content-Disposition: inline
In-Reply-To: <200812231707.25796.inaky@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, Dec 23, 2008 at 05:07:25PM -0800, Inaky Perez-Gonzalez wrote:
> On Tuesday 23 December 2008, Greg KH wrote:
> > On Tue, Dec 23, 2008 at 02:26:28AM -0800, Inaky Perez-Gonzalez wrote:
> > > On Monday 22 December 2008, Greg KH wrote:
> > > > On Mon, Dec 22, 2008 at 09:26:43AM -0800, Inaky Perez-Gonzalez wrote:
> > > > > On Sunday 21 December 2008, Sam Ravnborg wrote:
> > > > >
> > > > > ops -- ok, I will. I guess I have to add this in all the similar
> > > > > ones, right?
> > > > >
> > > > > Greg, do you want a new patch series or just another patch on top?
> > > >
> > > > Just a single replacement patch for when we add this makefile is fine
> > > > with me.
> > >
> > > Hmmm, there was more feedback Sam gave me on Kconfig and Makefiles I
> > > added, so at the end the patch touches more files than just this one.
> > > Maybe a whole new series will be the way to go.
> >
> > Ick, I really don't want that.  But feel free to respin them yourself,
> > and then just send the different patches?  It's easy to just replace a
> > few individual ones than to drop the whole series and redo it (well on
> > my end at least...)
> >
> > Heck, tell me what to edit and I can edit individual patches quite
> > easily as well, I'd rather do that as well :)
> 
> :) -- find them attached, it's just a couple of them that need a respin
> (#10 and #27).

Thanks, I've now replaced these in my tree and pushed it on out.

greg k-h
