From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: input tree build failure
Date: Wed, 20 Aug 2008 11:35:59 -0700
Message-ID: <20080820183559.GA26064@kroah.com>
References: <20080819163148.159c7d8c.sfr@canb.auug.org.au> <20080819200057.GD10502@kroah.com> <20080820154924.51ac3495.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:39996 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752175AbYHTSk2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Aug 2008 14:40:28 -0400
Content-Disposition: inline
In-Reply-To: <20080820154924.51ac3495.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, "Alfred E. Heggestad" <aeh@db.org>

On Wed, Aug 20, 2008 at 03:49:24PM +1000, Stephen Rothwell wrote:
> Hi Greg, Dmitry,
> 
> On Tue, 19 Aug 2008 13:00:57 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > No, these should all use dev_info() instead.
> > 
> > Actually, they should all use dev_dbg() and drop the #if entirely.  With
> > the dynamic dev_dbg() patch that is in -next, that will work just fine,
> > no need to rebuild modules which is almost impossible for most users to
> > do.
> 
> Today I used the following patch instead.  Dmitry, this should be able to
> be applied to your tree (I think) assuming that it is OK.

Looks good to me.

thanks,

greg k-h
