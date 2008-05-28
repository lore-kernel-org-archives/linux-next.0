From: Greg KH <greg@kroah.com>
Subject: Re: linux-next 20080526 build failure with CONFIG_BLOCK=y and
	CONFIG_PROC_FS is not set
Date: Tue, 27 May 2008 20:57:40 -0700
Message-ID: <20080528035740.GA7845@kroah.com>
References: <1211794094.4408.3.camel@localhost> <20080526092224.83555d09.randy.dunlap@oracle.com> <20080528123416.c0bf2a0a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:42715 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbYE1EAh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 May 2008 00:00:37 -0400
Content-Disposition: inline
In-Reply-To: <20080528123416.c0bf2a0a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Philippe Roussel <p.o.roussel@free.fr>, linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>

On Wed, May 28, 2008 at 12:34:16PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 26 May 2008 09:22:24 -0700 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> >
> > On Mon, 26 May 2008 11:28:14 +0200 Philippe Roussel wrote:
> > 
> > > I got this
> > > 
> > >   CC      block/genhd.o
> > > block/genhd.c: In function 'diskstats_start':
> > > block/genhd.c:555: error: 'find_start' undeclared (first use in this
> > > function)
> > > block/genhd.c:555: error: (Each undeclared identifier is reported only
> > > once
> > > block/genhd.c:555: error: for each function it appears in.)
> > > 
> > > while building the following config
> > 
> > I sent a patch for this last Friday:
> >   http://lkml.org/lkml/2008/5/23/255
> 
> Did you see this?

Ah, no, sorry, I totally missed it.

Randy, I've put your patch in my queue, in a place that keeps the build
error from ever happening.  Thanks for pointing it out.

greg k-h
