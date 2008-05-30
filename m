From: Greg KH <greg@kroah.com>
Subject: Re: dev_set_name (Was: linux-next: rr/driver-core merge conflicts)
Date: Thu, 29 May 2008 19:37:50 -0700
Message-ID: <20080530023750.GA5787@kroah.com>
References: <20080529155818.6e298a47.sfr@canb.auug.org.au> <20080529160944.GA10595@kroah.com> <20080530102154.2f9798a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:51164 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752351AbYE3CoB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2008 22:44:01 -0400
Content-Disposition: inline
In-Reply-To: <20080530102154.2f9798a5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Kay Sievers <kay.sievers@vrfy.org>, linux-next@vger.kernel.org

On Fri, May 30, 2008 at 10:21:54AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Thu, 29 May 2008 09:09:44 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > On Thu, May 29, 2008 at 03:58:18PM +1000, Stephen Rothwell wrote:
> > 
> > > Greg, is there some way we could add a version of dev_set_name() to
> > > current mainline now so that the conversions can be farmed out (or at
> > > least be done in other trees destined for linux-next)?
> > 
> > Yes, I'll do that today, thanks for the idea.
> 
> I was hoping for something really simple that even Linus would take -
> like below (compile tested only).

Yes, I was trying to be "fancy" and actually make it work :)

I'll go merge your sane version in and send it to Linus, should help out
a lot.

thanks,

greg k-h
